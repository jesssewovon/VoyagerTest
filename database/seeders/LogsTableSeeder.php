<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\Log;
use App\Models\Projet;

class LogsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        Log::truncate();

        $faker = \Faker\Factory::create();

        // And now, let's create a few articles in our database:
        $projet = Projet::where('id', 1)->firstOrFail();
        for ($i = 0; $i < 70; $i++) {
            Log::create([
                'message' => $faker->sentence,
                'type' => 'Info',
                'projet_id' => $projet->id,
                'date_heure' => new \Datetime(),
                'updated_at' => new \Datetime(),
                'created_at' => new \Datetime(),
            ]);
        }
    }
}
