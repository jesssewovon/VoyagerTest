<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserAuthController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('login', [UserAuthController::class, 'login'])->middleware('isAlreadyLoggedIn');
Route::get('logout', [UserAuthController::class, 'logout']);
Route::get('profile', [UserAuthController::class, 'profile'])->middleware('isLogged');
Route::post('check', [UserAuthController::class, 'check'])->name('auth.check');
