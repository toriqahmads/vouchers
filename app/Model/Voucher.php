<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Voucher extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $fillable = ['gift_id', 'voucher_code', 'redeemed', 'no_hp'];

    public function gifts(){
      return $this->belongsTo('App\Model\Gift', 'gift_id')->select(array('id', 'gift', 'description', 'packet_id'));
    }

    public function scopeCurrentUser($query)
    {
      if((Auth::user()->role->name != 'admin')){
        return $this::where('author_id', Auth::user()->id);
      }
    }
}
