<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Item;

//CSVエクスポート用関数
use League\Csv\Reader;
use League\Csv\Writer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ItemController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * 商品一覧
     */
    public function index()
    {
        // 商品一覧取得
        $items = Item
            ::where('items.status', 'active')
            // ->select()
            // ->get();
            // ->orderBy('updated_at', 'desc')
            // ->orderBy('id', 'desc')
            // const.Items.PER_PAGEは一つのページ何個まで表示するのを定義している定数ですconfig\const.phpに定義しています。
            ->paginate(config("const.Items.PER_PAGE"));
        return view('item.index', compact('items'));
    }
        //CSVエクスポート用関数
        public function export()
        {
            $items = DB::table('items')->get();

            $csv = Writer::createFromString('');
            $csv->setDelimiter(',');
            $csv->setEnclosure('"');

            $csv->insertOne(['id','user_id','cd','name','type','sz','cs','itp','itc','itbn','detail','created_at','updated_at']);
            // rows
            foreach ($items as $item) {
                $csv->insertOne([$item->id,$item->user_id,$item->cd,$item->name,$item->type,$item->sz,$item->cs,$item->itp,$item->itc,$item->itbn,$item->detail,$item->created_at,$item->updated_at]);
            }

            $headers = [
                'Content-Type' => 'text/csv',
                'Content-Disposition' => 'attachment; filename="items.csv"',
            ];

            return response($csv->__toString(), 200, $headers);
        }

    /* *******csvインポート***********************/
    public function import(Request $request)
    {
        // バリデーションルールを設定
        $rules = [
            'csv_file' => 'required|mimes:csv,txt',
        ];
        $messages = [
            'csv_file.required' => 'ファイルを選択してください。',
            'csv_file.mimes' => 'CSVファイルを選択してください。',
        ];
        // ファイルがアップロードされているかをチェック
        if (!$request->hasFile('csv_file')) {
            return redirect()->back()->withErrors(['error' => 'ファイルを選択してください。']);
        }
        // バリデーションチェック
        $validator = \Validator::make($request->all(), $rules, $messages);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors());
        }
        // ファイルを取得
        $file = $request->file('csv_file');

        // CSVファイルを読み込んでデータを取得
        $csv = Reader::createFromPath($file);
        $csv->setHeaderOffset(0);
        $records = $csv->getRecords();

        // データを1行ずつ取得して保存
        foreach ($records as $row) {
            $item = new Item;
            $item->cd = $row['cd'];
            $item->name = $row['name'];
            $item->type = $row['type'];
            $item->sz = $row['sz'];
            $item->cs = $row['cs'];
            $item->itp = $row['itp'];
            $item->itc = $row['itc'];
            $item->itbn = $row['itbn'];
            $item->detail = $row['detail'];

            // $item->user_id = 1;
            $item->user_id = Auth::id();
            $item->save();
        }
        return redirect()->back()->with('status', 'CSVファイルをインポートしました。');
    }
/* ******************************/
    /**
     * 商品登録
     */
    public function add(Request $request)
    {
        // POSTリクエストのとき
        if ($request->isMethod('post')) {
            // バリデーション
            $this->validate($request, [
                'name' => 'required|min:3',
                'cd' => 'required|min:4',
                'itp' => 'required|max:100',
                'itc' => 'required|max:100',
            ], [
                'name.required' => '商品名は必須です',
                'name.min' => ':min 文字以上入力してください',
                'cd.required' => '商品番号は必須です',
                'cd.min' => ':min 文字以上入力してください',
                // 'type.required' => 'カテゴリーは必須です',
                'itp.required' => '販売価格は必須です',
                'itc.required' => '原価は必須です',
            ]);

            // 商品登録
            Item::create([
                'user_id' => Auth::user()->id,
                'cd' => $request->cd,
                'name' => $request->name,
                'type' => $request->type,
                'sz' => $request->sz,
                'cs' => $request->cs,
                'itp' => $request->itp,
                'itc' => $request->itc,
                'itbn' => $request->itbn,
                'detail' => $request->detail,
            ]);
            return redirect('/items');
        }
        return view('item.add');
    }

      // 商品詳細
      public function detail(Item $item)
      {

          return view('item.detail')
              ->with(['item' => $item]);

    //     $itemsCount = Item::count();
    // return view('item.detail', compact('item', 'itemsCount'));

      }

    // 商品修正
    public function edit(Item $item)
    {

        return view('item.edit')
            ->with(['item' => $item]);
    }
    //edit
    public function update(Request $request, Item $item)
    {
        // POSTリクエストのとき
        // if ($request->isMethod('post')) {
            // バリデーション
            // $this->validate($request, [
                $request->validate([
                'name' => 'required|min:3',
                'cd' => 'required|min:4',
                'itp' => 'required|max:100',
                'itc' => 'required|max:100',
            ], [
                'name.required' => '商品名は必須です',
                'name.min' => ':min 文字以上入力してください',
                'cd.required' => '商品番号は必須です',
                'cd.min' => ':min 文字以上入力してください',
                // 'type.required' => 'カテゴリーは必須です',
                'itp.required' => '販売価格は必須です',
                'itc.required' => '原価は必須です',
            ]);
                    $item->cd = $request->cd;
                    $item->name = $request->name;
                    $item->type = $request->type;
                    $item->sz = $request->sz;
                    $item->cs = $request->cs;
                    $item->itp = $request->itp;
                    $item->itc = $request->itc;
                    $item->itbn = $request->itbn;
                    $item->detail = $request->detail;
                    $item->save();

                    // return redirect('/items');
                    return redirect()->route('items.detail', $item->id);
    }

//削除
    public function destroy(Item $item)
    {
        $item->delete();
        return redirect('/items');
    }

}
