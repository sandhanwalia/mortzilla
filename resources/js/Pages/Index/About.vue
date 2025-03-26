<template>
  <MainLayout>
    <div class="max-w-5xl mx-auto">
      <!-- Header Section -->
      <div class="text-center mb-12">
        <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3">
          About Mortzilla
        </h1>
        <p class="text-gray-600">Your trusted companion for mortgage and real estate financial planning</p>
      </div>

      <!-- Main Content -->
      <div class="space-y-12">
        <!-- Mission Section -->
        <section class="bg-white rounded-2xl shadow-xl p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-4">Our Mission</h2>
          <p class="text-gray-600 leading-relaxed">
            Mortzilla was created with a simple mission: to make mortgage and real estate financial planning accessible and 
            understandable for everyone. We believe that making informed financial decisions shouldn't require a degree in 
            finance or hours of research.
          </p>
        </section>

        <!-- Features Section -->
        <section class="bg-white rounded-2xl shadow-xl p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Our Calculators</h2>
          <div class="grid md:grid-cols-2 gap-6">
            <div class="space-y-4">
              <div class="flex items-start space-x-4">
                <div class="flex-shrink-0">
                  <div class="bg-indigo-100 rounded-lg p-3">
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
                  <div class="bg-purple-100 rounded-lg p-3">
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
                  <div class="bg-green-100 rounded-lg p-3">
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
                  <div class="bg-pink-100 rounded-lg p-3">
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
        <section class="bg-white rounded-2xl shadow-xl p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Key Features</h2>
          <div class="grid md:grid-cols-3 gap-6">
            <div class="text-center">
              <div class="bg-indigo-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-indigo-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Secure & Private</h3>
              <p class="text-gray-600 text-sm">Your data is never stored or shared with third parties</p>
            </div>

            <div class="text-center">
              <div class="bg-purple-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-purple-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Real-Time Results</h3>
              <p class="text-gray-600 text-sm">Instant calculations and updates as you adjust values</p>
            </div>

            <div class="text-center">
              <div class="bg-green-50 rounded-xl p-4 mb-4">
                <svg class="w-8 h-8 text-green-600 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                </svg>
              </div>
              <h3 class="font-semibold text-gray-800 mb-2">Detailed Reports</h3>
              <p class="text-gray-600 text-sm">Download comprehensive PDF reports for your records</p>
            </div>
          </div>
        </section>

        <!-- Contact Section -->
        <section class="bg-white rounded-2xl shadow-xl p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-4">Get in Touch</h2>
          <p class="text-gray-600 mb-6">
            Have questions or suggestions? We'd love to hear from you. Contact us at 
            <a href="mailto:support@mortzilla.com" class="text-indigo-600 hover:text-indigo-700">support@mortzilla.com</a>
          </p>
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
