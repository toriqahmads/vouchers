<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\VoucherRequest;
use App\Model\Voucher;
use App\Model\Gift;
use App\Model\Packet;
use App\Helpers\VoucherCode;
use Illuminate\Support\Facades\App;

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
            
            $gift = Gift::where('packet_id', null)->get();

            if(count($gift) <= 0){
                return response()->json(array('success' => false,
	    		    'message' => 'failed to generate new voucher. There is no gift item available'),
	    	    401);
            }

            $rand = rand(0, count($gift) - 1);

	    	$data = [
                'voucher_code' => VoucherCode::generateVoucher(),
                'gift_id' => $gift[$rand]->id,
                'no_hp' => $request->no_hp
	    	];

	    	$voucher = Voucher::create($data);

	    	if($voucher){
                $voucher = Voucher::where('voucher_code', $voucher->voucher_code)->with('gifts')->first();
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

    public function generateVoucherByPacket(Request $request){
        try{
            $validatedData = $request->validate([
                'no_hp' => 'required|min:10|max:13|regex:/^08[0-9]{8,11}/',
                'packet_code' => 'min:10|max:10|regex:/[A-Z0-9]{10,10}/'
            ]);

            $from = date('Y-m-d');
            $to = date('Y-m-d', strtotime('+1 days'));

            $limit = Voucher::where('no_hp', $request->no_hp)->whereBetween('created_at', [$from, $to])->count();

            if($limit >= 1){
                return response()->json(array('success' => false,
	    		    'message' => 'Maaf, Anda telah mencapai limit hari ini'),
	    	    401);
            }
            
            $packet = Packet::where('packet_code', $request->packet_code)->with('gifts')->firstOrFail();

            if($packet->current_used >= $packet->voucher_limit){
                return response()->json(array('success' => false,
	    		    'message' => 'Voucher telah habis'),
	    	    401);
            }

            $gift = $packet->gifts;
            
            $item = $this->randomGift($gift);

            $data = [
                'voucher_code' => VoucherCode::generateVoucher(),
                'gift_id' => $item,
                'no_hp' => $request->no_hp
            ];
            
            $voucher = Voucher::create($data);

            if($voucher){
                $packet->current_used = $packet->current_used + 1;
                $packet->save();

                $voucher = Voucher::where('voucher_code', $voucher->voucher_code)->with('gifts')->first();

	    		return response()->json(array('success' => true,
                    'message' => 'successfully created voucher',
                    'data' => $voucher),
                200);
	    	}
        }
        catch(Exception $e){
            return response()->json(array('success' => false,
	    		'message' => 'failed to generate new voucher'),
	    	500);
        }
    }

    public function generateBulkVoucher(Request $request){
        try{
            $vouchers = [];
            if(!is_null($request->packet_code) && !empty($request->packet_code)){
                $packet = Packet::where('packet_code', $request->packet_code)->with('gifts')->firstOrFail();
    
                if($packet->current_used >= $packet->voucher_limit){
                    return response()->json(array('success' => false,
                        'message' => 'packet has reached voucher limit'),
                    401);
                }

                for($i=0; $i < $request->voucher_total; $i++){
                    $gift = $packet->gifts;
                
                    $item = $this->randomGift($gift);
        
                    $data = [
                        'voucher_code' => VoucherCode::generateVoucher(),
                        'gift_id' => $item
                    ];
                    
                    $voucher = Voucher::create($data);
        
                    if($voucher){
                        $packet->current_used = $packet->current_used + 1;
                        $packet->save();
        
                        $vouchers[$i] = getenv('APP_URL') . "/voucher/" . $voucher->voucher_code;
                    }
                }
            }
            else{
                $gift = Gift::where('packet_id', null)->get();

                if(count($gift) <= 0){
                    return response()->json(array('success' => false,
                        'message' => 'failed to generate new voucher. There is no gift item available'),
                    401);
                }

                for($i=0; $i < $request->voucher_total; $i++){
                    $rand = rand(0, count($gift) - 1);

                    $data = [
                        'voucher_code' => VoucherCode::generateVoucher(),
                        'gift_id' => $gift[$rand]->id,
                        'no_hp' => $request->no_hp
                    ];

                    $voucher = Voucher::create($data);
                    if($voucher){
                        $vouchers[$i] = getenv('APP_URL') . "/voucher/" . $voucher->voucher_code;
                    }
                }
            }

            return response()->json(array('success' => true,
                'message' => 'successfully created voucher',
                'data' => $vouchers),
            200);
        }
        catch(Exception $e){
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

    private function randomGift($gift){
        $random = rand(1, 100);
        $current = 0;
        
        foreach($gift as $key => $g){
            $current += $g->percentage_win;
            if($random <= $current){
                return $g->id;
            }
        }
    }
}
