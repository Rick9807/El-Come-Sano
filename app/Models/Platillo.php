<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Platillo extends Model
{
    use HasFactory;
    protected $table = 'platillos';
    protected $fillable = ['plat_nombre', 'plat_desc', 'plat_vegano', 'plat_cal', 'plat_azucares', 'plat_carbohidratos', 'plat_colesterol'];

    public function consejo(){
        return $this->hasMany(Consejo::class);
    }

    public function ingredientes(){
        return $this->belongsToMany(Ingrediente::class);
    }

    public function getPlatNombreAttribute($value){
        return ucfirst(strtolower($value));
    }
    
    public function getPlatDescAttribute($value){
        return ucfirst(strtolower($value));
    }

    public function getPlatVeganoAttribute($value){
        return ucfirst(strtolower($value));
    }

}
