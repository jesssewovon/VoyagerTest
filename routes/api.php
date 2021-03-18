<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Projet;
use App\Models\Log;

use App\Http\Controllers\APIController;
/*use App\Http\Resources\LogResource;
use App\Http\Resources\ProjetResource;*/

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

/*Route::get('/logs', function () {
    return LogResource::collection(Log::all());
});

Route::get('/projets', function () {
    return ProjetResource::collection(Projet::all());
});*/

Route::get('/logs', [APIController::class, 'gettingLogs']);
Route::get('/projets', [APIController::class, 'gettingProjets']);