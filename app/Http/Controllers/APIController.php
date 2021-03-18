<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Resources\ProjetResource;
use App\Http\Resources\LogResource;

use App\Models\Log;
use App\Models\Projet;

class APIController extends Controller
{
    public function gettingProjets()
    {
    	return ProjetResource::collection(Projet::all());
    }

    public function gettingLogs()
    {
    	return LogResource::collection(Log::all());
    }
}
