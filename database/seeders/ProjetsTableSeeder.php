<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\Projet;

class ProjetsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        Projet::truncate();

        $faker = \Faker\Factory::create();

        // And now, let's create a few articles in our database:
        for ($i = 0; $i < 20; $i++) {
            Projet::create([
                'libelle' => $faker->sentence,
            ]);
        }
    }
}
