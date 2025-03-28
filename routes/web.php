<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return inertia('Index/Index');
});


Route::get('/calculators-page', function () {
    return inertia('Index/CalculatorsPage');
});
Route::get('/mortgage-calculator', function () {
    return inertia('Index/MortgageCalculator');
});

Route::get('/about', function () {
    return inertia('Index/About');
});

Route::get('/affordability-calculator', function () {
    return inertia('Index/AffordabilityCalculator');
});

Route::get('/refinance-calculator', function () {
    return inertia('Index/RefinanceCalculator');
});

Route::get('/resources', function () {
    return inertia('Index/Resources');
});