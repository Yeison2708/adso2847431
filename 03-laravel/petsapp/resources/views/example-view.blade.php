<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title }}</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="p-6 bg-base-100 text-base-content">

    <h1 class="text-4xl font-bold mb-6">{{ $title }}</h1>

    <div class="overflow-x-auto">
        <table class="table">
            <!-- Table Head -->
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Breed</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <!-- Table Body -->
            <tbody>
                @foreach ($pets as $pet)
                    <tr class="hover:bg-base-200">
                        <td>
                            <div class="flex items-center gap-4">
                                <div class="avatar">
                                    <div class="mask mask-squircle w-12 h-12">
                                        <img src="{{ asset('http://127.0.0.1:8000/images/no-imagage.png' . $pet->images) }}" alt="{{ $pet->name }}" />
                                    </div>
                                </div>
                                <div>
                                    <div class="font-bold">{{ $pet->name }}</div>
                                    @if ($pet->kind === 'Dog')
                                        <div class="badge badge-primary">{{ $pet->kind }}</div>
                                    @else
                                        <div class="badge badge-warning">{{ $pet->kind }}</div>
                                    @endif
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="badge badge-ghost badge-sm badge-warning">{{ $pet->breed }}</span>
                        </td>
                        <td>{{ $pet->location }}</td>
                        <td>
                            <a href="{{ url('show/info/pet/' . $pet->id) }}" class="btn btn-sm btn-outline btn-accent">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                                </svg>
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>

            <!-- Table Foot -->
            <tfoot>
                <tr>
                    <th>Name</th>
                    <th>Breed</th>
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </tfoot>
        </table>
    </div>

</body>

</html>
