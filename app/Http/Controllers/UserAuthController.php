<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class UserAuthController extends Controller
{
    function login($value='')
    {
    	return view('auth.login');
    }

    function check(Request $request)
    {
    	//return $request->input();
    	$request->validate([
    		'email'=> 'required|email',
    		'password'=> 'required|min:5|max:12'
    	]);

    	$user = User::where('email', '=', $request->email)->first();
    	if ($user) {
    		if (Hash::check($request->password, $user->password)) {
    			$request->session()->put('LoggedUser', $user->id);
    			return redirect('profile');
    		}else{
    			return back()->with('fail', 'Invalid password');
    		}
    	}else{
    		return back()->with('fail', 'No account');
    	}
    }

    function profile()
    {
    	//return view('auth.profile');
    	$data = [];
    	if (session()->has('LoggedUser')) {
    		$user = User::where('id', '=', session('LoggedUser'))->first();
	    	$data = [
	    		'LoggedUserInfo'=>$user
	    	];
    	}
    	return view('auth.profile', $data);
    }

    function logout()
    {
    	if (session()->has('LoggedUser')) {
    		session()->pull('LoggedUser');
    		return redirect('login');
    	}
    	
    }
}
