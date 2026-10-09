<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
class AuthController extends Controller
{
    //
    public function register(Request $request){
        // dd($request->all());

        user::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        return response()->json([
            'status' => true,
            'message' => 'สมัครสมาชิกเรียบร้อยแล้ว',
        ]);
    }
    public function login(Request $request){
        // dd('test');
        // dd($request->all());
        $data = $request->only('email', 'password');

        if (auth()->attempt($data)) {
            $user = User::where('email', $request->email)->first();
            $tokenresult = $user->createToken('authToken')->plainTextToken;
            // dd($tokenresult);
        
            return response()->json([
                'status' => true,
                'message' => 'เข้าสู่ระบบสำเร็จ',
                'token' => $tokenresult,
                
            ]);
        }
        else {
            return response()->json([
                'status' => false,
                'message' => 'เข้าสู่ระบบไม่สำเร็จ',
            ]);
        }
    }
    public function logout(Request $request){
        $request -> user()->currentAccessToken()->delete();
        return response()->json([
                'status' => true,
                'message' => 'ออกจากระบบสำเร็จ',
            ]);
    }
}
