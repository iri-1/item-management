<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'cd',
        'name',
        'type',
        'sz',
        'cs',
        'itp',
        'itc',
        'itbn',
        'detail',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
    ];
// 次の商品を取得する

    public function getNext(){
        return static::where('id','>',$this->id)->orderBy('id')->first();
    }
    // 前の商品を取得する
    public function getPrevious(){
        return static::where('id','<',$this->id)->orderBy('id','DESC')->first();
    }
    // const.Items.PER_PAGEは一つのページ何個まで表示するのを定義している定数ですconfig\const.phpに定義しています。
    public function getPageNumber(){
      $itemCount =  static::where("id","<" ,$this->id)->count();
      $perPage = config("const.Items.PER_PAGE");
      return floor($itemCount / $perPage) + 1;
    }
}
