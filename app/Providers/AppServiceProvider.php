<?php

namespace App\Providers;

use App\Model\Voucher;
use App\Model\Packet;
use Illuminate\Support\ServiceProvider;
use App\Observers\VoucherObserver;
use App\Observers\PacketObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        \URL::forceScheme('https');
        Voucher::observe(VoucherObserver::class);
        Packet::observe(PacketObserver::class);
    }
}
