@extends('adminlte::page')

@section('title', '商品詳細')

@section('content_header')
    <h1>商品詳細</h1>
@stop

@section('content')
    <div class="row">
        <div class="col-md-10">
            <div class="card card-primary">
                <div class="card-body">
                    <table class="table table2">
                        <tbody>
                            <tr>
                                <td>商品名</td>
                                <td>{{$item->name}}</td>
                            </tr>
                            <tr>
                            <td>ブランド名</td>
                                <td>{{$item->itbn}}</td>

                            </tr>
                            <tr>
                                <td>商品番号</td>
                                <td>{{$item->cd}}</td>
                                <td>商品ID</td>
                                <td>{{$item->id}}</td>
                            </tr>
                            <tr>
                                <td>カテゴリー</td>
                                <td>{{$item->type}}</td>
                                <td>サイズ</td>
                                <td>{{$item->sz}}</td>
                            </tr>

                            <tr>
                                <td>販売価格</td>
                                <td>{{$item->itp}}</td>
                                <td>原価</td>
                                <td>{{$item->itc}}</td>
                            </tr>
                            <tr>
                                <td>色名</td>
                                <td>{{$item->cs}}</td>
                            </tr>
                            <tr>
                                <td>登録日時</td>
                                <td>{{$item->created_at}}</td>
                            </tr>
                            <tr>
                                <td>更新日時</td>
                                <td>{{$item->updated_at}}</td>
                            </tr>
                            <tr>
                                <td>商品詳細</td>
                            </tr>
                        </tbody>
                    </table>
                    <p>{!! nl2br(e($item->detail)) !!}</p>
                </div>

                <div class="card-footer">
                    <div class="form-button">
                        <a href="{{ route('items.edit', $item) }}" class="btn btn-secondary rounded-pill">編集</a>
                        {{-- <a href="{{ session('previous_url') ?? url()->previous() }}" class="btn btn-secondary button-back rounded-pill">戻る</a> --}}
                        {{-- <a href="{{ '/items' }}" type="submit" class="btn btn-secondary rounded-pill">戻る</a> --}}
                        <a href="{{ route('items.index' ) }}" type="submit" class="btn btn-secondary rounded-pill">戻る</a>

                            <!-- 前の商品ボタンの表示 -->
                            @if ($item->id > 1)
                            <a href="{{ route('items.detail', ['item' => $item->id - 1]) }}" type="button" id="before_button" class="btn btn-dark rounded-pill">前の商品</a>
                            @else
                            <a class="btn btn-dark rounded-pill disabled" disabled>前の商品</a>
                            @endif

                            <!-- 次の商品ボタンの表示 -->
                            @if ($item->id < $itemsCount)
                            <a href="{{ route('items.detail', ['item' => $item->id + 1]) }}" type="button" id="next_button" class="btn btn-dark rounded-pill">次の商品</a>
                            @else
                            <a class="btn btn-dark rounded-pill disabled" disabled>次の商品</a>
                            @endif

                            <!-- 前の商品ボタンの表示3 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('css')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@stop

@section('js')

@stop
