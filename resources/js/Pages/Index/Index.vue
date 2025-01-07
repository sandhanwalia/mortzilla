<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8">
    <div class="max-w-5xl mx-auto">
      <!-- Header Section -->
      <div class="text-center mb-12">
        <h1 class="text-4xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-3 leading-relaxed pb-1">
          Mortgage Calculator
        </h1>
        <p class="text-gray-600">Calculate your monthly mortgage payments and explore different scenarios</p>
      </div>
      
      <div class="grid lg:grid-cols-3 gap-8">
        <!-- Input Card -->
        <div class="lg:col-span-2 bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90">
          <h2 class="text-xl font-semibold text-gray-800 mb-6">Loan Details</h2>
          
          <!-- Input Fields -->
          <div class="space-y-6">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Home Price</label>
              <div class="relative">
                <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500">$</span>
                <input 
                  type="text" 
                  :value="formatNumber(homePrice)"
                  @input="e => {
                    const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                    homePrice = isNaN(value) ? 0 : value
                  }"
                  class="w-full pl-8 pr-4 py-3 border-2 border-indigo-100 rounded-xl focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200"
                  placeholder="Enter home price"
                />
              </div>
            </div>

            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Down Payment</label>
              <div class="space-y-6">
                <!-- Percentage Slider - Now Primary Input -->
                <div class="bg-gray-50 p-4 rounded-xl">
                  <div class="flex justify-between mb-3">
                    <label class="text-base font-medium text-gray-700">Down Payment: ${{ formatNumber(downPayment) }}</label>
                    <span class="text-indigo-600 font-semibold text-lg">{{ downPaymentPercentage }}%</span>
                  </div>
                  <input 
                    type="range" 
                    v-model="downPaymentPercentage" 
                    min="0" 
                    max="100" 
                    step="1"
                    class="slider-input w-full"
                    @input="updateDownPaymentFromPercentage"
                  />
                  <div class="flex justify-between text-xs text-gray-500 mt-2">
                    <span>0%</span>
                    <span>100%</span>
                  </div>

                  <!-- Dollar Amount Input - Now inside the same container -->
                  <div class="mt-4 relative w-3/4 mx-auto">
                    <span class="text-xs text-gray-500 mb-1 block">Or enter an amount:</span>
                    <span class="absolute left-4 top-[55%] transform -translate-y-1/2 text-gray-500">$</span>
                    <input 
                      type="text" 
                      :value="formatNumber(downPayment)"
                      @input="e => {
                        const value = parseFloat(e.target.value.replace(/[^0-9.]/g, ''))
                        downPayment = isNaN(value) ? 0 : value
                        validateDownPayment()
                      }"
                      class="w-full pl-8 pr-4 py-2 border-2 border-indigo-100 rounded-lg focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400 transition-all duration-200 text-sm"
                      placeholder="Enter specific amount"
                    />
                  </div>
                </div>

                <!-- Full Down Payment Message -->
                <div v-if="isFullDownPayment" class="text-center p-4 bg-green-50 rounded-xl mt-4">
                  <p class="text-green-600">
                    Looks like you don't need a mortgage loan! 😊
                  </p>
                </div>
              </div>
            </div>

            <!-- Sliders with Modern Design -->
            <div class="space-y-6 mt-8">
              <div>
                <div class="flex justify-between mb-2">
                  <label class="text-sm font-medium text-gray-700">Interest Rate</label>
                  <span class="text-indigo-600 font-semibold">{{ interestRate }}%</span>
                </div>
                <input 
                  type="range" 
                  v-model="interestRate" 
                  min="2" 
                  max="8" 
                  step="0.125"
                  class="slider-input w-full"
                />
                <div class="flex justify-between text-xs text-gray-500 mt-1">
                  <span>2%</span>
                  <span>8%</span>
                </div>
              </div>

              <div>
                <div class="flex justify-between mb-2">
                  <label class="text-sm font-medium text-gray-700">Loan Term</label>
                  <span class="text-indigo-600 font-semibold">{{ loanTerm }} years</span>
                </div>
                <input 
                  type="range" 
                  v-model="loanTerm" 
                  min="15" 
                  max="30" 
                  step="5"
                  class="slider-input w-full"
                />
                <div class="flex justify-between text-xs text-gray-500 mt-1">
                  <span>15 years</span>
                  <span>30 years</span>
                </div>
              </div>
            </div>

            <!-- Additional Costs Section -->
            <div class="mt-8 border rounded-xl p-6 bg-gray-50">
              <!-- Checkbox to Enable/Disable -->
              <div class="flex items-center justify-between mb-6">
                <div class="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    v-model="includeAdditionalCosts"
                    id="includeCosts"
                    class="w-4 h-4 text-indigo-600 rounded border-gray-300 focus:ring-indigo-500"
                  >
                  <label for="includeCosts" class="font-medium text-gray-700">
                    Include Taxes & Costs Below
                  </label>
                </div>
                
                <!-- Annual/Monthly Toggle -->
                <div v-if="includeAdditionalCosts" class="flex items-center space-x-2">
                  <span class="text-sm text-gray-600">Enter amounts as:</span>
                  <div class="flex bg-gray-100 rounded-lg p-1">
                    <button 
                      @click="costInputType = 'annual'"
                      :class="[
                        'px-3 py-1 rounded-md text-sm font-medium transition-all duration-200',
                        costInputType === 'annual' 
                          ? 'bg-white shadow text-indigo-600' 
                          : 'text-gray-500 hover:text-gray-700'
                      ]"
                    >
                      Annual
                    </button>
                    <button 
                      @click="costInputType = 'monthly'"
                      :class="[
                        'px-3 py-1 rounded-md text-sm font-medium transition-all duration-200',
                        costInputType === 'monthly' 
                          ? 'bg-white shadow text-indigo-600' 
                          : 'text-gray-500 hover:text-gray-700'
                      ]"
                    >
                      Monthly
                    </button>
                  </div>
                </div>
              </div>

              <!-- Rest of the additional costs content (only show if checkbox is checked) -->
              <div v-if="includeAdditionalCosts" class="space-y-4">
                <!-- Property Taxes -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center space-x-2">
                    <label class="text-sm text-gray-600">Property Taxes</label>
                    <span class="text-xs text-gray-400">
                      {{ propertyTaxType === '%' ? '(% of home value)' : (costInputType === 'annual' ? '(annually)' : '(monthly)') }}
                    </span>
                  </div>
                  <div class="flex space-x-2">
                    <input
                      type="number"
                      v-model="propertyTaxValue"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                      step="0.1"
                    />
                    <select 
                      v-model="propertyTaxType"
                      class="border rounded-md text-gray-700 focus:ring-indigo-500 focus:border-indigo-500"
                    >
                      <option value="%">%</option>
                      <option value="$">$</option>
                    </select>
                  </div>
                </div>

                <!-- Home Insurance -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center space-x-2">
                    <label class="text-sm text-gray-600">Home Insurance</label>
                    <span class="text-xs text-gray-400">{{ costInputType === 'annual' ? '(annually)' : '(monthly)' }}</span>
                  </div>
                  <div class="flex space-x-2">
                    <input
                      type="number"
                      v-model="homeInsurance"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                    <select class="border rounded-md text-gray-700">
                      <option value="$">$</option>
                    </select>
                  </div>
                </div>

                <!-- PMI Insurance -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center space-x-2">
                    <label class="text-sm text-gray-600">PMI Insurance</label>
                    <span class="text-xs text-gray-400">{{ costInputType === 'annual' ? '(annually)' : '(monthly)' }}</span>
                  </div>
                  <div class="flex space-x-2">
                    <input
                      type="number"
                      v-model="pmiInsurance"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                    <select class="border rounded-md text-gray-700">
                      <option value="$">$</option>
                    </select>
                  </div>
                </div>

                <!-- HOA Fee -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center space-x-2">
                    <label class="text-sm text-gray-600">HOA Fee</label>
                    <span class="text-xs text-gray-400">{{ costInputType === 'annual' ? '(annually)' : '(monthly)' }}</span>
                  </div>
                  <div class="flex space-x-2">
                    <input
                      type="number"
                      v-model="hoaFee"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                    <select class="border rounded-md text-gray-700">
                      <option value="$">$</option>
                    </select>
                  </div>
                </div>

                <!-- Other Costs -->
                <div class="flex items-center justify-between">
                  <div class="flex items-center space-x-2">
                    <label class="text-sm text-gray-600">Other Costs</label>
                    <span class="text-xs text-gray-400">{{ costInputType === 'annual' ? '(annually)' : '(monthly)' }}</span>
                  </div>
                  <div class="flex space-x-2">
                    <input
                      type="number"
                      v-model="otherCosts"
                      class="w-24 px-2 py-1 border rounded-md focus:ring-indigo-500 focus:border-indigo-500"
                    />
                    <select class="border rounded-md text-gray-700">
                      <option value="$">$</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Results Card -->
        <div class="lg:col-span-1">
          <div class="bg-white rounded-2xl shadow-xl p-8 backdrop-blur-lg bg-opacity-90 sticky top-8">
            <!-- Monthly Payment Section -->
            <div class="text-center p-6 bg-gradient-to-br from-indigo-50 to-purple-50 rounded-xl mb-6">
              <h3 class="text-gray-600 mb-2">Monthly Payment</h3>
              <div class="text-4xl font-bold text-indigo-600">${{ formatNumber(monthlyPayment) }}</div>
            </div>

            <!-- Payment Breakdown -->
            <div class="space-y-4 mb-8">
              <h4 class="font-semibold text-gray-800 border-b pb-2">Payment Breakdown</h4>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Principal & Interest</span>
                <span class="font-semibold text-gray-800">${{ formatNumber(baseMonthlyPayment) }}</span>
              </div>

              <!-- Additional Costs (shown only when included and non-zero) -->
              <template v-if="includeAdditionalCosts">
                <div v-if="monthlyPropertyTax > 0" class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Property Tax</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyPropertyTax) }}</span>
                </div>
                <div v-if="monthlyHomeInsurance > 0" class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Home Insurance</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyHomeInsurance) }}</span>
                </div>
                <div v-if="monthlyPMI > 0" class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">PMI</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyPMI) }}</span>
                </div>
                <div v-if="monthlyHOA > 0" class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">HOA Fee</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyHOA) }}</span>
                </div>
                <div v-if="monthlyOtherCosts > 0" class="flex justify-between py-3 border-b border-gray-100">
                  <span class="text-gray-600">Other Monthly Costs</span>
                  <span class="font-semibold text-gray-800">${{ formatNumber(monthlyOtherCosts) }}</span>
                </div>
              </template>
            </div>

            <!-- Loan Summary Section -->
            <div class="space-y-4 pt-6 border-t border-gray-200">
              <h4 class="font-semibold text-gray-800 pb-2">Loan Summary</h4>
              
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Loan Amount</span>
                <div class="text-right">
                  <div class="font-semibold text-gray-800">${{ formatNumber(loanAmount) }}</div>
                  <div class="text-sm text-gray-500">{{ loanToValue }}% of purchase price</div>
                </div>
              </div>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Total Interest</span>
                <div class="text-right">
                  <div class="font-semibold text-gray-800">${{ formatNumber(totalInterest) }}</div>
                  <div class="text-sm text-gray-500">{{ totalInterestPercentage }}% of loan amount</div>
                </div>
              </div>
              <div class="flex justify-between py-3 border-b border-gray-100">
                <span class="text-gray-600">Total Cost</span>
                <div class="text-right">
                  <div class="font-semibold text-gray-800">${{ formatNumber(totalCost) }}</div>
                  <div class="text-sm text-gray-500">{{ totalCostPercentage }}% of purchase price</div>
                </div>
              </div>

              <!-- Move button here -->
              <div class="pt-4">
                <button 
                  @click="showAmortization = true"
                  class="w-full px-4 py-2 text-sm font-medium text-indigo-600 hover:text-indigo-700 bg-indigo-50 hover:bg-indigo-100 rounded-lg transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed"
                  :disabled="isFullDownPayment"
                >
                  Show Amortization Schedule
                </button>
              </div>

              <div class="pt-2">
                <button 
                  @click="showEquityProjection = true"
                  class="w-full px-4 py-2 text-sm font-medium text-purple-600 hover:text-purple-700 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed"
                  :disabled="isFullDownPayment"
                >
                  View Equity Projection
                </button>
              </div>

              <div class="pt-2">
                <button 
                  @click="downloadDetailedReport"
                  class="w-full px-4 py-2 text-sm font-medium text-emerald-600 hover:text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg transition-colors duration-200 flex items-center justify-center disabled:opacity-50 disabled:cursor-not-allowed"
                  :disabled="isFullDownPayment"
                >
                  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                  </svg>
                  Download Detailed Report
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Add the Amortization Schedule Modal -->
  <div v-if="showAmortization" class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-xl shadow-2xl max-w-6xl w-full max-h-[90vh] flex flex-col">
      <!-- Modal Header -->
      <div class="p-6 border-b border-gray-200">
        <div class="flex justify-between items-start">
          <div>
            <h3 class="text-xl font-semibold text-gray-800">Amortization Schedule</h3>
            <p class="text-sm text-gray-600 mt-1">
              Loan amount: ${{ formatNumber(loanAmount) }} at {{ interestRate }}% for {{ loanTerm }} years
            </p>
          </div>
          <div class="flex items-center space-x-4">
            <!-- View toggle and Download buttons -->
            <div class="flex bg-gray-100 rounded-lg p-1">
              <button 
                @click="scheduleType = 'monthly'"
                :class="[
                  'px-3 py-1 rounded-md text-sm font-medium transition-all duration-200',
                  scheduleType === 'monthly' 
                    ? 'bg-white shadow text-indigo-600' 
                    : 'text-gray-500 hover:text-gray-700'
                ]"
              >
                Monthly
              </button>
              <button 
                @click="scheduleType = 'yearly'"
                :class="[
                  'px-3 py-1 rounded-md text-sm font-medium transition-all duration-200',
                  scheduleType === 'yearly' 
                    ? 'bg-white shadow text-indigo-600' 
                    : 'text-gray-500 hover:text-gray-700'
                ]"
              >
                Yearly
              </button>
            </div>
            <button 
              @click="downloadPDF('amortization')"
              class="text-indigo-600 hover:text-indigo-700"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
              </svg>
            </button>
            <!-- Close button -->
            <button 
              @click="showAmortization = false"
              class="text-gray-500 hover:text-gray-700"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Modal Body with Table -->
      <div class="p-6 overflow-auto">
        <table class="w-full text-sm">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-2 text-left text-gray-600">Payment #</th>
              <th class="px-4 py-2 text-right text-gray-600">Payment</th>
              <th class="px-4 py-2 text-right text-gray-600">Principal</th>
              <th class="px-4 py-2 text-right text-gray-600">Interest</th>
              <th class="px-4 py-2 text-right text-gray-600">Remaining Balance</th>
              <th class="px-4 py-2 text-right text-gray-600">Total Interest Paid</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-for="row in amortizationSchedule" :key="row.payment" class="hover:bg-gray-50">
              <td class="px-4 py-2 text-gray-900">{{ row.payment }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.paymentAmount) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.principal) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.interest) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.remainingBalance) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.totalInterest) }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Add the Equity Projection Modal -->
  <div v-if="showEquityProjection" class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-xl shadow-2xl max-w-6xl w-full max-h-[90vh] flex flex-col">
      <!-- Modal Header -->
      <div class="p-6 border-b border-gray-200">
        <div class="flex justify-between items-start">
          <div>
            <h3 class="text-xl font-semibold text-gray-800">Home Equity Projection</h3>
            <p class="text-sm text-gray-600 mt-1">
              See how your home equity grows over time
            </p>
          </div>
          <div class="flex items-center space-x-4">
            <!-- Download button -->
            <button 
              @click="downloadPDF('equity')"
              class="text-indigo-600 hover:text-indigo-700"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
              </svg>
            </button>
            <!-- Close button -->
            <button 
              @click="showEquityProjection = false"
              class="text-gray-500 hover:text-gray-700"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Appreciation Rate Slider -->
      <div class="w-full max-w-3xl mx-auto bg-gray-50 p-4 rounded-xl">
        <div class="flex justify-between mb-2">
          <label class="text-sm font-medium text-gray-700">Home Appreciation Rate</label>
          <span class="text-indigo-600 font-semibold">{{ appreciationRate }}%</span>
        </div>
        <input 
          type="range" 
          v-model="appreciationRate" 
          min="0" 
          max="10" 
          step="0.1"
          class="slider-input w-full"
        />
        <div class="flex justify-between text-xs text-gray-500 mt-1">
          <span>0%</span>
          <span>10%</span>
        </div>
      </div>

      <!-- Modal Body with Chart and Table -->
      <div class="p-6 overflow-auto">
        <!-- Interactive Chart -->
        <div class="mb-8 bg-white rounded-xl p-6 shadow-sm">
          <canvas ref="equityChart"></canvas>
        </div>

        <!-- Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          <div class="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-xl p-4">
            <div class="text-sm text-gray-600">Final Home Value</div>
            <div class="text-2xl font-bold text-gray-900">
              ${{ formatNumber(equityProjection[equityProjection.length - 1]?.homeValue || 0) }}
            </div>
            <div class="text-sm text-green-600">
              +{{ calculateAppreciationPercentage }}% from purchase
            </div>
          </div>
          <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-xl p-4">
            <div class="text-sm text-gray-600">Total Equity Built</div>
            <div class="text-2xl font-bold text-gray-900">
              ${{ formatNumber(equityProjection[equityProjection.length - 1].equity) }}
            </div>
            <div class="text-sm text-indigo-600">
              {{ equityProjection[equityProjection.length - 1].equityPercentage }}% of home value
            </div>
          </div>
          <div class="bg-gradient-to-br from-green-50 to-emerald-50 rounded-xl p-4">
            <div class="text-sm text-gray-600">Average Annual Growth</div>
            <div class="text-2xl font-bold text-gray-900">
              ${{ formatNumber(calculateAverageAnnualGrowth) }}
            </div>
            <div class="text-sm text-emerald-600">Per year</div>
          </div>
        </div>

        <!-- Detailed Table -->
        <table class="w-full text-sm">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-4 py-2 text-left text-gray-600">Year</th>
              <th class="px-4 py-2 text-right text-gray-600">Home Value</th>
              <th class="px-4 py-2 text-right text-gray-600">Loan Balance</th>
              <th class="px-4 py-2 text-right text-gray-600">Home Equity</th>
              <th class="px-4 py-2 text-right text-gray-600">Equity %</th>
              <th class="px-4 py-2 text-right text-gray-600">Annual Growth</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-for="row in equityProjection" :key="row.year" class="hover:bg-gray-50">
              <td class="px-4 py-2 text-gray-900">{{ row.year }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.homeValue) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.loanBalance) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">${{ formatNumber(row.equity) }}</td>
              <td class="px-4 py-2 text-right text-gray-900">{{ row.equityPercentage }}%</td>
              <td class="px-4 py-2 text-right" :class="row.annualGrowth >= 0 ? 'text-green-600' : 'text-red-600'">
                ${{ formatNumber(row.annualGrowth) }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch, onUnmounted } from 'vue'
import Chart from 'chart.js/auto'
import { jsPDF } from 'jspdf'
import html2canvas from 'html2canvas/dist/html2canvas.js'

// Input values
const homePrice = ref(300000)
const downPayment = ref(60000)
const interestRate = ref(6.5)
const loanTerm = ref(30)

// Computed values
const loanAmount = computed(() => {
  return homePrice.value - downPayment.value
})

const monthlyRate = computed(() => {
  return (interestRate.value / 100) / 12
})

const numberOfPayments = computed(() => {
  return loanTerm.value * 12
})

const includeAdditionalCosts = ref(false)
const propertyTaxValue = ref(1.2)
const propertyTaxType = ref('%')
const homeInsurance = ref(1500)
const pmiInsurance = ref(0)
const hoaFee = ref(0)
const otherCosts = ref(4000)
const costInputType = ref('annual')

const additionalMonthlyCosts = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  
  // Calculate property tax based on type
  const annualPropertyTax = propertyTaxType.value === '%' 
    ? (homePrice.value * propertyTaxValue.value) / 100 
    : propertyTaxValue.value

  const monthlyPropertyTax = propertyTaxType.value === '%'
    ? annualPropertyTax / 12
    : (costInputType.value === 'annual' ? propertyTaxValue.value / 12 : propertyTaxValue.value)

  const monthlyHomeInsurance = costInputType.value === 'annual' 
    ? homeInsurance.value / 12 
    : homeInsurance.value

  const monthlyPMIAmount = costInputType.value === 'annual' 
    ? pmiInsurance.value / 12 
    : pmiInsurance.value

  const monthlyHOAAmount = costInputType.value === 'annual' 
    ? hoaFee.value / 12 
    : hoaFee.value

  const monthlyOtherCostsAmount = costInputType.value === 'annual' 
    ? otherCosts.value / 12 
    : otherCosts.value

  return monthlyPropertyTax + 
         monthlyHomeInsurance + 
         monthlyPMIAmount + 
         monthlyHOAAmount + 
         monthlyOtherCostsAmount
})

const baseMonthlyPayment = computed(() => {
  const p = loanAmount.value
  const r = monthlyRate.value
  const n = numberOfPayments.value
  
  if (r === 0) return p / n
  
  return (p * (r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1)).toFixed(2)
})

const monthlyPropertyTax = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  
  if (propertyTaxType.value === '%') {
    return (homePrice.value * propertyTaxValue.value) / 100 / 12
  } else {
    return costInputType.value === 'annual' 
      ? propertyTaxValue.value / 12 
      : propertyTaxValue.value
  }
})

const monthlyHomeInsurance = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  return costInputType.value === 'annual' 
    ? homeInsurance.value / 12 
    : homeInsurance.value
})

const monthlyPMI = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  return costInputType.value === 'annual' 
    ? pmiInsurance.value / 12 
    : pmiInsurance.value
})

const monthlyHOA = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  return costInputType.value === 'annual' 
    ? hoaFee.value / 12 
    : hoaFee.value
})

const monthlyOtherCosts = computed(() => {
  if (!includeAdditionalCosts.value) return 0
  return costInputType.value === 'annual' 
    ? otherCosts.value / 12 
    : otherCosts.value
})

const monthlyPayment = computed(() => {
  return (parseFloat(baseMonthlyPayment.value) + additionalMonthlyCosts.value).toFixed(2)
})

const principalAndInterest = computed(() => {
  return monthlyPayment.value
})

const totalLoanPayments = computed(() => {
  // Total of all Principal & Interest payments over the loan term
  return baseMonthlyPayment.value * numberOfPayments.value
})

const totalInterest = computed(() => {
  // Total interest = Total of all P&I payments - Original loan amount
  return (totalLoanPayments.value - loanAmount.value).toFixed(2)
})

const totalCost = computed(() => {
  // Total cost = Down payment + Total of all P&I payments
  return (downPayment.value + totalLoanPayments.value).toFixed(2)
})

const loanToValue = computed(() => {
  return ((loanAmount.value / homePrice.value) * 100).toFixed(1)
})

const totalInterestPercentage = computed(() => {
  // Interest as percentage of loan amount
  return ((parseFloat(totalInterest.value) / loanAmount.value) * 100).toFixed(1)
})

const totalCostPercentage = computed(() => {
  // Total cost as percentage of purchase price
  return ((parseFloat(totalCost.value) / homePrice.value) * 100).toFixed(1)
})

const formatNumber = (num) => {
  return new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(parseFloat(num))
}

// Add these to your existing refs
const showAmortization = ref(false)
const scheduleType = ref('monthly')

// Add this computed property
const amortizationSchedule = computed(() => {
  const schedule = []
  let balance = loanAmount.value
  let totalInterest = 0
  const payment = parseFloat(baseMonthlyPayment.value)
  const monthlyInterestRate = monthlyRate.value
  
  if (scheduleType.value === 'monthly') {
    for (let i = 1; i <= numberOfPayments.value; i++) {
      const interestPayment = balance * monthlyInterestRate
      const principalPayment = payment - interestPayment
      totalInterest += interestPayment
      balance -= principalPayment

      schedule.push({
        payment: i,
        paymentAmount: Number(payment.toFixed(2)),
        principal: Number(principalPayment.toFixed(2)),
        interest: Number(interestPayment.toFixed(2)),
        remainingBalance: Number(Math.max(0, balance).toFixed(2)),
        totalInterest: Number(totalInterest.toFixed(2))
      })
    }
  } else {
    // Yearly aggregation
    let yearlyData = {
      paymentAmount: 0,
      principal: 0,
      interest: 0
    }
    
    for (let i = 1; i <= numberOfPayments.value; i++) {
      const interestPayment = balance * monthlyInterestRate
      const principalPayment = payment - interestPayment
      totalInterest += interestPayment
      balance -= principalPayment
      
      yearlyData.paymentAmount += payment
      yearlyData.principal += principalPayment
      yearlyData.interest += interestPayment

      if (i % 12 === 0) {
        schedule.push({
          payment: i / 12,
          paymentAmount: Number(yearlyData.paymentAmount.toFixed(2)),
          principal: Number(yearlyData.principal.toFixed(2)),
          interest: Number(yearlyData.interest.toFixed(2)),
          remainingBalance: Number(Math.max(0, balance).toFixed(2)),
          totalInterest: Number(totalInterest.toFixed(2))
        })
        
        yearlyData = {
          paymentAmount: 0,
          principal: 0,
          interest: 0
        }
      }
    }
  }
  
  return schedule
})

// Add these new refs
const appreciationRate = ref(3)
const showEquityProjection = ref(false)

// Add this computed property
const equityProjection = computed(() => {
  const projection = []
  let currentHomeValue = homePrice.value
  let previousEquity = downPayment.value
  let balance = loanAmount.value
  const payment = parseFloat(baseMonthlyPayment.value)
  const monthlyInterestRate = monthlyRate.value

  for (let year = 1; year <= loanTerm.value; year++) {
    // Calculate loan balance at end of year
    for (let month = 1; month <= 12; month++) {
      const interestPayment = balance * monthlyInterestRate
      const principalPayment = payment - interestPayment
      balance -= principalPayment
    }

    // Calculate home value with appreciation
    currentHomeValue *= (1 + appreciationRate.value / 100)
    
    const equity = currentHomeValue - Math.max(0, balance)
    const annualGrowth = equity - previousEquity
    previousEquity = equity

    projection.push({
      year,
      homeValue: Math.round(currentHomeValue),
      loanBalance: Math.max(0, Math.round(balance)),
      equity: Math.round(equity),
      equityPercentage: ((equity / currentHomeValue) * 100).toFixed(1),
      annualGrowth: Math.round(annualGrowth)
    })
  }

  return projection
})

// Add these refs
const equityChart = ref(null)
let chart = null

// Add this watch effect to update the chart when relevant values change
watch([equityProjection, showEquityProjection], ([newProjection, showModal], [oldProjection, oldShowModal]) => {
  if (showModal) {
    // Add a small delay to ensure the canvas is mounted
    setTimeout(() => {
      if (equityChart.value) {
    if (chart) {
      chart.destroy()
    }

    const ctx = equityChart.value.getContext('2d')
    chart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: newProjection.map(row => `Year ${row.year}`),
        datasets: [
          {
            label: 'Home Value',
            data: newProjection.map(row => row.homeValue),
            borderColor: '#6366f1',
            backgroundColor: '#6366f120',
            fill: true
          },
          {
            label: 'Loan Balance',
            data: newProjection.map(row => row.loanBalance),
            borderColor: '#ef4444',
            backgroundColor: '#ef444420',
            fill: true
          },
          {
            label: 'Equity',
            data: newProjection.map(row => row.equity),
            borderColor: '#10b981',
            backgroundColor: '#10b98120',
            fill: true
          }
        ]
      },
      options: {
        responsive: true,
        interaction: {
          intersect: false,
          mode: 'index'
        },
        plugins: {
          legend: {
            position: 'top'
          },
          tooltip: {
            callbacks: {
              label: function(context) {
                return `${context.dataset.label}: $${new Intl.NumberFormat('en-US').format(context.raw)}`
              }
            }
          }
        },
        scales: {
          y: {
            ticks: {
              callback: function(value) {
                return '$' + new Intl.NumberFormat('en-US').format(value)
              }
            }
          }
        }
      }
    })
      }
    }, 100)
  }
})

// Clean up chart on component unmount
onUnmounted(() => {
  if (chart) {
    chart.destroy()
  }
})

// Add these new computed properties
const calculateAppreciationPercentage = computed(() => {
  if (!equityProjection.value.length) return 0
  const finalValue = equityProjection.value[equityProjection.value.length - 1].homeValue
  return ((finalValue / homePrice.value - 1) * 100).toFixed(1)
})

const calculateAverageAnnualGrowth = computed(() => {
  if (!equityProjection.value.length) return 0
  const finalEquity = equityProjection.value[equityProjection.value.length - 1].equity
  const totalYears = loanTerm.value
  return Math.round(finalEquity / totalYears)
})

// Add these new refs and computed properties
const downPaymentPercentage = ref(20) // Default to 20%

const isFullDownPayment = computed(() => {
  return downPayment.value >= homePrice.value
})

// Add these new methods
const validateDownPayment = () => {
  // Ensure down payment doesn't exceed home price
  if (downPayment.value > homePrice.value) {
    downPayment.value = homePrice.value
  }
  // Update percentage when dollar amount changes
  downPaymentPercentage.value = Math.round((downPayment.value / homePrice.value) * 100)
}

const updateDownPaymentFromPercentage = () => {
  // Update dollar amount when percentage changes
  downPayment.value = Math.round((downPaymentPercentage.value / 100) * homePrice.value)
}

// Add watcher for home price changes
watch(homePrice, (newValue) => {
  // Maintain the same percentage when home price changes
  const currentPercentage = (downPayment.value / newValue) * 100
  downPaymentPercentage.value = Math.round(currentPercentage)
  updateDownPaymentFromPercentage()
})

// Add these methods
const downloadPDF = async (type) => {
  const pdf = new jsPDF('p', 'pt', 'a4')
  const margins = {
    top: 40,
    bottom: 60,
    left: 40,
    right: 40
  }
  const innerWidth = pdf.internal.pageSize.getWidth() - margins.left - margins.right

  // Add header
  pdf.setFontSize(20)
  pdf.setTextColor(100)
  const title = type === 'amortization' ? 'Mortgage Amortization Schedule' : 'Home Equity Projection'
  pdf.text(title, margins.left, margins.top)

  // Add loan details
  pdf.setFontSize(12)
  pdf.setTextColor(80)
  let y = margins.top + 30
  
  const addText = (text, y) => {
    pdf.text(text, margins.left, y)
    return y + 20
  }

  y = addText(`Home Price: $${formatNumber(homePrice.value)}`, y)
  y = addText(`Down Payment: $${formatNumber(downPayment.value)} (${loanToValue.value}% LTV)`, y)
  y = addText(`Loan Amount: $${formatNumber(loanAmount.value)}`, y)
  y = addText(`Interest Rate: ${interestRate.value}%`, y)
  y = addText(`Loan Term: ${loanTerm.value} years`, y)
  y = addText(`Monthly Payment (P&I): $${formatNumber(baseMonthlyPayment.value)}`, y)
  y += 20

  if (type === 'equity') {
    // Add appreciation rate
    y = addText(`Home Appreciation Rate: ${appreciationRate.value}%`, y)
    
    // Capture and add the chart
    const chartCanvas = document.querySelector('canvas')
    const chartImage = await html2canvas(chartCanvas)
    const chartWidth = innerWidth
    const chartHeight = (chartImage.height * chartWidth) / chartImage.width
    
    pdf.addImage(chartImage, 'PNG', margins.left, y, chartWidth, chartHeight)
    y += chartHeight + 40

    // Add summary statistics
    const lastProjection = equityProjection.value[equityProjection.value.length - 1]
    y = addText('Summary:', y)
    y = addText(`Final Home Value: $${formatNumber(lastProjection.homeValue)}`, y)
    y = addText(`Final Equity: $${formatNumber(lastProjection.equity)} (${lastProjection.equityPercentage}%)`, y)
    y = addText(`Total Appreciation: ${calculateAppreciationPercentage.value}%`, y)
    y += 20
  }

  // Add table data
  const data = type === 'amortization' ? amortizationSchedule.value : equityProjection.value
  const columns = type === 'amortization' 
    ? ['Payment #', 'Payment', 'Principal', 'Interest', 'Balance', 'Total Interest']
    : ['Year', 'Home Value', 'Loan Balance', 'Equity', 'Equity %', 'Annual Growth']

  // Calculate column widths
  const colWidth = innerWidth / columns.length
  
  // Add table headers
  pdf.setFillColor(245, 247, 250)
  pdf.rect(margins.left, y, innerWidth, 25, 'F')
  pdf.setTextColor(100)
  columns.forEach((col, i) => {
    pdf.text(col, margins.left + (colWidth * i) + 10, y + 17)
  })
  y += 25

  // Add table rows
  pdf.setTextColor(60)
  data.forEach((row, index) => {
    if (y > pdf.internal.pageSize.getHeight() - margins.bottom) {
      pdf.addPage()
      y = margins.top
    }

    const values = type === 'amortization'
      ? [
          row.payment,
          '$' + formatNumber(row.paymentAmount),
          '$' + formatNumber(row.principal),
          '$' + formatNumber(row.interest),
          '$' + formatNumber(row.remainingBalance),
          '$' + formatNumber(row.totalInterest)
        ]
      : [
          row.year,
          '$' + formatNumber(row.homeValue),
          '$' + formatNumber(row.loanBalance),
          '$' + formatNumber(row.equity),
          row.equityPercentage + '%',
          '$' + formatNumber(row.annualGrowth)
        ]

    if (index % 2 === 0) {
      pdf.setFillColor(252, 252, 253)
      pdf.rect(margins.left, y, innerWidth, 25, 'F')
    }

    values.forEach((value, i) => {
      pdf.text(String(value), margins.left + (colWidth * i) + 10, y + 17)
    })
    y += 25
  })

  // Add footer
  const pageCount = pdf.internal.getNumberOfPages()
  for (let i = 1; i <= pageCount; i++) {
    pdf.setPage(i)
    pdf.setFontSize(10)
    pdf.setTextColor(150)
    const text = `Page ${i} of ${pageCount}`
    const textWidth = pdf.getTextWidth(text)
    pdf.text(text, pdf.internal.pageSize.getWidth() - margins.right - textWidth, pdf.internal.pageSize.getHeight() - 20)
  }

  // Save the PDF
  const fileName = type === 'amortization' ? 'amortization-schedule.pdf' : 'equity-projection.pdf'
  pdf.save(fileName)
}

const downloadDetailedReport = async () => {
  const pdf = new jsPDF('p', 'pt', 'a4')
  const margins = {
    top: 40,
    bottom: 60,
    left: 40,
    right: 40
  }
  const innerWidth = pdf.internal.pageSize.getWidth() - margins.left - margins.right
  let y = margins.top

  // Helper functions
  const addText = (text, y, options = {}) => {
    const { fontSize = 12, color = 80, isBold = false } = options
    pdf.setFontSize(fontSize)
    pdf.setTextColor(color)
    if (isBold) {
      pdf.setFont(undefined, 'bold')
    } else {
      pdf.setFont(undefined, 'normal')
    }
    pdf.text(text, margins.left, y)
    return y + (options.spacing || 20)
  }

  const addSection = (title, y) => {
    pdf.setFillColor(248, 250, 252)
    pdf.rect(margins.left, y - 15, innerWidth, 30, 'F')
    return addText(title, y, { fontSize: 14, color: 60, isBold: true, spacing: 35 })
  }

  // Title Page
  y = addText('Mortgage Loan Analysis Report', y, { fontSize: 24, color: 50, isBold: true, spacing: 50 })
  y = addText(`Generated on ${new Date().toLocaleDateString()}`, y, { color: 100, spacing: 40 })
  
  // Loan Overview Section
  y = addSection('Loan Overview', y)
  y = addText(`Purchase Price: $${formatNumber(homePrice.value)}`, y)
  y = addText(`Down Payment: $${formatNumber(downPayment.value)} (${loanToValue.value}% LTV)`, y)
  y = addText(`Loan Amount: $${formatNumber(loanAmount.value)}`, y)
  y = addText(`Interest Rate: ${interestRate.value}%`, y)
  y = addText(`Loan Term: ${loanTerm.value} years`, y)
  y += 20

  // Monthly Payment Breakdown
  y = addSection('Monthly Payment Breakdown', y)
  y = addText(`Total Monthly Payment: $${formatNumber(monthlyPayment.value)}`, y, { isBold: true })
  y = addText(`Principal & Interest: $${formatNumber(baseMonthlyPayment.value)}`, y)
  
  if (includeAdditionalCosts.value) {
    if (monthlyPropertyTax.value > 0) y = addText(`Property Tax: $${formatNumber(monthlyPropertyTax.value)}`, y)
    if (monthlyHomeInsurance.value > 0) y = addText(`Home Insurance: $${formatNumber(monthlyHomeInsurance.value)}`, y)
    if (monthlyPMI.value > 0) y = addText(`PMI: $${formatNumber(monthlyPMI.value)}`, y)
    if (monthlyHOA.value > 0) y = addText(`HOA Fee: $${formatNumber(monthlyHOA.value)}`, y)
    if (monthlyOtherCosts.value > 0) y = addText(`Other Costs: $${formatNumber(monthlyOtherCosts.value)}`, y)
  }
  y += 20

  // Loan Cost Analysis
  y = addSection('Loan Cost Analysis', y)
  y = addText(`Total of All Payments: $${formatNumber(totalLoanPayments.value)}`, y)
  y = addText(`Total Interest Paid: $${formatNumber(totalInterest.value)} (${totalInterestPercentage.value}% of loan)`, y)
  y = addText(`Total Cost: $${formatNumber(totalCost.value)} (${totalCostPercentage.value}% of purchase price)`, y)
  y += 20

  // Add new page for Equity Analysis
  pdf.addPage()
  y = margins.top

  // Equity Projection Section
  y = addSection('Home Equity Projection', y)
  y = addText(`Assumed Annual Appreciation: ${appreciationRate.value}%`, y)
  
  // Add equity chart
  const chartCanvas = document.querySelector('canvas')
  if (chartCanvas) {
    const chartImage = await html2canvas(chartCanvas)
    const chartWidth = innerWidth
    const chartHeight = (chartImage.height * chartWidth) / chartImage.width
    pdf.addImage(chartImage, 'PNG', margins.left, y, chartWidth, chartHeight)
    y += chartHeight + 40
  }

  // Add summary cards content (similar to the modal)
  const lastProjection = equityProjection.value[equityProjection.value.length - 1]
  
  // Summary Cards Section
  y = addSection('Equity Summary', y)
  
  // Final Home Value Card
  y = addText('Final Home Value', y, { isBold: true, fontSize: 14 })
  y = addText(`$${formatNumber(lastProjection.homeValue)}`, y, { fontSize: 18, spacing: 25 })
  y = addText(`+${calculateAppreciationPercentage.value}% from purchase`, y, { color: 40, spacing: 30 })

  // Total Equity Card
  y = addText('Total Equity Built', y, { isBold: true, fontSize: 14 })
  y = addText(`$${formatNumber(lastProjection.equity)}`, y, { fontSize: 18, spacing: 25 })
  y = addText(`${lastProjection.equityPercentage}% of home value`, y, { color: 40, spacing: 30 })

  // Average Annual Growth Card
  y = addText('Average Annual Growth', y, { isBold: true, fontSize: 14 })
  y = addText(`$${formatNumber(calculateAverageAnnualGrowth.value)}`, y, { fontSize: 18, spacing: 25 })
  y = addText('Per year', y, { color: 40, spacing: 30 })

  // Key Milestones (just show 5-year intervals)
  y = addSection('Key Milestones', y)
  const keyYears = [1, 5, 10, 15, 20, 25, 30].filter(year => year <= loanTerm.value)
  const milestones = equityProjection.value.filter(row => keyYears.includes(row.year))
  
  milestones.forEach(milestone => {
    y = addText(`Year ${milestone.year}`, y, { isBold: true })
    y = addText(`Home Value: $${formatNumber(milestone.homeValue)}`, y - 5)
    y = addText(`Equity: $${formatNumber(milestone.equity)} (${milestone.equityPercentage}%)`, y - 5)
    y += 15
  })

  // Add new page for Annual Amortization Table
  pdf.addPage()
  y = margins.top
  
  // Annual Amortization Table
  y = addSection('Annual Amortization Schedule', y)
  y = addText('Year by year breakdown of your loan payments', y - 15, { color: 100, spacing: 35 })

  // Table settings
  const rowHeight = 20 // Define row height
  pdf.setFontSize(10) // Set smaller font size for table

  // Create annual data
  const annualData = []
  let yearlyTotal = {
    payment: 0,
    principal: 0,
    interest: 0
  }
  
  amortizationSchedule.value.forEach((payment, index) => {
    yearlyTotal.payment += payment.paymentAmount
    yearlyTotal.principal += payment.principal
    yearlyTotal.interest += payment.interest

    if ((index + 1) % 12 === 0) {
      annualData.push({
        year: Math.floor((index + 1) / 12),
        totalPayment: yearlyTotal.payment,
        totalPrincipal: yearlyTotal.principal,
        totalInterest: yearlyTotal.interest,
        remainingBalance: payment.remainingBalance,
        cumulativeInterest: payment.totalInterest
      })
      yearlyTotal = { payment: 0, principal: 0, interest: 0 }
    }
  })

  // Table Headers
  const columns = [
    { title: 'Year', width: innerWidth * 0.08 },
    { title: 'Total Payment', width: innerWidth * 0.17 },
    { title: 'Principal Paid', width: innerWidth * 0.17 },
    { title: 'Interest Paid', width: innerWidth * 0.17 },
    { title: 'Remaining Balance', width: innerWidth * 0.21 },
    { title: 'Cumulative Interest', width: innerWidth * 0.20 }
  ]

  // Add table headers with background
  pdf.setFillColor(245, 247, 250)
  pdf.rect(margins.left, y, innerWidth, rowHeight + 5, 'F')
  pdf.setTextColor(60)
  pdf.setFont(undefined, 'bold')
  
  let xPos = margins.left
  columns.forEach(col => {
    pdf.text(col.title, xPos + 5, y + 15)
    xPos += col.width
  })
  y += rowHeight + 5

  // Add table rows
  pdf.setFont(undefined, 'normal')
  annualData.forEach((row, index) => {
    if (index % 2 === 0) {
      pdf.setFillColor(252, 252, 253)
      pdf.rect(margins.left, y, innerWidth, rowHeight, 'F')
    }

    xPos = margins.left
    const values = [
      row.year,
      '$' + formatNumber(row.totalPayment),
      '$' + formatNumber(row.totalPrincipal),
      '$' + formatNumber(row.totalInterest),
      '$' + formatNumber(row.remainingBalance),
      '$' + formatNumber(row.cumulativeInterest)
    ]

    values.forEach((value, i) => {
      const textWidth = pdf.getTextWidth(String(value))
      const xPosition = i === 0 
        ? xPos + 5  // Left align the Year column
        : xPos + columns[i].width - textWidth - 5  // Right align numeric columns
      pdf.text(String(value), xPosition, y + 14)
      xPos += columns[i].width
    })
    y += rowHeight
  })

  // Add summary row
  y += 5
  pdf.setFillColor(240, 243, 250)
  pdf.rect(margins.left, y, innerWidth, 30, 'F')
  pdf.setFont(undefined, 'bold')
  
  const totals = annualData.reduce((acc, row) => ({
    payment: acc.payment + row.totalPayment,
    principal: loanAmount.value,
    interest: acc.interest + row.totalInterest
  }), { payment: 0, principal: 0, interest: 0 })

  xPos = margins.left
  const summaryValues = [
    'TOTAL',
    '$' + formatNumber(totals.payment),
    '$' + formatNumber(totals.principal),
    '$' + formatNumber(totals.interest),
    '$0',
    '$' + formatNumber(totals.interest)
  ]

  summaryValues.forEach((value, i) => {
    pdf.text(String(value), xPos + 10, y + 20)
    xPos += columns[i].width
  })

  // Footer on all pages
  const pageCount = pdf.internal.getNumberOfPages()
  for (let i = 1; i <= pageCount; i++) {
    pdf.setPage(i)
    pdf.setFontSize(10)
    pdf.setTextColor(150)
    const text = `Page ${i} of ${pageCount}`
    const textWidth = pdf.getTextWidth(text)
    pdf.text(text, pdf.internal.pageSize.getWidth() - margins.right - textWidth, pdf.internal.pageSize.getHeight() - 20)
  }

  // Save the PDF
  pdf.save('mortgage-analysis-report.pdf')
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
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

input[type="number"] {
  -moz-appearance: textfield;
}
</style>

