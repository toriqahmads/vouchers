<?php

namespace App\Observers;

use App\Model\Packet;
use App\Helpers\PacketCode;

class PacketObserver
{
    /**
     * Handle the voucher "creating" event.
     *
     * @param  App\Model\Packet  $packet
     * @return void
     */
    public function creating(Packet $packet)
    {
        $packet->packet_code = PacketCode::generatePacketCode();
    }
}
