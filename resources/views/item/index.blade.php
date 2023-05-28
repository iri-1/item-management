@extends('adminlte::page')

@section('title', '商品一覧')

@section('content_header')
    <h1>商品一覧</h1>
@stop

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">商品一覧</h3>
                    <div class="card-tools">
                        <div class="input-group input-group-sm">
                            <div class="input-group-append">
                                <a href="{{ route('items.export') }}" class="btn btn-success rounded-pill btn-exprot">登録データ一括エクスポート(CSV)</a>
                                <a href="{{ url('items/add') }}" class="btn btn-secondary rounded-pill  btn-exprot">商品登録</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>商品番号</th>
                                <th>商品名</th>
                                <th>カテゴリー</th>
                                <th>更新日</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($items as $item)
                                <tr onclick="window.location='{{ route('items.detail', $item->id) }}'">
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->cd }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->type }}</td>
                                    <td>{{ $item->updated_at }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="page_pagination">
                        {{$items->links('pagination::bootstrap-4')}}
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
