<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8">
    <!-- Header Menu -->
    <div class="fixed top-0 left-0 right-0 z-50 bg-white bg-opacity-95 shadow-md backdrop-blur-sm">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center py-4">
          <!-- Logo and Brand -->
          <div class="flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-indigo-600" viewBox="0 0 20 20" fill="currentColor">
              <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
            </svg>
            <span class="text-xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent">Mortzilla</span>
          </div>
          
          <!-- Navigation -->
          <nav class="hidden md:flex items-center space-x-8">
            <Link href="/" class="text-gray-700 hover:text-indigo-600 transition-colors duration-200 font-medium">Home</Link>
            <Link href="/calculators-page" class="text-gray-700 hover:text-indigo-600 transition-colors duration-200 font-medium">Calculators</Link>
            <Link href="#" class="text-gray-700 hover:text-indigo-600 transition-colors duration-200 font-medium">Resources</Link>
            <Link href="/about" class="text-gray-700 hover:text-indigo-600 transition-colors duration-200 font-medium">About</Link>
          </nav>
          
          <!-- CTA Button -->
          <div class="hidden md:block">
            <button class="bg-gradient-to-r from-indigo-600 to-purple-600 text-white px-6 py-2 rounded-lg shadow-md hover:shadow-lg transition-all duration-200 font-medium">Get Started</button>
          </div>
          
          <!-- Mobile Menu Button -->
          <div class="md:hidden">
            <button @click="mobileMenuOpen = !mobileMenuOpen" class="text-gray-700">
              <svg v-if="!mobileMenuOpen" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
              <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>
      </div>
      
      <!-- Mobile Menu -->
      <div v-if="mobileMenuOpen" class="md:hidden">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3 border-t">
          <Link href="/" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-indigo-600 hover:bg-gray-50">Home</Link>
          <Link href="/calculators-page" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-indigo-600 hover:bg-gray-50">Calculators</Link>
          <Link href="#" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-indigo-600 hover:bg-gray-50">Resources</Link>
          <Link href="/about" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-indigo-600 hover:bg-gray-50">About</Link>
          <!-- Add CTA button in mobile menu -->
          <div class="px-3 py-2">
            <button class="w-full bg-gradient-to-r from-indigo-600 to-purple-600 text-white px-6 py-2 rounded-lg shadow-md hover:shadow-lg transition-all duration-200 font-medium">Get Started</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Content Slot -->
    <div class="max-w-7xl mx-auto pt-20">
      <slot></slot>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Link } from '@inertiajs/vue3'

const mobileMenuOpen = ref(false)
</script> 