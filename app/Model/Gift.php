<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Gift extends Model
{
    public function vouchers(){
      return $this->hasMany('App\Model\Voucher');
    }
}
