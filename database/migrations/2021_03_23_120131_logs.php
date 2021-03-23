<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Logs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('logs', function (Blueprint $table) {
            $table->increments('id');
            
            $table->integer('projet_id')->unsigned()->nullable()->default(null);
            $table->foreign('projet_id')->references('id')->on('projets')->onUpdate('cascade')->onDelete('set null');

            $table->string('message');
            $table->string('type');
            $table->timestamp('date_heure');
            //$table->timestamp('updated_at')->useCurrent();
            //$table->timestamp('created_at')->useCurrent();

            //$table->foreign('author_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('logs');
    }
}
