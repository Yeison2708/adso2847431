<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = new User;
        $user->document = 75000001;
        $user->fullname = "John Wick";
        $user->gender = "Male";
        $user->birthdate = "1980-10-10";
        $user->phone = 32056373456;
        $user->email = 'jwick@gmail.com';
        $user->password = bcrypt("admin");
        $user->role = "Admin";
        $user->save();

        $user = new User;
        $user->document = 75000002;
        $user->fullname = "Lara Croft";
        $user->gender = "Female";
        $user->birthdate = "1994-08-05";
        $user->phone = 321518963;
        $user->email = 'lara@gmail.com';
        $user->password = bcrypt("12345");
        $user->save();
    }
}
