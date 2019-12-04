<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\Packet;

class PacketController extends Controller
{
    public function findByCode(Request $request)
    {
        try{
            $packet_code = $request->packet_code;

            $packet = Packet::where('packet_code', $packet_code)->with('gifts')->firstOrFail();

            if(!$packet){
                return response()->json(array('success' => false,
                'message' => 'packet ' + $packet_code + ' not found'),
                404);
            }

            return response()->json(array('success' => true,
                'message' => 'packet found',
                'data' => $packet),
            200);
        }
        catch(Exception $error){
            return response()->json(array('success' => false,
                'message' => 'something went wrong'),
            500);
        }
    }
}
