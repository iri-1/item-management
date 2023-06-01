@extends('adminlte::page')

@section('title', '商品登録')

@section('content_header')
    <h1>商品登録</h1>
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
            <form action="{{ route('items.import') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group3">
                    <label for="csv_file">CSVファイル</label>
                    <input type="file" name="csv_file" id="csv_file" class="form-control-file">
                    <button type="submit" class="btn btn-primary rounded-pill add-btn">CSV一括登録</button>
                </div>
            </form>
            <div class="card card-primary">

                <form method="POST">
                    @csrf
                    <div class="card-body">
                        <table class="table">
                            <tbody>
                              <tr>
                                <td>
                                  <label for="name">商品名<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label></span></label>
                                </td>
                                <td>
                                  <input type="text" class="form-control form-control2" id="name" name="name" placeholder="商品名" value="{{ old('name') }}">
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <label for="cd">商品番号<span class="badge rounded-pill bg-danger">{{ __('必須') }}</label></span></label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="cd" name="cd" placeholder="商品番号" value="{{ old('cd') }}">
                                </td>
                                <td>
                                  {{-- <label for="type">種別</label>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="type" name="type" placeholder="1, 2, 3, ..." value="{{ old('type') }}"> --}}

                                    <label for="type">{{ ('カテゴリー') }}<span class="badge rounded-pill bg-danger"></label>
                                </td>
                                <td>
                                    <select class="form-control" id="type" name="type">
                                        <option value="">カテゴリー</option>
                                        <option value="トップス" @if(old('type') == 'トップス') selected @endif>トップス</option>
                                        <option value="ボトムス" @if(old('type') == 'ボトムス') selected @endif>ボトムス</option>
                                        <option value="アウター" @if(old('type') == 'アウター') selected @endif>アウター</option>
                                        <option value="インナー" @if(old('type') == 'インナー') selected @endif>インナー</option>
                                        <option value="アクセサリー" @if(old('type') == 'アクセサリー') selected @endif>アクセサリー</option>
                                        <option value="その他" @if(old('type') == 'その他') selected @endif>6.その他</option>
                                    </select>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <label for="sz">サイズ</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="sz" name="sz" placeholder="サイズ" value="{{ old('sz') }}">
                                </td>
                                <td>
                                  <label for="cs">色名</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="cs" name="cs" placeholder="色名" value="{{ old('cs') }}">
                                </td>
                              </tr>

                              <tr>
                                <td>
                                  <label for="itp">販売価格<span class="badge rounded-pill bg-danger">{{ __('必須') }}</span></label></label>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="itp" name="itp" placeholder="販売価格" value="{{ old('itp') }}">
                                </td>
                                <td>
                                  <label for="itc">原価<span class="badge rounded-pill bg-danger">{{ __('必須') }}</span></label></label>
                                </td>
                                <td>
                                  <input type="number" class="form-control" id="itc" name="itc" placeholder="原価" value="{{ old('itc') }}">
                                </td>
                              </tr>

                              <tr>
                                <td>
                                  <label for="itbn">ブランド名</label>
                                </td>
                                <td>
                                  <input type="text" class="form-control" id="itbn" name="itbn" placeholder="ブランド名" value="{{ old('itbn') }}">
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <label for="detail">商品詳細</label>
                                </td>
                                <td>
                                  <textarea class="form-control form-control2" id="detail" name="detail" placeholder="商品詳細説明">{{ old('detail') }}</textarea>
                                </td>
                              </tr>
                            </tbody>
                          </table>

                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-secondary rounded-pill">登録</button>
                        {{-- <a href="{{ '/items' }}" type="submit" class="btn btn-secondary rounded-pill">戻る</a> --}}
                        <a href="{{ route('items.index' ) }}" type="submit" class="btn btn-secondary rounded-pill">戻る</a>
                    </div>
                </form>

            </div>
        </div>
    </div>
@stop

@section('css')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@stop

@section('js')
@stop
