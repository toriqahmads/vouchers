<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Packet extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    
    public function gifts(){
        return $this->hasMany('App\Model\Gift');
    }
}
