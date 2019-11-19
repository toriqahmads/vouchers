<?php

namespace App\Providers;

use App\Voucher;
use Illuminate\Support\ServiceProvider;
use App\Observers\VoucherObserver;

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
    }
}
