<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Consejo extends Model
{
    use HasFactory;
    use SoftDeletes;
    //protected $fillable = ['plat_id', 'cons_contenido'];

    public function platillo(){
        return $this->belongsTo(Platillo::class);
    }

    public function getConsContenidoAttribute($value){
        return ucfirst(strtolower($value));
    }

    public function setConsContenidoAttribute($value){
        $this->attributes['cons_contenido'] = mb_strtoupper($value, 'UTF-8');
    }
}
