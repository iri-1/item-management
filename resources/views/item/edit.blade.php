@extends('adminlte::page')

@section('title', '商品編集')

@section('content_header')
    <h1>商品編集</h1>

@stop

@section('content')
    <div class="row">
        <div class="col-md-10">
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                       @foreach ($errors->all() as $error)
                          <li>{{ $error }}</li>
                       @endforeach
                    </ul>
                </div>
            @endif

            <div class="card card-primary">
                <form method="post" action="{{ route('items.update',$item) }}">
                    @method('PATCH')
                    @csrf
                    <div class="card-body">
                        <table class="table">
                            <tbody>

                                <tr>
                                    <td >商品ID</td>
                                    <td>{{$item->id}}</td>
                                    <td>登録日時</td>
                                    <td>{{$item->created_at}}</td>
                                  </tr>
                                  <tr>
                                    <td>更新日時</td>
                                    <td>{{$item->updated_at}}</td>
                                  </tr>
                              <tr>
                                <td>
                                  <label for="name">商品名<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control form-control2" id="name" name="name" placeholder="商品名" value="{{ old('name', $item->name) }}">
                                </td>
                              </tr>

                              <tr>
                                <td>
                                  <label for="cd">商品番号<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="cd" name="cd" placeholder="商品番号" value="{{ old('cd', $item->cd) }}">
                                </td>
                                {{-- <label for="type">カテゴリー</label>
                                <td>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="type" name="type" placeholder="1, 2, 3, ..." value="{{ old('type', $item->type) }}">
                                </td> --}}
                                <td>
                                    <label for="type">カテゴリー</label>
                                </td>
                                <td>
                                    <select class="form-control" id="type" name="type">
                                        <option value="">カテゴリー</option>
                                        <option value="トップス" @if(old('type', $item->type) == 'トップス') selected @endif>トップス</option>
                                        <option value="ボトムス" @if(old('type', $item->type) == 'ボトムス') selected @endif>ボトムス</option>
                                        <option value="アウター" @if(old('type', $item->type) == 'アウター') selected @endif>アウター</option>
                                        <option value="インナー" @if(old('type', $item->type) == 'インナー') selected @endif>インナー</option>
                                        <option value="アクセサリー" @if(old('type', $item->type) == 'アクセサリー') selected @endif>アクセサリー</option>
                                        <option value="その他" @if(old('type', $item->type) == 'その他') selected @endif>その他</option>
                                    </select>
                                </td>

                              </tr>
                              <tr>
                                <td>
                                  <label for="sz">サイズ</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="sz" name="sz" placeholder="サイズ" value="{{ old('sz', $item->sz) }}">
                                </td>
                                <td>
                                  <label for="cs">色名</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="cs" name="cs" placeholder="色名" value="{{ old('cs', $item->cs) }}">
                                </td>
                              </tr>

                              <tr>
                                <td>
                                  <label for="itp">販売価格<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="itp" name="itp" placeholder="販売価格" value="{{ old('itp', $item->itp) }}">
                                </td>
                                <td>
                                  <label for="itc">原価<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="itc" name="itc" placeholder="原価" value="{{ old('itc', $item->itc) }}">
                                </td>
                              </tr>

                              <tr>
                                <td>
                                  <label for="itbn">ブランド名</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="itbn" name="itbn" placeholder="ブランド名" value="{{ old('itbn', $item->itbn) }}">
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <label for="detail">商品詳細</label>
                                </td>
                                <td>
                                  <textarea class="form-control form-control2" id="detail" name="detail" placeholder="商品詳細説明">{{ old('detail', $item->detail) }}</textarea>
                                </td>
                              </tr>
                            </tbody>
                          </table>

                    </div>

                    <div class="card-footer">
                        <div class="form-button">
                        <button type="submit" class="btn btn-primary btn-lg rounded-pill">更新</button>
                        <button type="button" id="delete_button" class="btn btn-danger btn-lg rounded-pill">削除</button>
                        <button tid="btn--back" class="btn btn-warning button-back btn-lg rounded-pill">戻る</button>
                    </div>
                </div>
                </form>
            </div>
            <form id="delete_post" method="post" action="{{ route('items.destroy', $item)}}">
                @method('DELETE')
                @csrf
             </form>
        </div>
    </div>
@stop

@section('css')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@stop

@section('js')
<script>
    'use strict';
    {
        document.getElementById('delete_button').addEventListener('click', e => {
            e.preventDefault();
            if (!confirm('本当に削除してもよろしいですか?')) {
                return;
            }
            document.getElementById('delete_post').submit();
        });
    }
    // 戻るボタン
    const back = document.getElementById('btn--back');
    back.addEventListener('click', (e) => { history.back(); return false; });
 </script>
@stop
