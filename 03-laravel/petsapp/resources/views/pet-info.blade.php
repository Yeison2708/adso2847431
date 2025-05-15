<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información de la mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-gray-100">
    @foreach ($pets as $pet)
        <!-- Modal -->
        <dialog id="my_modal_1" class="modal">
            <div class="modal-box max-w-xl">
                <h3 class="text-xl font-bold mb-4 text-center">Información de la mascota</h3>

                <div class="card bg-base-100 shadow-sm">
                    <!-- Imagen centrada -->
                    <figure class="flex justify-center items-center p-4">
                        <img src="{{ asset('http://127.0.0.1:8000/images/no-imagage.png' . $pet->image) }}" alt="{{ $pet->name }}"
                            class="w-40 h-40 object-cover rounded-lg" />
                    </figure>

                    <!-- Información -->
                    <div class="card-body">
                        <h2 class="card-title justify-between">
                            {{ $pet->name }}
                            <div class="badge badge-secondary">{{ $pet->kind }}</div>
                        </h2>

                        <div class="text-left space-y-1 mt-2">
                            <p><strong>Nombre:</strong> <span id="modalName">{{ $pet->name }}</span></p>
                            <p><strong>Tipo:</strong> <span id="modalKind">{{ $pet->kind }}</span></p>
                            <p><strong>Peso:</strong> <span id="modalWeight">{{ $pet->weight }}</span></p>
                            <p><strong>Edad:</strong> <span id="modalAge">{{ $pet->age }}</span></p>
                            <p><strong>Raza:</strong> <span id="modalBreed">{{ $pet->breed }}</span></p>
                            <p><strong>Ubicación:</strong> <span id="modalLocation">{{ $pet->location }}</span></p>
                            <p><strong>Descripción:</strong> <span id="modalDescription">{{ $pet->description }}</span></p>
                        </div>

                        <!-- Botón cerrar con retorno a la página anterior -->
                        <div class="card-actions justify-end mt-4">
                            <button class="btn btn-sm btn-outline" onclick="window.history.back();">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </dialog>
    @endforeach

    <!-- Script para abrir el modal automáticamente -->
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const modal = document.getElementById('my_modal_1');
            if (modal) {
                modal.showModal();
            }
        });
    </script>
</body>

</html>
