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
        //$projet = Projet::where('id', 1)->firstOrFail();
        for ($i = 0; $i < 50; $i++) {
            $nb = rand(1, 3);
            $id_projet = rand(1, 20);//Note:Be sure you have at least projets in db with id 1 and 2, ...and 20
            Log::create([
                'message' => $faker->sentence,
                'type' => 'option'.$nb,
                //'projet_id' => $projet->id,
                'projet_id' => $id_projet,
                'date_heure' => new \Datetime(),
                'updated_at' => new \Datetime(),
                'created_at' => new \Datetime(),
            ]);
        }
    }
}
