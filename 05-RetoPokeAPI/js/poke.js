const listaPokemones = document.querySelector(".pokemones");
        const generacionPk = document.querySelector(".generacion-pk");
        const infoPokemonPanel = document.querySelector("#info-pokemon-panel");
        const infoContenidoPokemon = document.querySelector(".info-contenido-pokemon");
        const cargador = document.querySelector(".cargador");

        const generaciones = {
            rango: [
                { desde: 1, hasta: 151 }, // Generación 1
                { desde: 152, hasta: 251 }, // Generación 2
                { desde: 252, hasta: 386 }, // Generación 3
                { desde: 387, hasta: 493 }, // Generación 4
                { desde: 494, hasta: 649 }, // Generación 5
                { desde: 650, hasta: 721 }, // Generación 6
                { desde: 722, hasta: 809 }, // Generación 7
                { desde: 810, hasta: 890 }, // Generación 8
                { desde: 891, hasta: 1025 }, // Generación 9 (actualizado para incluir los últimos pokemon)
            ],
        };

        const tipos = {
            normal: "#a8a77a",
            fire: "#ee8130",
            water: "#6390f0",
            electric: "#f7d02c",
            grass: "#7ac74c",
            ice: "#96d9d6",
            fighting: "#c22e28",
            poison: "#a33ea1",
            ground: "#e2bf65",
            flying: "#a98ff3",
            psychic: "#f95587",
            bug: "#a6b91a",
            rock: "#b6a136",
            ghost: "#735797",
            dragon: "#6f35fc",
            dark: "#705746",
            steel: "#b7b7ce",
            fairy: "#d685ad",
            shadow: "#5a5a5a",
            unknown: "#68a090",
        };

        generaciones.rango.forEach((_, indice) => {
            generacionPk.innerHTML += `<option value="${indice}">Generación ${indice + 1}</option>`;
        });

        generacionPk.addEventListener("change", function () {
            const indiceGeneracion = this.value;
            if (indiceGeneracion === "") {
                listaPokemones.innerHTML = "";
                infoContenidoPokemon.innerHTML = "";
                infoPokemonPanel.setAttribute('data-nombre-pokemon', '');
                return;
            }
            const { desde, hasta } = generaciones.rango[indiceGeneracion];
            cargarPokemones(desde, hasta);
        });

        const cargarPokemones = async (desde, hasta) => {
            cargador.classList.remove("ocultar");
            listaPokemones.innerHTML = "";

            const promesasPokemones = [];
            for (let pk = desde; pk <= hasta; pk++) {
                promesasPokemones.push(
                    fetch(`https://pokeapi.co/api/v2/pokemon/${pk}`)
                        .then(res => res.json())
                        .catch(e => {
                            console.error(`Error al cargar pokemon ${pk}:`, e);
                            return null;
                        })
                );
            }

            const todosDatosPokemon = await Promise.all(promesasPokemones);

            todosDatosPokemon.forEach(datos => {
                if (!datos) return;
                const tipo = datos.types.length > 0 ? datos.types[0].type.name : 'unknown';
                const iconoTipo = `<img src="https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/${tipo}.svg" width="20" />`;
                listaPokemones.innerHTML += `
                    <li class="pokemon-item" data-id="${datos.id}" data-name="${capitalizar(datos.name)}" data-color-tipo="${tipos[tipo]}">
                        <div class="columna1">
                            <strong>${capitalizar(datos.name)}</strong>
                            ${iconoTipo}
                            <small>#${datos.id}</small>
                        </div>
                        <div class="columna2">
                            <img src="${datos.sprites.front_default}" alt="${datos.name}" />
                        </div>
                    </li>`;
            });

            cargador.classList.add("ocultar");
            // Seleccionar el primer pokemon si la lista no está vacía
            if (listaPokemones.children.length > 0) {
                listaPokemones.children[0].click();
            } else {
                infoContenidoPokemon.innerHTML = "";
                infoPokemonPanel.setAttribute('data-nombre-pokemon', '');
            }
        };

        function capitalizar(cadena) {
            return cadena.charAt(0).toUpperCase() + cadena.slice(1);
        }

        listaPokemones.addEventListener("click", (e) => {
            const li = e.target.closest("li.pokemon-item");
            if (li) {
                document.querySelectorAll('.pokemon-item').forEach(item => {
                    item.classList.remove('pokemon-seleccionado');
                });
                li.classList.add('pokemon-seleccionado');

                const id = li.dataset.id;
                const nombre = li.dataset.name;
                infoPokemonPanel.setAttribute('data-nombre-pokemon', nombre);
                mostrarInfoPokemon(id);
            }
        });

        async function mostrarInfoPokemon(id) {
            infoContenidoPokemon.innerHTML = "<p class='cargador'>Cargando...</p>";
            const res = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
            const datos = await res.json();
            const tipo = datos.types.length > 0 ? datos.types[0].type.name : 'unknown';
            const color = tipos[tipo] || tipos.unknown;

            let spriteUrl = null;

            // Priorizar sprites animados de generaciones más recientes
            if (datos.sprites.versions && datos.sprites.versions['generation-v'] &&
                datos.sprites.versions['generation-v']['black-white'] &&
                datos.sprites.versions['generation-v']['black-white'].animated &&
                datos.sprites.versions['generation-v']['black-white'].animated.front_default) {
                spriteUrl = datos.sprites.versions['generation-v']['black-white'].animated.front_default;
            }
            // Luego, intentar con los sprites de showdown (pueden ser spritesheets o GIFs)
            else if (datos.sprites.other && datos.sprites.other['showdown'] && datos.sprites.other['showdown'].front_default) {
                spriteUrl = datos.sprites.other['showdown'].front_default;
            }
            // Si no hay animaciones, usar el artwork oficial de mayor calidad
            else if (datos.sprites.other && datos.sprites.other['official-artwork'] && datos.sprites.other['official-artwork'].front_default) {
                spriteUrl = datos.sprites.other['official-artwork'].front_default;
            }
            // Finalmente, si todo lo demás falla, usar el sprite frontal por defecto (estático)
            else {
                spriteUrl = datos.sprites.front_default;
            }

            const htmlEstadisticas = datos.stats.map((s) => {
                const porcentaje = Math.min(100, (s.base_stat / 200) * 100).toFixed(0);
                return `
                    <div>
                        <strong>${capitalizar(s.stat.name)}: ${s.base_stat}</strong>
                        <div style="background:#222;">
                            <div style="width:${porcentaje}%;background:var(--color-estadistica);"></div>
                        </div>
                    </div>
                `;
            }).join("");

            infoContenidoPokemon.innerHTML = `
                <img src="${spriteUrl}" alt="${datos.name}" />
                ${htmlEstadisticas}
            `;
            infoContenidoPokemon.style.setProperty('--color-estadistica', color);
        }

        // Cargar la primera generación al inicio
        cargarPokemones(1, 151);