<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class pet extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'iamge',
        'kind',
        'weight',
        'age',
        'breed',
        'location',
        'description'
    ];
    //relationships pet hasOne Adoption
    public function adoption(){
        return $this->hasOne(Adoption::class);
    }
}