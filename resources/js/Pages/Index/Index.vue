<template>
  <MainLayout>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8">
    <div class="max-w-5xl mx-auto">
      <!-- Header Section -->
      <div class="text-center mb-12">
        <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3 leading-relaxed pb-1">
            Welcome to Mortzilla
        </h1>
          <p class="text-gray-600">Your trusted companion for mortgage and real estate financial planning</p>
      </div>
      
        <!-- Main Content Grid -->
        <div class="grid md:grid-cols-2 gap-8">
          <!-- Introduction Card -->
          <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">About Mortzilla</h2>
            <p class="text-gray-600 mb-6">
              Mortzilla helps you make informed decisions about your real estate investments. Our suite of calculators and tools provides accurate, real-time insights for your mortgage planning needs.
            </p>
            <div class="space-y-4 text-gray-600">
              <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-indigo-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <p>Free, instant calculations for your mortgage scenarios</p>
              </div>
              <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-indigo-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <p>Detailed amortization schedules and equity projections</p>
              </div>
              <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-indigo-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <p>Comprehensive reports for better decision making</p>
              </div>
            </div>
                </div>
                
          <!-- Calculators Card -->
          <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Our Calculators</h2>
            <div class="space-y-4">
              <a href="/mortgage-calculator" class="block p-4 rounded-xl border-2 border-indigo-50 hover:border-indigo-100 hover:bg-indigo-50 transition-all duration-200">
                <div class="flex items-center justify-between">
                  <div>
                    <h3 class="font-medium text-gray-800">Mortgage Calculator</h3>
                    <p class="text-sm text-gray-600">Calculate monthly payments, interest, and amortization schedules</p>
                  </div>
                  <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

              <a href="/refinance-calculator" class="block p-4 rounded-xl border-2 border-indigo-50 hover:border-indigo-100 hover:bg-indigo-50 transition-all duration-200">
                <div class="flex items-center justify-between">
                  <div>
                    <h3 class="font-medium text-gray-800">Refinance Calculator</h3>
                    <p class="text-sm text-gray-600">Compare refinancing options and calculate potential savings</p>
                  </div>
                  <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

              <a href="/affordability-calculator" class="block p-4 rounded-xl border-2 border-indigo-50 hover:border-indigo-100 hover:bg-indigo-50 transition-all duration-200">
                <div class="flex items-center justify-between">
                  <div>
                    <h3 class="font-medium text-gray-800">Affordability Calculator</h3>
                    <p class="text-sm text-gray-600">Determine how much house you can afford</p>
                  </div>
                  <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

              <a href="/rent-vs-buy-calculator" class="block p-4 rounded-xl border-2 border-indigo-50 hover:border-indigo-100 hover:bg-indigo-50 transition-all duration-200">
                <div class="flex items-center justify-between">
                  <div>
                    <h3 class="font-medium text-gray-800">Rent vs. Buy Calculator</h3>
                    <p class="text-sm text-gray-600">Compare the costs of renting versus buying a home</p>
                  </div>
                  <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
              </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </MainLayout>
</template>

<script setup>
import MainLayout from '@/Layouts/MainLayout.vue'
</script>

<style>
/* ... your existing styles ... */
</style>

