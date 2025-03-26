<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return inertia('Index/Index');
});


Route::get('/CalculatorsPage', function () {
    return inertia('Index/CalculatorsPage');
});
Route::get('/MortgageCalculator', function () {
    return inertia('Index/MortgageCalculator');
});

Route::get('/About', function () {
    return inertia('Index/About');
});
