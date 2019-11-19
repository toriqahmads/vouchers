<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\VoucherRequest;
use App\Model\Voucher;
use App\Model\Gift;
use App\Helpers\VoucherCode;

class VoucherController extends Controller
{
    public function generateVoucher(Request $request){
    	try{
            $validatedData = $request->validate([
                'no_hp' => 'required|min:10|max:13|regex:/^08[0-9]{8,11}/',
            ]);

            $from = date('Y-m-d');
            $to = date('Y-m-d', strtotime('+7 days'));

            $limit = Voucher::where('no_hp', $request->no_hp)->whereBetween('created_at', [$from, $to])->count();

            if($limit >= 3){
                return response()->json(array('success' => false,
	    		    'message' => 'you have reached limit voucher this week'),
	    	    401);
            }

    		$gift = Gift::all()->random(1)->first();

	    	$data = [
                'voucher_code' => VoucherCode::generateVoucher(),
                'gift_id' => $gift->id,
                'no_hp' => $request->no_hp
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

	    	$voucher = Voucher::where('voucher_code', $voucher_code)->with('gifts')->firstOrFail();

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
            die(dd($request));
            $voucher_code = $request->voucher_code;

            $voucher = Voucher::where('voucher_code', $voucher_code)->with('gifts')->firstOrFail();

            if(!$voucher){
                return response()->json(array('success' => false,
                'message' => 'voucher ' + $voucher_code + ' not found'),
                404);
            }

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
