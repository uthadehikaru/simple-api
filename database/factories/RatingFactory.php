<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Rating;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(Rating::class, function (Faker $faker) {
    return [
        'sender_id' => $faker->numberBetween(1,50),
        'recipient_id' => $faker->numberBetween(1,50),
        'rating' => $faker->numberBetween(0,10),
    ];
});
