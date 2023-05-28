<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::prefix('items')->group(function () {
    Route::get('/', [App\Http\Controllers\ItemController::class, 'index']);
    Route::get('/add', [App\Http\Controllers\ItemController::class, 'add']);
    Route::post('/add', [App\Http\Controllers\ItemController::class, 'add']);

    Route::get('/{item}/detail', [App\Http\Controllers\ItemController::class, 'detail'])->name('items.detail');

    Route::get('/{item}/edit', [App\Http\Controllers\ItemController::class, 'edit'])->name('items.edit');
    Route::patch('/{item}/update', [App\Http\Controllers\ItemController::class, 'update'])->name('items.update');
    Route::delete('/{item}/destroy', [App\Http\Controllers\ItemController::class, 'destroy'])->name('items.destroy');

    Route::post('/import', [App\Http\Controllers\ItemController::class, 'import'])->name('items.import');
    Route::get('/export', [App\Http\Controllers\ItemController::class, 'export'])->name('items.export');

});
