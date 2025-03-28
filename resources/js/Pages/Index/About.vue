<template>
  <MainLayout>
    <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Header Section -->
      <div class="text-center mb-12 pt-4">
        <h1 class="text-3xl sm:text-4xl lg:text-5xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-4 leading-tight">
          About MortDash
        </h1>
        <p class="text-gray-600 text-lg max-w-2xl mx-auto">Your trusted companion for mortgage and real estate financial planning</p>
      </div>

      <!-- Main Content -->
      <div class="space-y-8">
        <!-- Mission Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-4">Our Mission</h2>
          <p class="text-gray-600 leading-relaxed">
            MortDash was created with a simple mission: to make mortgage and real estate financial planning accessible and 
            understandable for everyone. We believe that making informed financial decisions shouldn't require a degree in 
            finance or hours of research.
          </p>
        </section>

        <!-- Features Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Our Calculators</h2>
          <div class="grid md:grid-cols-2 gap-6">
            <div class="space-y-4">
              <div class="flex items-start space-x-4">
                <div class="flex-shrink-0">
                  <div class="bg-indigo-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                    </svg>
                  </div>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800">Mortgage Calculator</h3>
                  <p class="text-gray-600">Calculate monthly payments, explore different down payment scenarios, and view detailed amortization schedules.</p>
                </div>
              </div>

              <div class="flex items-start space-x-4">
                <div class="flex-shrink-0">
                  <div class="bg-purple-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                    </svg>
                  </div>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800">Refinance Calculator</h3>
                  <p class="text-gray-600">Compare your current mortgage with refinancing options to see potential savings.</p>
                </div>
              </div>
            </div>

            <div class="space-y-4">
              <div class="flex items-start space-x-4">
                <div class="flex-shrink-0">
                  <div class="bg-green-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                  </div>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800">Affordability Calculator</h3>
                  <p class="text-gray-600">Determine how much house you can afford based on your income and expenses.</p>
                </div>
              </div>

              <div class="flex items-start space-x-4">
                <div class="flex-shrink-0">
                  <div class="bg-pink-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4" />
                    </svg>
                  </div>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800">Rent vs. Buy Calculator</h3>
                  <p class="text-gray-600">Compare the financial implications of renting versus buying a home.</p>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Key Features Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Key Features</h2>
          <div class="grid md:grid-cols-3 gap-6">
            <div class="text-center">
              <div class="bg-indigo-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-indigo-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Interactive Tools</h3>
              <p class="text-gray-600 text-sm">Real-time updates and interactive visualizations for better understanding</p>
            </div>

            <div class="text-center">
              <div class="bg-purple-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-purple-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Comprehensive Analysis</h3>
              <p class="text-gray-600 text-sm">Detailed breakdowns including property tax, insurance, PMI, and HOA</p>
            </div>

            <div class="text-center">
              <div class="bg-green-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-green-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Detailed Reports</h3>
              <p class="text-gray-600 text-sm">Generate comprehensive PDF reports for your records</p>
            </div>
          </div>
        </section>

        <!-- Tech Stack Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Built with Modern Technology</h2>
          <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50">
              <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
              </svg>
              <span class="text-sm font-medium text-gray-700">Laravel 10</span>
            </div>
            <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50">
              <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
              </svg>
              <span class="text-sm font-medium text-gray-700">Vue.js 3</span>
            </div>
            <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50">
              <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
              </svg>
              <span class="text-sm font-medium text-gray-700">Tailwind CSS</span>
            </div>
            <div class="flex items-center space-x-3 p-3 rounded-lg bg-gray-50">
              <svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
              </svg>
              <span class="text-sm font-medium text-gray-700">Chart.js</span>
            </div>
          </div>
        </section>

        <!-- Contact Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-4">Get in Touch</h2>
          <p class="text-gray-600 mb-6">
            Have questions or suggestions? We'd love to hear from you. Contact us at 
            <a href="mailto:https://www.linkedin.com/in/sandhanwalia" class="text-indigo-600 hover:text-indigo-700">@sandhanwalia</a>
          </p>
          <div class="flex justify-center space-x-4">
            <a href="https://github.com/sandhanwalia/mort-zilla" target="_blank" class="text-gray-600 hover:text-gray-900">
              <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
              </svg>
            </a>
            <a href="https://www.linkedin.com/in/sandhanwalia/" target="_blank" class="text-gray-600 hover:text-gray-900">
              <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-.88-.016-2.005-1.22-2.005-1.22 0-1.405.953-1.405 1.94v5.669h-3v-11h2.85v1.026h.041c.494-.93 1.699-1.914 3.5-1.914 3.74 0 4.374 2.464 4.374 5.667v6.221z"/>
              </svg>
            </a>
          </div>
        </section>
      </div>
    </div>
  </MainLayout>
</template>

<script setup>
import MainLayout from '@/Layouts/MainLayout.vue'
</script>

<style scoped>
/* Add any additional styles here */
</style>
