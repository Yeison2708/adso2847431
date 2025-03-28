<?php

use Illuminate\Support\Facades\Route;
use Livewire\Volt\Volt;
use Symfony\Component\VarDumper\VarDumper;

Route::get('/', function () {
    return view('welcome');
})->name('home');

// List all users (factory challenge)
Route::get('show/users', function () {
    $users = App\Models\User::all();
    // dd($users->toArray());
    return view('users-factory')->with('users', $users);
});

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware(['auth'])->group(function () {
    Route::redirect('settings', 'settings/profile');

    Volt::route('settings/profile', 'settings.profile')->name('settings.profile');
    Volt::route('settings/password', 'settings.password')->name('settings.password');
    Volt::route('settings/appearance', 'settings.appearance')->name('settings.appearance');
});

require __DIR__.'/auth.php';
