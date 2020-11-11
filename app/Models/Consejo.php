<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Consejo extends Model
{
    use HasFactory;
    //protected $fillable = ['plat_id', 'cons_contenido'];

    public function platillos(){
        return $this-belongsTo(Platillo::class, 'id');
    }
}
