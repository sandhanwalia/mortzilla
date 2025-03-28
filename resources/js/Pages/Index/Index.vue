<template>
  <MainLayout>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8">
    <div class="max-w-5xl mx-auto">
      <!-- Header Section -->
      <div class="text-center mb-16">
        <h1 class="text-5xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-4 leading-relaxed pb-1 animate-fade-in">
            Welcome to Mortzilla
        </h1>
        <p class="text-gray-600 text-lg mb-6 animate-fade-in-delay">Your trusted companion for mortgage and real estate financial planning</p>
        <div class="mt-6 flex items-center justify-center space-x-6 text-sm text-gray-500 animate-fade-in-delay-2">
          <a href="https://github.com/sandhanwalia/mort-zilla" class="flex items-center hover:text-indigo-600 transition-colors duration-200 group" target="_blank">
            <svg class="w-5 h-5 mr-2 transform group-hover:scale-110 transition-transform duration-200" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.237 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
            </svg>
            Open Source
          </a>
          <span class="text-gray-300">•</span>
          <span class="flex items-center group">
            <svg class="w-5 h-5 mr-2 transform group-hover:scale-110 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
            Privacy-Focused
          </span>
          <span class="text-gray-300">•</span>
          <span class="flex items-center group">
            <svg class="w-5 h-5 mr-2 transform group-hover:scale-110 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z" />
            </svg>
            100% Free
          </span>
        </div>
      </div>
      
        <!-- Main Content Grid -->
        <div class="grid md:grid-cols-2 gap-8">
          <!-- Introduction Card -->
        <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90 hover:shadow-2xl transition-shadow duration-300">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center">
            <svg class="w-6 h-6 mr-2 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            About Mortzilla
          </h2>
          <p class="text-gray-600 mb-8 leading-relaxed">
            Mortzilla is an open-source project by the Mortdash team, helping you make informed decisions about your home financing. Our suite of calculators and tools provides accurate, real-time insights for your mortgage planning needs - all while keeping your data private and completely free.
          </p>
          <div class="space-y-5 text-gray-600">
            <div class="flex items-start space-x-4 group">
              <div class="p-2 rounded-lg bg-indigo-50 group-hover:bg-indigo-100 transition-colors duration-200">
                <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <p class="pt-1">Free, instant calculations for your mortgage scenarios</p>
            </div>
            <div class="flex items-start space-x-4 group">
              <div class="p-2 rounded-lg bg-indigo-50 group-hover:bg-indigo-100 transition-colors duration-200">
                <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <p class="pt-1">Detailed amortization schedules and equity projections</p>
            </div>
            <div class="flex items-start space-x-4 group">
              <div class="p-2 rounded-lg bg-indigo-50 group-hover:bg-indigo-100 transition-colors duration-200">
                <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <p class="pt-1">Comprehensive reports for better decision making</p>
            </div>
            <div class="flex items-start space-x-4 group">
              <div class="p-2 rounded-lg bg-indigo-50 group-hover:bg-indigo-100 transition-colors duration-200">
                <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <p class="pt-1">No data collection, no ads, and no hidden costs</p>
              </div>
            </div>
                </div>
                
          <!-- Calculators Card -->
        <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90 hover:shadow-2xl transition-shadow duration-300">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6 flex items-center">
            <svg class="w-6 h-6 mr-2 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
            Our Calculators
          </h2>
            <div class="space-y-4">
            <a href="/mortgage-calculator" class="block p-6 rounded-xl border-2 border-indigo-50 hover:border-indigo-200 hover:bg-indigo-50 transition-all duration-200 group">
                <div class="flex items-center justify-between">
                  <div>
                  <h3 class="font-medium text-gray-800 group-hover:text-indigo-600 transition-colors duration-200">Mortgage Calculator</h3>
                  <p class="text-sm text-gray-600 mt-1">Calculate monthly payments, interest, and amortization schedules</p>
                  </div>
                <svg class="w-5 h-5 text-indigo-600 transform group-hover:translate-x-1 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

            <a href="/refinance-calculator" class="block p-6 rounded-xl border-2 border-indigo-50 hover:border-indigo-200 hover:bg-indigo-50 transition-all duration-200 group">
                <div class="flex items-center justify-between">
                  <div>
                  <h3 class="font-medium text-gray-800 group-hover:text-indigo-600 transition-colors duration-200">Refinance Calculator</h3>
                  <p class="text-sm text-gray-600 mt-1">Compare refinancing options and calculate potential savings</p>
                  </div>
                <svg class="w-5 h-5 text-indigo-600 transform group-hover:translate-x-1 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

            <a href="/affordability-calculator" class="block p-6 rounded-xl border-2 border-indigo-50 hover:border-indigo-200 hover:bg-indigo-50 transition-all duration-200 group">
                <div class="flex items-center justify-between">
                  <div>
                  <h3 class="font-medium text-gray-800 group-hover:text-indigo-600 transition-colors duration-200">Affordability Calculator</h3>
                  <p class="text-sm text-gray-600 mt-1">Determine how much house you can afford</p>
                  </div>
                <svg class="w-5 h-5 text-indigo-600 transform group-hover:translate-x-1 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </a>

            <a href="#" class="block p-6 rounded-xl border-2 border-indigo-50 hover:border-indigo-200 hover:bg-indigo-50 transition-all duration-200 group">
                <div class="flex items-center justify-between">
                  <div>
                  <h3 class="font-medium text-gray-800 group-hover:text-indigo-600 transition-colors duration-200">Rent vs. Buy Calculator</h3>
                  <p class="text-sm text-gray-600 mt-1">Compare the costs of renting versus buying a home</p>
                  </div>
                <svg class="w-5 h-5 text-indigo-600 transform group-hover:translate-x-1 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in {
  animation: fadeIn 0.6s ease-out forwards;
}

.animate-fade-in-delay {
  animation: fadeIn 0.6s ease-out 0.2s forwards;
  opacity: 0;
}

.animate-fade-in-delay-2 {
  animation: fadeIn 0.6s ease-out 0.4s forwards;
  opacity: 0;
}

/* Smooth hover transitions */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}
</style>

