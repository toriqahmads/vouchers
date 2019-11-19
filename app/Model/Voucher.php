<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    protected $fillable = ['gift_id', 'voucher_code', 'redeemed'];

    public function gifts(){
      return $this->belongsTo('App\Model\Gift');
    }
}
