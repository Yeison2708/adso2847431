@extends('layouts.app')
@section('title', 'Users Module')

@section('content')
    @include('layouts.navbar')
    <!-- Authentication -->
    <h1 class="text-3xl pt-3 flex gap-1 items-center text-white mt-15 mb-2 pb-1 border-b-1">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="size-12">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                    </svg>
        Create Users
    </h1>


@endsection
