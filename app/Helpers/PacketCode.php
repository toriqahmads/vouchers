<?php
namespace App\Helpers;
use App\Model\Packet;
use Illuminate\Support\Str;

class PacketCode{
    public static function generatePacketCode(){
		$packetCode = self::generateAndCheckPacketCode();

		if($packetCode == false) {
			$packetCode = self::generateAndCheckPacketCode();
		}

		return $packetCode;
	}

	public static function generateAndCheckPacketCode(){
		$packetCode = Str::random(10);
		$packetCode = strtoupper($packetCode);

		$isExist = Packet::where('packet_code', $packetCode)->first();

		if($isExist){
			return false;
		}

		return $packetCode;
	}
}

?>