<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pets')->insert([
            'name' => 'Firulais',
            'kind' => 'skinwalker',
            'weight' => '80',
            'age'=> '24',
            'breed' => 'Demoniaca',
            'location' => 'Kioto',
            'description' => 'Tiene cancer y es el terror andante de la ciudad, ademas en el dia mide 20 cm y en la noche 2 metros y le gusta robar las almas de los niños',
            'created_at'=> now()
        ]);

        DB::table('pets')->insert([
            'name' => 'Michi',
            'kind' => 'Cthulhu',
            'weight' => '100',
            'age'=> '12',
            'breed' => 'Rompe Hogares',
            'location' => 'La calle de la amargura',
            'description' => 'Es un gato que en realidad es un ser de otra dimension y le gusta destruir matrimonios',
            'created_at'=> now()
        ]);

        DB::table('pets')->insert([
            'name'=>'Killer',
            'Kind'=>'Dog',
            'weight'=> '50',
            'age'=>'48',
            'breed'=>'Pincher',
            'location'=>'Tokio',
            'description'=>'El perro mas peligroso de la ciudad y el destructor de mundos',
            'created_at'=>now()
        ]);
    }
}
