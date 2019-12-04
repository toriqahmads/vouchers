<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Packet extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    
    public function gifts(){
        return $this->hasMany('App\Model\Gift')->select(['id', 'gift', 'description', 'packet_id', 'percentage_win']);
    }

    public function scopeCurrentUser($query)
    {
      if((Auth::user()->role->name != 'admin')){
        return $this::where('author_id', Auth::user()->id);
      }
    }
}
