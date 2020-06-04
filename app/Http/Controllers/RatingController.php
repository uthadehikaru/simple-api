<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Rating;
use Validator;

class RatingController extends Controller
{

    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'recipient_id' => 'required',
            'rating' => 'required|min:0|max:10',
        ]);

        if($validator->fails()){
            return response(['message' => 'Validation errors', 'errors' =>  $validator->errors(), 'status' => false], 422);
        }

        $input = $request->all();

        $rating = Rating::firstOrNew([
            'sender_id' => $request->user()->id,
            'recipient_id' => $input['recipient_id'],
        ]);

        $rating->rating = $input['rating'];
        $rating->save();

        return response(['message' => 'Rating Added!', 'status' => true]);
    }  

    public function get(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);

        if($validator->fails()){
            return response(['message' => 'Validation errors', 'errors' =>  $validator->errors(), 'status' => false], 422);
        }

        $input = $request->all();
        $user = User::with(['ratings'])->find($input['user_id']);

        $data['status'] = true;
        if($user){
            $data['name'] = $user->name;
            $data['email'] = $user->email;
            $data['rating'] = $user->ratings()->avg('rating');

            if($data['rating']==null)
                $data['rating'] = 'No rating yet';
            else
                $data['rating'] = round($data['rating']);
        }else{
            $data['status'] = false;
            $data['message'] = 'No User Found';
        }
        
        return response($data);
    }

    public function history(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);

        if($validator->fails()){
            return response(['message' => 'Validation errors', 'errors' =>  $validator->errors(), 'status' => false], 422);
        }

        $input = $request->all();
        $user = User::with(['ratings'])->find($input['user_id']);

        $data['status'] = true;
        if($user){
            $data['name'] = $user->name;
            $data['email'] = $user->email;

            $data['ratings'] = [];
            foreach($user->ratings as $rating){
                $data['ratings'][] = [
                    'created_at' => $rating->created_at,
                    'updated_at' => $rating->updated_at,
                    'sender' => $rating->sender->name,
                    'email' => $rating->sender->email,
                    'rating' => $rating->rating,
                ];
            }
        }else{
            $data['status'] = false;
            $data['message'] = 'No User Found';
        }
        
        return response($data);
    }
     
}