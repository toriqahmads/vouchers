<?php

namespace App\Observers;

use App\Voucher;
use App\Helpers\VoucherCode;

class VoucherObserver
{
    /**
     * Handle the voucher "creating" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function creating(Voucher $voucher)
    {
        $voucher->voucher_code = VoucherCode::generateVoucher();
    }

    /**
     * Handle the voucher "created" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function created(Voucher $voucher)
    {
        //
    }

    /**
     * Handle the voucher "updated" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function updated(Voucher $voucher)
    {
        //
    }

    /**
     * Handle the voucher "deleted" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function deleted(Voucher $voucher)
    {
        //
    }

    /**
     * Handle the voucher "restored" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function restored(Voucher $voucher)
    {
        //
    }

    /**
     * Handle the voucher "force deleted" event.
     *
     * @param  \App\Voucher  $voucher
     * @return void
     */
    public function forceDeleted(Voucher $voucher)
    {
        //
    }
}
