@extends('layouts.app')
@section('title', 'Dashboard')

@section('content')
<!-- Authentication -->
<form method="POST" action="{{ route('logout') }}" class="text-white">
    @csrf
    <a href="{{ route('logout') }}"
            onclick="event.preventDefault();
                     this.closest('form').submit();">
        Log Out
    </a>
</form>
@endsection