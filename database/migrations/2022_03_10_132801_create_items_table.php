<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id')->unsigned()->index()->comment('登録したユーザーのID');
            $table->string('cd',12)->index()->comment('商品番号');
            $table->string('name', 100)->index()->comment('商品名');
            $table->string('status', 100)->default('active');
            $table->string('type', 100)->nullable()->comment('種類 1トップス 2ボトムス 3アウター 4インナー 5アクセサリー6其の他');;
            $table->string('sz', 100)->nullable()->comment('サイズ');
            $table->string('cs', 200)->nullable()->comment('色名');
            $table->integer('itp')->comment('販売価格');
            $table->integer('itc')->comment('原価');
            $table->string('itbn', 200)->nullable()->comment('ブランド名');
            $table->string('detail', 500)->nullable()->comment('商品説明');
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
        Schema::dropIfExists('items');
    }
}
