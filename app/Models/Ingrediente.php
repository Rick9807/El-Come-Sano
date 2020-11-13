<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingrediente extends Model
{
    use HasFactory;
    protected $table = 'ingredientes';
    protected $fillable = ['ingre_nombre', 'ingre_tipo', 'ingre_marca', 'ingre_vega', 'ingre_cal', 'ingre_azucares', 'ingre_carbohidratos', 'ingre_colesterol'];

    public function platillos(){
        return $this->belongsToMany(Platillo::class);
    }

}
