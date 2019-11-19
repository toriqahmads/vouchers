<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\VoucherRequest;
use App\Model\Voucher;
use App\Model\Gift;
use App\Helpers\VoucherCode;

class VoucherController extends Controller
{
    public function generateVoucher(){
    	try{
    		$gift = Gift::all()->random(1)->first();

	    	$data = [
                'voucher_code' => VoucherCode::generateVoucher(),
	    		'gift_id' => $gift->id
	    	];

	    	$voucher = Voucher::create($data);

	    	if($voucher){
	    		return response()->json(array('success' => true,
                    'message' => 'successfully created voucher',
                    'data' => $voucher),
                200);
	    	}

	    	return response()->json(array('success' => false,
	    		'message' => 'failed to generate new voucher'),
	    	500);
    	}
    	catch(Exception $error){
    		return response()->json(array('success' => false,
	    		'message' => 'failed to generate new voucher'),
	    	500);
    	}
    }

    public function redeem(VoucherRequest $request){
    	try{
    		$voucher_code = $request->voucher_code;

	    	$voucher = Voucher::where('voucher_code', $voucher_code)->gifts()->firstOrFail();

            if($voucher->redeemed == 'Y'){
                return response()->json(array('success' => false,
                    'message' => 'voucher already redeemed'),
                200);
            }

	    	$voucher->redeemed = 'Y';
	    	$voucher->save();

            return response()->json(array('success' => true,
                'message' => 'voucher successfully redeemed',
                'data' => $voucher),
            200);
    	}
    	catch(Exception $error){
    		return response()->json(array('success' => false,
    			'message' => 'failed to redeemed'),
    		500);
    	}
    }

    public function findByCode(VoucherRequest $request){
        try{
            $voucher_code = $request->voucher_code;

            $voucher = Voucher::where('voucher_code', $voucher_code)->find();

            if(!$voucher){
                return response()->json(array('success' => false,
                'message' => 'voucher ' + $voucher_code + ' not found'),
                404);
            }

            die(dd($voucher));

            return response()->json(array('success' => true,
                'message' => 'voucher found',
                'data' => $voucher),
            200);
        }
        catch(Exception $error){
            return response()->json(array('success' => false,
                'message' => 'something went wrong'),
            500);
        }
    }
}
