<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    
    protected $fillable = [
        'sender_id', 'recipient_id', 'rating'
    ];

    public function sender()
    {
        return $this->belongsTo('App\Models\User', 'sender_id');
    }

    public function recipient()
    {
        return $this->belongsTo('App\Models\User', 'recipient_id');
    }
}
