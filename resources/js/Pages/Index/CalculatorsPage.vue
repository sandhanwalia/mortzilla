<template>
  <MainLayout>
    <div class="min-h-screen">
      <div class="max-w-7xl mx-auto lg:px-8">
        <!-- Header Section -->
        <div class="text-center mb-12 pt-4 px-4 ">
          <h1 class="text-3xl sm:text-4xl lg:text-5xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-4 leading-tight">
            Financial Calculators
          </h1>
          <p class="text-gray-600 text-lg max-w-2xl mx-auto">Choose a calculator to help with your financial planning</p>
        </div>

        <!-- Calculator Selection Tabs -->
        <div class="mb-8 px-4 ">
          <div class="border-b border-gray-200">
            <nav class="-mb-px flex space-x-4 sm:space-x-8 overflow-x-auto scrollbar-hide" aria-label="Calculators">
              <button
                v-for="calc in calculators"
                :key="calc.id"
                @click="currentCalculator = calc.id"
                :class="[
                  currentCalculator === calc.id
                    ? 'border-indigo-500 text-indigo-600 bg-indigo-50/50'
                    : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 hover:bg-gray-50/50',
                  'whitespace-nowrap py-4 px-3 sm:px-4 border-b-2 font-medium text-sm flex items-center rounded-t-lg transition-all duration-200'
                ]"
              >
                <component :is="calc.icon" class="w-5 h-5 mr-2" />
                {{ calc.name }}
              </button>
            </nav>
          </div>
        </div>

        <!-- Mobile Calculator Selector -->
        <div class="md:hidden mb-6 px-4 ">
          <div class="relative">
            <select
              v-model="currentCalculator"
              class="block w-full rounded-xl border-2 border-indigo-100 py-3 pl-4 pr-10 text-base focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200 bg-white shadow-sm"
            >
              <option
                v-for="calc in calculators"
                :key="calc.id"
                :value="calc.id"
                class="py-2"
              >
                {{ calc.name }}
              </option>
            </select>
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-indigo-500">
              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
              </svg>
            </div>
          </div>
        </div>

        <!-- Calculator Display Area -->
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
          <div >
            <component :is="currentCalculatorComponent" />
          </div>
        </div>
      </div>
    </div>
  </MainLayout>
</template>

<script setup>
import { ref, computed, defineComponent } from 'vue'
import MainLayout from '@/Layouts/MainLayout.vue'
import MortgageCalculator from '../Index/MortgageCalculator.vue'
import AffordabilityCalculator from '../Index/AffordabilityCalculator.vue'
import RefinanceCalculator from '../Index/RefinanceCalculator.vue'

// Calculator definitions with icons
const calculators = [
  {
    id: 'mortgage',
    name: 'Mortgage Calculator',
    component: MortgageCalculator,
    icon: defineComponent({
      template: `
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
        </svg>
      `
    })
  },
  {
    id: 'refinance',
    name: 'Refinance Calculator',
    component: RefinanceCalculator,
    icon: defineComponent({
      template: `
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
        </svg>
      `
    })
  },
  {
    id: 'affordability',
    name: 'Affordability Calculator',
    component: AffordabilityCalculator,
    icon: defineComponent({
      template: `
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      `
    })
  },
  {
    id: 'rent-vs-buy',
    name: 'Rent vs. Buy',
    component: defineComponent({
      template: '<div class="text-center py-12">Rent vs. Buy Calculator Coming Soon</div>'
    }),
    icon: defineComponent({
      template: `
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7h12m0 0l-4-4m4 4l-4 4m0 6H4m0 0l4 4m-4-4l4-4" />
        </svg>
      `
    })
  }
]

// Current calculator state
const currentCalculator = ref('mortgage')

// Computed property to get the current calculator component
const currentCalculatorComponent = computed(() => {
  const calculator = calculators.find(calc => calc.id === currentCalculator.value)
  return calculator ? calculator.component : null
})
</script>

<style scoped>
/* Hide scrollbar for Chrome, Safari and Opera */
.scrollbar-hide::-webkit-scrollbar {
  display: none;
}

/* Hide scrollbar for IE, Edge and Firefox */
.scrollbar-hide {
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */
}

/* Smooth transitions */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 200ms;
}
</style>


