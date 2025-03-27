<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class adoption extends Model
{
    protected $fillable = [
        'user_id',
        'pet_id'
    ];

    //relationships adoption belongsTo User
    public function user(){
        return $this->belongsTo(User::class);
    }

    //relationships adoption belongsTo Pet
    public function pet(){
        return $this->belongsTo(Pet::class);
    }
}
