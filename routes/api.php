<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('vouchers/{voucher_code}', 'VoucherController@findByCode');
Route::post('vouchers/{packet_code}/get', 'VoucherController@generateVoucherByPacket');
Route::post('vouchers', 'VoucherController@generateVoucher');
Route::post('vouchers/bulk', 'VoucherController@generateBulkVoucher');
Route::put('vouchers', 'VoucherController@redeem');

Route::get('packets/{packet_code}', 'PacketController@findByCode');
