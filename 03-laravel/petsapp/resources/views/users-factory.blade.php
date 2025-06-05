<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List All Users</title>
</head>
<body class=
            "bg-purple-800
            text-purple-200
            flex
            flex-col
            gap-8
            justify-center
            min-h-[100dvh]
            items-center"> 
    <h1 class=
                "font-bold 
                border-b-2
                text-4xl">
                List All Users 
                <small class=
                "text-purple-400 
                text-lg">
                Factory challenge
                </small>
            </h1>
            
            <section 
            class= "users 
                    grid 
                    grid-cols-2
                    sm:grid-cols-3
                    md:grid-cols-5
                    gap-2">

            @foreach($users as $user)
                <div class=
                    "bg-purple-700 
                    flex-col
                    flex
                    p-4 
                    rounded-lg
                    justify-center
                    items-center
                    ">
                    <img src="{{ asset('images/'.$user->photo)}} "width="100px" height="100px " class="rounded-full" alt="User Photo">
                    <h2 class=
                        "font-bold 
                        text-lg 
                        text-center">
                        {{ $user->fullname }}
                    </h2>
                    <h3 class=
                            "text-sm text-center">
                        {{ $user->role }}
                    </h3>
                    <p class=
                        "text-sm text-center">
                        {{ $user->gender}}
                    </p>
                    <p class=
                        "text-sm text-center">
                        {{ $user->birthdate}}
                    </p>
                    <p class=
                        "text-sm text-center">
                        {{ $user->email }}
                    </p>
                    <p class=
                        "text-sm text-center">
                        {{ $user->phone}}
                    </p>
                </div>
            @endforeach

            </section>


    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</body>
</html>