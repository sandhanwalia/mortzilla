<template>
    <MainLayout>
      <div class="max-w-5xl mx-auto">
       
        
        <!-- Header Section -->
        <div class="text-center mb-12">
          <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3 leading-relaxed pb-1">
            Mortgage Affordability Calculator
          </h1>
          <p class="text-gray-600">Calculate how much house you can afford based on your income and expenses</p>
        </div>
        
        <div class="grid lg:grid-cols-3 gap-8">
          <!-- Input Card -->
          <div class="lg:col-span-2 bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90">
            <h2 class="text-xl font-semibold text-gray-800 mb-6">Your Financial Details</h2>
            
            <!-- Input Fields -->
            <div class="space-y-6">
              <!-- Annual Income -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Annual Income</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                  <input 
                    type="text" 
                    :value="formatNumber(annualIncome)"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      annualIncome = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter your annual income"
                  />
                </div>
                <div class="mt-1 text-sm">
                  <span class="text-gray-600">Monthly Income: </span>
                  <span class="font-medium">${{ formatNumber(monthlyIncome) }}</span>
                </div>
              </div>
  
              <!-- Monthly Debts -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Monthly Debts</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                  <input 
                    type="text" 
                    :value="formatNumber(monthlyDebts)"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      monthlyDebts = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter your monthly debts"
                  />
                </div>
                <div class="mt-1 text-sm">
                  <span class="text-gray-600">Current DTI: </span>
                  <span class="font-medium" :class="currentDTIClass">{{ currentDTI }}%</span>
                </div>
              </div>
  
              <!-- Down Payment -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Down Payment</label>
                <div class="relative">
                  <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                  <input 
                    type="text" 
                    :value="formatNumber(downPayment)"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      downPayment = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter your down payment amount"
                  />
                </div>
              </div>
  
              <!-- Loan Term -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Loan Term</label>
                <select 
                  v-model="loanTerm"
                  class="w-full py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                >
                  <option value="15">15 years</option>
                  <option value="20">20 years</option>
                  <option value="30">30 years</option>
                </select>
              </div>
  
              <!-- Interest Rate -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (%)</label>
                <input
                  type="range"
                  v-model="interestRate"
                  class="slider-input"
                  min="0"
                  max="14"
                  step="0.1"
                />
                <div class="input-container">
                  <input 
                    type="text" 
                    :value="interestRate"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      interestRate = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-4 pr-8 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter interest rate"
                  />
                  <span class="percentage-symbol">%</span>
                </div>
              </div>
  
              <!-- Property Tax Rate -->
              <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Property Tax Rate (%)</label>
                <input
                  type="range"
                  v-model="propertyTaxRate"
                  class="slider-input"
                  min="0"
                  max="5"
                  step="0.1"
                />
                <div class="input-container">
                  <input 
                    type="text" 
                    :value="propertyTaxRate"
                    @input="e => {
                      const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                      propertyTaxRate = isNaN(value) ? 0 : value
                    }"
                    class="w-full pl-4 pr-8 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                    placeholder="Enter property tax rate"
                  />
                  <span class="percentage-symbol">%</span>
                </div>
              </div>
  
              <!-- Additional Costs Section -->
              <div class="mt-8 border rounded-xl p-6 bg-gray-50">
                <h3 class="text-lg font-medium text-gray-800 mb-4">Additional Monthly Costs</h3>
                
                <!-- Home Insurance -->
                <div class="flex items-center justify-between mb-4">
                  <label class="text-sm text-gray-600">Home Insurance</label>
                  <div class="flex space-x-2">
                    <span class="text-gray-500">$</span>
                    <input
                      type="number"
                      v-model="homeInsurance"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                  </div>
                </div>

                <!-- Maintenance Costs -->
                <div class="flex items-center justify-between mb-4">
                  <label class="text-sm text-gray-600">Monthly Maintenance</label>
                  <div class="flex space-x-2">
                    <span class="text-gray-500">$</span>
                    <input
                      type="number"
                      v-model="maintenanceCosts"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                  </div>
                  <div class="text-xs text-gray-500">Recommended: 1% of home value annually</div>
                </div>
  
                <!-- HOA Fees -->
                <div class="flex items-center justify-between">
                  <label class="text-sm text-gray-600">HOA Fees</label>
                  <div class="flex space-x-2">
                    <span class="text-gray-500">$</span>
                    <input
                      type="number"
                      v-model="hoaFees"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                  </div>
                </div>
              </div>

              <!-- Down Payment Effects -->
              <div class="mt-8 border rounded-xl p-6 bg-gray-50">
                <h3 class="text-lg font-medium text-gray-800 mb-4">Down Payment Analysis</h3>
                <div class="grid grid-cols-2 gap-4">
                  <div class="text-center p-4 bg-white rounded-lg shadow-sm">
                    <div class="text-sm text-gray-600">Down Payment %</div>
                    <div class="text-xl font-semibold text-indigo-600">{{ downPaymentPercentage }}%</div>
                  </div>
                  <div class="text-center p-4 bg-white rounded-lg shadow-sm">
                    <div class="text-sm text-gray-600">Monthly Savings</div>
                    <div class="text-xl font-semibold text-green-600">${{ formatNumber(downPaymentSavings) }}</div>
                  </div>
                </div>
              </div>

              <!-- Loan Term Comparison -->
              <div class="mt-8 border rounded-xl p-6 bg-gray-50">
                <h3 class="text-lg font-medium text-gray-800 mb-4">Loan Term Comparison</h3>
                <div class="space-y-4">
                  <div v-for="term in loanTerms" :key="term.value" 
                       class="p-4 bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow">
                    <div class="flex justify-between items-center">
                      <div>
                        <div class="font-medium">{{ term.label }}</div>
                        <div class="text-sm text-gray-600">Monthly Payment: ${{ formatNumber(term.monthlyPayment) }}</div>
                      </div>
                      <div class="text-right">
                        <div class="text-sm text-gray-600">Total Interest</div>
                        <div class="font-medium" :class="term.totalInterest > loanTerms[0].totalInterest ? 'text-red-600' : 'text-green-600'">
                          ${{ formatNumber(term.totalInterest) }}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
  
          <!-- Results Card -->
          <div class="lg:col-span-1">
            <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90 sticky top-8">
              <!-- Affordability Summary -->
              <div class="text-center p-6 bg-gradient-to-br from-indigo-50 to-purple-50 rounded-xl mb-6">
                <h3 class="text-gray-600 mb-2">Maximum Home Price</h3>
                <div class="text-4xl font-bold text-indigo-600">${{ formatNumber(maxHomePrice) }}</div>
              </div>
  
              <!-- Monthly Payment Breakdown -->
              <div class="space-y-4 mb-8">
                <h4 class="font-semibold text-gray-800 border-b pb-2">Monthly Payment Breakdown</h4>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Principal & Interest</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyPI) }}</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Property Tax</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyPropertyTax) }}</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Home Insurance</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(homeInsurance) }}</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Maintenance</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(maintenanceCosts) }}</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">HOA Fees</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(hoaFees) }}</span>
                </div>
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Total Monthly Payment</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(totalMonthlyPayment) }}</span>
                </div>
              </div>
  
              <!-- Affordability Indicators -->
              <div class="space-y-4 pt-6 border-t border-gray-200">
                <h4 class="font-semibold text-gray-800 pb-2">Affordability Indicators</h4>
                
                <!-- DTI Ratio -->
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">DTI Ratio</span>
                  <div class="text-right">
                    <div class="font-semibold" :class="dtiRatioClass">{{ actualDTI }}%</div>
                    <div class="text-sm text-gray-500">of monthly income</div>
                  </div>
                </div>
  
                <!-- Monthly Income -->
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Monthly Income</span>
                  <div class="text-right">
                    <div class="font-semibold text-gray-800">${{ formatNumber(monthlyIncome) }}</div>
                    <div class="text-sm text-gray-500">before taxes</div>
                  </div>
                </div>
  
                <!-- Available for Housing -->
                <div class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Available for Housing</span>
                  <div class="text-right">
                    <div class="font-semibold text-gray-800">${{ formatNumber(maxMonthlyPayment) }}</div>
                    <div class="text-sm text-gray-500">based on {{ dtiRatio }}% DTI</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </MainLayout>
  </template>
  
  <script setup>
  import { ref, computed, onMounted } from 'vue'
  import MainLayout from '@/Layouts/MainLayout.vue'
  
  // Add console log to verify script is running
  console.log('AffordabilityCalculator component loaded')
  
  // Input values with default values
  const annualIncome = ref(100000)
  const monthlyDebts = ref(0)
  const downPayment = ref(0)
  const loanTerm = ref(30)
  const interestRate = ref(6.5)
  const dtiRatio = ref(43)
  const propertyTaxRate = ref(1.2)
  const homeInsurance = ref(150)
  const hoaFees = ref(0)
  const maintenanceCosts = ref(0)
  
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
  
  const calculateMonthlyPI = (price, downPaymentAmount, term, rate) => {
    const p = price - downPaymentAmount
    const r = (rate / 100) / 12
    const n = term * 12
    
    if (r === 0) return p / n
    
    return (p * (r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1))
  }
  
  // Initialize values on component mount
  onMounted(() => {
    // Set default maintenance costs (1% of a $300,000 home annually)
    maintenanceCosts.value = 250
  })
  
  // Computed values
  const monthlyIncome = computed(() => {
    return annualIncome.value / 12
  })
  
  const maxMonthlyPayment = computed(() => {
    const maxDTIPayment = monthlyIncome.value * (dtiRatio.value / 100)
    return maxDTIPayment - monthlyDebts.value
  })
  
  const monthlyRate = computed(() => {
    return (interestRate.value / 100) / 12
  })
  
  const numberOfPayments = computed(() => {
    return loanTerm.value * 12
  })
  
  // Helper function to calculate max home price
  const calculateMaxHomePrice = () => {
    let low = 0
    let high = 10000000 // $10M as upper limit
    let mid
    let bestPrice = 0
  
    while (low <= high) {
      mid = Math.floor((low + high) / 2)
      const monthlyPI = calculateMonthlyPI(mid, downPayment.value, loanTerm.value, interestRate.value)
      const monthlyPropertyTax = (mid * propertyTaxRate.value) / 100 / 12
      const totalPayment = monthlyPI + monthlyPropertyTax + homeInsurance.value + hoaFees.value + maintenanceCosts.value
  
      if (totalPayment <= maxMonthlyPayment.value) {
        bestPrice = mid
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
  
    return bestPrice
  }
  
  const maxHomePrice = computed(() => {
    return calculateMaxHomePrice()
  })
  
  const monthlyPI = computed(() => {
    return calculateMonthlyPI(maxHomePrice.value, downPayment.value, loanTerm.value, interestRate.value).toFixed(2)
  })
  
  const monthlyPropertyTax = computed(() => {
    return ((maxHomePrice.value * propertyTaxRate.value) / 100 / 12).toFixed(2)
  })
  
  const totalMonthlyPayment = computed(() => {
    return (parseFloat(monthlyPI.value) + 
           parseFloat(monthlyPropertyTax.value) + 
           parseFloat(homeInsurance.value) + 
           parseFloat(maintenanceCosts.value) + 
           parseFloat(hoaFees.value)).toFixed(2)
  })
  
  const actualDTI = computed(() => {
    const totalDebts = parseFloat(totalMonthlyPayment.value) + monthlyDebts.value
    return ((totalDebts / monthlyIncome.value) * 100).toFixed(1)
  })
  
  const dtiRatioClass = computed(() => {
    if (parseFloat(actualDTI.value) <= 28) return 'text-green-600'
    if (parseFloat(actualDTI.value) <= 43) return 'text-yellow-600'
    return 'text-red-600'
  })
  
  // Add new computed property for current DTI
  const currentDTI = computed(() => {
    if (monthlyIncome.value === 0) return '0.0'
    return ((monthlyDebts.value / monthlyIncome.value) * 100).toFixed(1)
  })
  
  const currentDTIClass = computed(() => {
    const dti = parseFloat(currentDTI.value)
    if (dti <= 28) return 'text-green-600'
    if (dti <= 43) return 'text-yellow-600'
    return 'text-red-600'
  })
  
  // Add new computed properties
  const downPaymentPercentage = computed(() => {
    if (maxHomePrice.value === 0) return 0
    return ((downPayment.value / maxHomePrice.value) * 100).toFixed(1)
  })
  
  const downPaymentSavings = computed(() => {
    const currentPI = calculateMonthlyPI(maxHomePrice.value, downPayment.value, loanTerm.value, interestRate.value)
    const noDownPaymentPI = calculateMonthlyPI(maxHomePrice.value, 0, loanTerm.value, interestRate.value)
    return noDownPaymentPI - currentPI
  })
  
  const loanTerms = computed(() => {
    return [
      { value: 15, label: '15 Year Fixed' },
      { value: 20, label: '20 Year Fixed' },
      { value: 30, label: '30 Year Fixed' }
    ].map(term => {
      const monthlyPayment = calculateMonthlyPI(maxHomePrice.value, downPayment.value, term.value, interestRate.value)
      const totalInterest = (monthlyPayment * term.value * 12) - (maxHomePrice.value - downPayment.value)
      return {
        ...term,
        monthlyPayment,
        totalInterest
      }
    })
  })
  </script>
  
  <style scoped>
  .slider-input {
    -webkit-appearance: none;
    @apply h-2 bg-gradient-to-r from-indigo-200 to-purple-200 rounded-lg outline-none;
    width: 100%;
    margin-bottom: 1rem;
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
  
  /* Add styles for the input container */
  .input-container {
    @apply relative w-full;
  }
  
  /* Add styles for the percentage symbol */
  .percentage-symbol {
    @apply absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500;
  }
  </style>