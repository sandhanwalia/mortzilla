<template>
  <MainLayout>
    <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8">
      <div class="max-w-7xl mx-auto pt-20">
        <!-- Header Section -->
        <div class="text-center mb-12">
          <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3 leading-relaxed pb-1">
            Financial Calculators
          </h1>
          <p class="text-gray-600">Choose a calculator to help with your financial planning</p>
        </div>

        <!-- Calculator Selection Tabs -->
        <div class="mb-8">
          <div class="border-b border-gray-200">
            <nav class="-mb-px flex space-x-8 overflow-x-auto" aria-label="Calculators">
              <button
                v-for="calc in calculators"
                :key="calc.id"
                @click="currentCalculator = calc.id"
                :class="[
                  currentCalculator === calc.id
                    ? 'border-indigo-500 text-indigo-600'
                    : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300',
                  'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm flex items-center'
                ]"
              >
                <component :is="calc.icon" class="w-5 h-5 mr-2" />
                {{ calc.name }}
              </button>
            </nav>
          </div>
        </div>

        <!-- Mobile Calculator Selector -->
        <div class="md:hidden mb-6">
          <select
            v-model="currentCalculator"
            class="block w-full rounded-md border-gray-300 py-2 pl-3 pr-10 text-base focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
          >
            <option
              v-for="calc in calculators"
              :key="calc.id"
              :value="calc.id"
            >
              {{ calc.name }}
            </option>
          </select>
        </div>

        <!-- Calculator Display Area -->
        <div class="bg-white rounded-2xl shadow-xl p-6 md:p-8">
          <component :is="currentCalculatorComponent" />
        </div>
      </div>
    </div>
  </MainLayout>
</template>

<script setup>
import { ref, computed, defineComponent } from 'vue'
import MainLayout from '@/Layouts/MainLayout.vue'
import MortgageCalculator from '../Index/MortgageCalculator.vue'

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
    component: defineComponent({
      template: '<div class="text-center py-12">Refinance Calculator Coming Soon</div>'
    }),
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
    component: defineComponent({
      template: '<div class="text-center py-12">Affordability Calculator Coming Soon</div>'
    }),
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
/* Add any additional styles here */
</style>


