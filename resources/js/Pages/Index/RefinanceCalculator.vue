<template>
  <MainLayout>
    <div class="max-w-5xl mx-auto">
      <!-- Header Section -->
      <div class="text-center mb-12">
        <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3 leading-relaxed pb-1">
          Mortgage Refinance Calculator
        </h1>
        <p class="text-gray-600">Calculate if refinancing your mortgage could save you money</p>
      </div>
      
      <div class="grid lg:grid-cols-3 gap-8">
        <!-- Input Card -->
        <div class="lg:col-span-2 bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90">
          <h2 class="text-xl font-semibold text-gray-800 mb-6">Current Mortgage Details</h2>
          
          <!-- Input Fields -->
          <div class="space-y-6">
            <!-- Current Loan Balance -->
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Current Loan Balance</label>
              <div class="relative">
                <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                <input 
                  type="text" 
                  :value="formatNumber(currentBalance)"
                  @input="e => {
                    const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                    currentBalance = isNaN(value) ? 0 : value
                  }"
                  class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                  placeholder="Enter current loan balance"
                />
              </div>
            </div>

            <!-- Current Interest Rate -->
            <div>
              <div class="flex justify-between mb-2">
                <label class="text-sm font-medium text-gray-700">Current Interest Rate</label>
                <span class="text-indigo-600 font-semibold">{{ currentRate }}%</span>
              </div>
              <input 
                type="range" 
                v-model="currentRate" 
                :min="2" 
                :max="14" 
                :step="0.125"
                class="slider-input w-full"
              />
              <div class="flex justify-between text-xs text-gray-500 mt-1">
                <span>2%</span>
                <span>14%</span>
              </div>
            </div>

            <!-- Remaining Term -->
            <div>
              <div class="flex justify-between mb-2">
                <label class="text-sm font-medium text-gray-700">Remaining Term</label>
                <span class="text-indigo-600 font-semibold">{{ remainingTerm }} years</span>
              </div>
              <input 
                type="range" 
                v-model="remainingTerm" 
                :min="1" 
                :max="30" 
                :step="1"
                class="slider-input w-full"
              />
              <div class="flex justify-between text-xs text-gray-500 mt-1">
                <span>1 year</span>
                <span>30 years</span>
              </div>
            </div>

            <!-- New Loan Details Section -->
            <div class="mt-8 border rounded-xl p-6 bg-gray-50">
              <h3 class="text-lg font-medium text-gray-800 mb-4">New Loan Details</h3>
              
              <!-- Loan Type Selection -->
              <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">Loan Type</label>
                <div class="space-y-4">
                  <select 
                    v-model="loanType"
                    class="w-full py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                  >
                    <option value="fixed">Fixed Rate</option>
                    <option value="arm">Adjustable Rate (ARM)</option>
                  </select>

                  <!-- ARM Details -->
                  <div v-if="loanType === 'arm'" class="space-y-4 p-4 bg-white rounded-xl">
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-2">Initial Rate Period</label>
                      <select 
                        v-model="armInitialPeriod"
                        class="w-full py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                      >
                        <option value="5">5/1 ARM</option>
                        <option value="7">7/1 ARM</option>
                        <option value="10">10/1 ARM</option>
                      </select>
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700 mb-2">Adjustment Cap</label>
                      <div class="flex space-x-4">
                        <div class="flex-1">
                          <label class="text-xs text-gray-500">First Adjustment</label>
                          <input 
                            type="number"
                            v-model="armFirstCap"
                            class="w-full py-2 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400"
                            placeholder="%"
                          />
                        </div>
                        <div class="flex-1">
                          <label class="text-xs text-gray-500">Subsequent</label>
                          <input 
                            type="number"
                            v-model="armSubsequentCap"
                            class="w-full py-2 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400"
                            placeholder="%"
                          />
                        </div>
                        <div class="flex-1">
                          <label class="text-xs text-gray-500">Lifetime</label>
                          <input 
                            type="number"
                            v-model="armLifetimeCap"
                            class="w-full py-2 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400"
                            placeholder="%"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- New Interest Rate -->
              <div>
                <div class="flex justify-between mb-2">
                  <label class="text-sm font-medium text-gray-700">New Interest Rate</label>
                  <span class="text-indigo-600 font-semibold">{{ newRate }}%</span>
                </div>
                <input 
                  type="range" 
                  v-model="newRate" 
                  :min="2" 
                  :max="14" 
                  :step="0.125"
                  class="slider-input w-full"
                />
                <div class="flex justify-between text-xs text-gray-500 mt-1">
                  <span>2%</span>
                  <span>14%</span>
                </div>
              </div>

              <!-- New Term -->
              <div class="mt-6">
                <div class="flex justify-between mb-2">
                  <label class="text-sm font-medium text-gray-700">New Term</label>
                  <span class="text-indigo-600 font-semibold">{{ newTerm }} years</span>
                </div>
                <input 
                  type="range" 
                  v-model="newTerm" 
                  :min="15" 
                  :max="30" 
                  :step="5"
                  class="slider-input w-full"
                />
                <div class="flex justify-between text-xs text-gray-500 mt-1">
                  <span>15 years</span>
                  <span>30 years</span>
                </div>
              </div>

              <!-- Closing Costs -->
              <div class="mt-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">Closing Costs</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                  <input 
                    type="text" 
                    :value="formatNumber(closingCosts)"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      closingCosts = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter closing costs"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Results Card -->
        <div class="lg:col-span-1">
          <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90 sticky top-8">
            <!-- Monthly Savings -->
            <div class="text-center p-6 bg-gradient-to-br from-indigo-50 to-purple-50 rounded-xl mb-6">
              <h3 class="text-gray-600 mb-2">Monthly Savings</h3>
              <div class="text-4xl font-bold" :class="monthlySavings >= 0 ? 'text-green-600' : 'text-red-600'">
                ${{ formatNumber(Math.abs(monthlySavings)) }}
              </div>
              <div class="text-sm text-gray-500 mt-1">
                {{ monthlySavings >= 0 ? 'You save' : 'You pay more' }} per month
              </div>
            </div>

            <!-- Payment Comparison -->
            <div class="space-y-4 mb-8">
              <h4 class="font-semibold text-gray-800 border-b pb-2">Payment Comparison</h4>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Current Payment</span>
                <span class="font-semibold text-gray-800">${{ formatNumber(currentPayment) }}</span>
              </div>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">New Payment</span>
                <span class="font-semibold text-gray-800">${{ formatNumber(newPayment) }}</span>
              </div>
            </div>

            <!-- Break-Even Analysis -->
            <div class="space-y-4 mb-8">
              <h4 class="font-semibold text-gray-800 border-b pb-2">Break-Even Analysis</h4>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Break-Even Point</span>
                <div class="text-right">
                  <div class="font-semibold text-gray-800">{{ breakEvenMonths }} months</div>
                  <div class="text-sm text-gray-500">{{ breakEvenYears }} years</div>
                </div>
              </div>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Total Interest Savings</span>
                <div class="text-right">
                  <div class="font-semibold text-gray-800">${{ formatNumber(totalInterestSavings) }}</div>
                  <div class="text-sm text-gray-500">over {{ newTerm }} years</div>
                </div>
              </div>
            </div>

            <!-- Refinance Recommendation -->
            <div class="space-y-4 pt-6 border-t border-gray-200">
              <h4 class="font-semibold text-gray-800 pb-2">Recommendation</h4>
              <div class="p-4 rounded-lg" :class="recommendationClass">
                <p class="text-sm font-medium">{{ recommendationText }}</p>
                <p class="text-xs mt-1">{{ recommendationDetails }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </MainLayout>
</template>

<script setup>
import { ref, computed } from 'vue'
import MainLayout from '@/Layouts/MainLayout.vue'

// Input values
const currentBalance = ref(250000)
const currentRate = ref(6.5)
const remainingTerm = ref(25)
const newRate = ref(5.5)
const newTerm = ref(30)
const closingCosts = ref(5000)
const loanType = ref('fixed')
const armInitialPeriod = ref(5)
const armFirstCap = ref(2)
const armSubsequentCap = ref(2)
const armLifetimeCap = ref(5)

// Computed values
const currentMonthlyRate = computed(() => {
  return (currentRate.value / 100) / 12
})

const newMonthlyRate = computed(() => {
  return (newRate.value / 100) / 12
})

const currentNumberOfPayments = computed(() => {
  return remainingTerm.value * 12
})

const newNumberOfPayments = computed(() => {
  return newTerm.value * 12
})

const currentPayment = computed(() => {
  const p = currentBalance.value
  const r = currentMonthlyRate.value
  const n = currentNumberOfPayments.value
  
  if (r === 0) return p / n
  
  const payment = (p * (r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1))
  return isNaN(payment) ? 0 : payment.toFixed(2)
})

const newPayment = computed(() => {
  const p = currentBalance.value
  const r = newMonthlyRate.value
  const n = newNumberOfPayments.value
  
  if (r === 0) return p / n
  
  // For ARM, calculate based on initial period
  if (loanType.value === 'arm') {
    const initialMonths = armInitialPeriod.value * 12
    const initialPayment = (p * (r * Math.pow(1 + r, initialMonths)) / (Math.pow(1 + r, initialMonths) - 1))
    return isNaN(initialPayment) ? 0 : initialPayment.toFixed(2)
  }
  
  const payment = (p * (r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1))
  return isNaN(payment) ? 0 : payment.toFixed(2)
})

const monthlySavings = computed(() => {
  return parseFloat(currentPayment.value) - parseFloat(newPayment.value)
})

const breakEvenMonths = computed(() => {
  if (monthlySavings.value <= 0) return 0
  return Math.ceil(closingCosts.value / monthlySavings.value)
})

const breakEvenYears = computed(() => {
  return (breakEvenMonths.value / 12).toFixed(1)
})

const totalInterestSavings = computed(() => {
  const currentTotal = parseFloat(currentPayment.value) * currentNumberOfPayments.value - currentBalance.value
  const newTotal = parseFloat(newPayment.value) * newNumberOfPayments.value - currentBalance.value
  return Math.max(0, currentTotal - newTotal)
})

const recommendationClass = computed(() => {
  if (monthlySavings.value > 0 && breakEvenMonths.value < 36) {
    return 'bg-green-50 text-green-700'
  } else if (monthlySavings.value > 0) {
    return 'bg-yellow-50 text-yellow-700'
  } else {
    return 'bg-red-50 text-red-700'
  }
})

const recommendationText = computed(() => {
  if (monthlySavings.value > 0 && breakEvenMonths.value < 36) {
    return 'Strongly Consider Refinancing'
  } else if (monthlySavings.value > 0) {
    return 'Consider Refinancing'
  } else {
    return 'Refinancing Not Recommended'
  }
})

const recommendationDetails = computed(() => {
  const savings = monthlySavings.value
  const months = breakEvenMonths.value
  
  if (savings > 0 && months < 36) {
    return `You could save $${formatNumber(savings)} per month and break even in ${months} months.`
  } else if (savings > 0) {
    return `You could save $${formatNumber(savings)} per month but it would take ${months} months to break even.`
  } else {
    return `Refinancing would increase your monthly payment by $${formatNumber(Math.abs(savings))}.`
  }
})

// Helper functions
const formatNumber = (num) => {
  if (num === null || num === undefined) return '0'
  const value = parseFloat(num)
  if (isNaN(value)) return '0'
  return new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(value)
}
</script>

<style scoped>
.slider-input {
  -webkit-appearance: none;
  @apply h-2 bg-gradient-to-r from-indigo-200 to-purple-200 rounded-lg outline-none;
}

.slider-input::-webkit-slider-thumb {
  -webkit-appearance: none;
  @apply w-6 h-6 bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full cursor-pointer shadow-lg;
  transition: all 0.2s ease;
}

.slider-input::-webkit-slider-thumb:hover {
  @apply from-indigo-600 to-purple-600 transform scale-110;
}

.slider-input::-moz-range-thumb {
  @apply w-6 h-6 bg-gradient-to-r from-indigo-500 to-purple-500 border-none rounded-full cursor-pointer shadow-lg;
  transition: all 0.2s ease;
}

.slider-input::-moz-range-thumb:hover {
  @apply from-indigo-600 to-purple-600 transform scale-110;
}

input[type="number"] {
  @apply focus:outline-none;
  -moz-appearance: textfield;
  appearance: textfield;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style> 