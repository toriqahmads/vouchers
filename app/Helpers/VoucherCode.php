<?php
namespace App\Helpers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use App\Voucher;

class VoucherCode{
	public static function generateVoucher(){
		$voucher = self::generateAndCheckVoucher();

		while ($voucher == false) {
			$voucher = self::generateAndCheckVoucher();
		}

		return $voucher;
	}

	public static function generateAndCheckVoucher(){
		$voucher = Str::random(5) . "-" . Str::random(5) . "-" . Str::random(5) . "-" . Str::random(5);
		$voucher = strtoupper($voucher);

		$isExist = Voucher::where('voucher_code', $voucher)->first();

		if($isExist){
			return false;
		}

		return $voucher;
	}
}

?>
