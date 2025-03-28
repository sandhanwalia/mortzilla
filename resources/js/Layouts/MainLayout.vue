<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50">
    <!-- Header Menu -->
    <div class="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-100">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <!-- Logo and Brand -->
          <div class="flex items-center space-x-3 group">
            <div class="relative">
              <div class="absolute inset-0 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-lg blur opacity-25 group-hover:opacity-40 transition duration-200"></div>
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-indigo-600 relative" viewBox="0 0 20 20" fill="currentColor">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
              </svg>
            </div>
            <span class="text-xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent">Mortzilla</span>
          </div>
          
          <!-- Navigation -->
          <nav class="hidden md:flex items-center space-x-1">
            <Link 
              href="/" 
              :class="[
                'px-4 py-2 text-sm font-medium rounded-lg transition-all duration-200',
                isActive('/') 
                  ? 'text-indigo-600 bg-indigo-50' 
                  : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
              ]"
            >
              Home
            </Link>
            <Link 
              href="/calculators-page" 
              :class="[
                'px-4 py-2 text-sm font-medium rounded-lg transition-all duration-200',
                isActive('/calculators-page') 
                  ? 'text-indigo-600 bg-indigo-50' 
                  : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
              ]"
            >
              Calculators
            </Link>
            <Link 
              href="/resources/" 
              :class="[
                'px-4 py-2 text-sm font-medium rounded-lg transition-all duration-200',
                isActive('/resources') 
                  ? 'text-indigo-600 bg-indigo-50' 
                  : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
              ]"
            >
              Resources
            </Link>
            <Link 
              href="/about" 
              :class="[
                'px-4 py-2 text-sm font-medium rounded-lg transition-all duration-200',
                isActive('/about') 
                  ? 'text-indigo-600 bg-indigo-50' 
                  : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
              ]"
            >
              About
            </Link>
          </nav>
          
          <!-- CTA Button -->
          <div class="hidden md:block">
            <button class="relative group">
              <div class="absolute inset-0 bg-gradient-to-r from-indigo-600 to-purple-600 rounded-lg blur opacity-25 group-hover:opacity-40 transition duration-200"></div>
              <button class="relative px-6 py-2 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg shadow-sm hover:shadow-md transition-all duration-200 text-sm font-medium">
                Get Started
              </button>
            </button>
          </div>
          
          <!-- Mobile Menu Button -->
          <div class="md:hidden">
            <button @click="mobileMenuOpen = !mobileMenuOpen" class="p-2 rounded-lg text-gray-700 hover:bg-gray-50 transition-colors duration-200">
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
      <div v-if="mobileMenuOpen" class="md:hidden bg-white/95 backdrop-blur-md border-t border-gray-100">
        <div class="px-2 pt-2 pb-3 space-y-1">
          <Link 
            href="/" 
            :class="[
              'block px-4 py-3 rounded-lg text-base font-medium transition-all duration-200',
              isActive('/') 
                ? 'text-indigo-600 bg-indigo-50' 
                : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
            ]"
          >
            Home
          </Link>
          <Link 
            href="/calculators-page" 
            :class="[
              'block px-4 py-3 rounded-lg text-base font-medium transition-all duration-200',
              isActive('/calculators-page') 
                ? 'text-indigo-600 bg-indigo-50' 
                : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
            ]"
          >
            Calculators
          </Link>
          <Link 
            href="/resources/" 
            :class="[
              'block px-4 py-3 rounded-lg text-base font-medium transition-all duration-200',
              isActive('/resources') 
                ? 'text-indigo-600 bg-indigo-50' 
                : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
            ]"
          >
            Resources
          </Link>
          <Link 
            href="/about" 
            :class="[
              'block px-4 py-3 rounded-lg text-base font-medium transition-all duration-200',
              isActive('/about') 
                ? 'text-indigo-600 bg-indigo-50' 
                : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
            ]"
          >
            About
          </Link>
          <div class="px-4 py-3">
            <button class="relative group w-full">
              <div class="absolute inset-0 bg-gradient-to-r from-indigo-600 to-purple-600 rounded-lg blur opacity-25 group-hover:opacity-40 transition duration-200"></div>
              <button class="relative w-full px-6 py-2 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg shadow-sm hover:shadow-md transition-all duration-200 text-sm font-medium">
                Get Started
              </button>
            </button>
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
import { ref, computed } from 'vue'
import { Link, usePage } from '@inertiajs/vue3'

const mobileMenuOpen = ref(false)
const currentPath = computed(() => usePage().url)

const isActive = (path) => {
  if (path === '/') {
    return currentPath.value === path
  }
  return currentPath.value.startsWith(path)
}
</script> 