<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Gift extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];

    public function vouchers(){
      return $this->hasMany('App\Model\Voucher');
    }

    public function packets(){
      return $this->belongsTo('App\Model\Packet');
    }

    public function scopeCurrentUser($query)
    {
      if((Auth::user()->role->name != 'admin')){
        return $this::where('author_id', Auth::user()->id);
      }
    }
}
