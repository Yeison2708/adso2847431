<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pets', function (Blueprint $table) {
            $table->id(); 
            $table->string('name');
            $table->string('imagen', 255)->default('no-imgage.png');
            $table->string('kind');
            $table->integer('weight');
            $table->integer('age');
            $table->string('breed');
            $table->string('location');
            $table->text('description');
            $table->boolean('status')->default('0');
            $table->timestamps(); 
        });
    }

    public function down()
    {
        Schema::dropIfExists('pets');
}
};