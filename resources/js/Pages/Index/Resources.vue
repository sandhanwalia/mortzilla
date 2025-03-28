<template>
  <MainLayout>
    <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Header Section -->
      <div class="text-center mb-12 pt-4">
        <h1 class="text-3xl sm:text-4xl lg:text-5xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent mb-4 leading-normal py-2">
          Mortgage Resources
        </h1>
        <p class="text-gray-600 text-lg max-w-2xl mx-auto">Essential guides and information to help you make informed decisions</p>
      </div>

      <!-- Main Content -->
      <div class="space-y-8">
        <!-- Quick Links Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Quick Links</h2>
          <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            <a href="#mortgage-basics" class="group">
              <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                <div class="flex items-center space-x-3">
                  <div class="bg-indigo-100 rounded-lg p-2">
                    <svg class="w-5 h-5 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                    </svg>
                  </div>
                  <span class="text-gray-700 group-hover:text-indigo-600">Mortgage Basics</span>
                </div>
              </div>
            </a>
            <a href="#down-payment" class="group">
              <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                <div class="flex items-center space-x-3">
                  <div class="bg-purple-100 rounded-lg p-2">
                    <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                  </div>
                  <span class="text-gray-700 group-hover:text-indigo-600">Down Payment Guide</span>
                </div>
              </div>
            </a>
            <a href="#affordability" class="group">
              <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                <div class="flex items-center space-x-3">
                  <div class="bg-blue-100 rounded-lg p-2">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                    </svg>
                  </div>
                  <span class="text-gray-700 group-hover:text-indigo-600">Affordability Guide</span>
                </div>
              </div>
            </a>
            <a href="#refinancing" class="group">
              <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                <div class="flex items-center space-x-3">
                  <div class="bg-green-100 rounded-lg p-2">
                    <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                    </svg>
                  </div>
                  <span class="text-gray-700 group-hover:text-indigo-600">Refinancing Guide</span>
                </div>
              </div>
            </a>
          </div>
        </section>

        <!-- Mortgage Basics Section -->
        <section id="mortgage-basics" class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Mortgage Basics</h2>
          <div class="prose prose-indigo max-w-none">
            <h3 class="text-xl font-medium text-gray-800 mb-4">Understanding Mortgages</h3>
            <p class="text-gray-600 mb-4">
              A mortgage is a loan used to purchase a home. The property serves as collateral, and you agree to pay back the loan over a set period, typically 15 or 30 years.
            </p>
            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Key Components:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>Principal: The amount borrowed</li>
              <li>Interest: The cost of borrowing money</li>
              <li>Down Payment: Initial payment (typically 20% of home price)</li>
              <li>Term: Length of the loan (15 or 30 years)</li>
              <li>Monthly Payment: Includes principal, interest, taxes, and insurance</li>
            </ul>
          </div>
        </section>

        <!-- Down Payment Guide Section -->
        <section id="down-payment" class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Down Payment Guide</h2>
          <div class="prose prose-indigo max-w-none">
            <h3 class="text-xl font-medium text-gray-800 mb-4">Understanding Down Payments</h3>
            <p class="text-gray-600 mb-4">
              The down payment is the initial payment you make when purchasing a home. While 20% is traditional, there are various options available.
            </p>
            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Down Payment Options:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>Conventional Loans: 3-20% down payment</li>
              <li>FHA Loans: 3.5% minimum down payment</li>
              <li>VA Loans: 0% down payment (for eligible veterans)</li>
              <li>USDA Loans: 0% down payment (for rural areas)</li>
            </ul>
          </div>
        </section>

        <!-- Affordability Guide Section -->
        <section id="affordability" class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Affordability Guidelines</h2>
          <div class="prose prose-indigo max-w-none">
            <h3 class="text-xl font-medium text-gray-800 mb-4">Understanding Home Affordability</h3>
            <p class="text-gray-600 mb-4">
              Determining how much house you can afford involves considering your income, expenses, and various financial factors. Here are key guidelines to help you make an informed decision.
            </p>
            
            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Key Affordability Rules:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>28% Rule: Monthly mortgage payment should not exceed 28% of your gross monthly income</li>
              <li>36% Rule: Total monthly debt payments (including mortgage) should not exceed 36% of your gross monthly income</li>
              <li>Down Payment: Aim for at least 20% to avoid PMI insurance</li>
              <li>Emergency Fund: Maintain 3-6 months of expenses in savings</li>
            </ul>

            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Factors to Consider:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>Monthly Income: Your total household income</li>
              <li>Monthly Debts: Car payments, student loans, credit cards, etc.</li>
              <li>Down Payment Amount: Available savings for initial payment</li>
              <li>Credit Score: Affects interest rates and loan options</li>
              <li>Property Taxes: Vary by location and property value</li>
              <li>Home Insurance: Required for mortgage approval</li>
              <li>HOA Fees: If applicable to the property</li>
            </ul>

            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Tips for Better Affordability:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>Pay off high-interest debt before buying</li>
              <li>Improve your credit score for better rates</li>
              <li>Save for a larger down payment</li>
              <li>Consider a longer loan term for lower monthly payments</li>
              <li>Factor in maintenance and repair costs</li>
              <li>Account for potential future expenses</li>
              <li>Get pre-approved for a mortgage</li>
            </ul>

            <div class="mt-6 p-4 bg-indigo-50 rounded-lg">
              <h4 class="text-lg font-medium text-indigo-800 mb-2">Quick Affordability Check</h4>
              <p class="text-indigo-700">
                To quickly estimate if you can afford a home:
              </p>
              <ol class="list-decimal pl-5 text-indigo-700 mt-2 space-y-1">
                <li>Multiply your annual income by 2.5-3</li>
                <li>Subtract your total monthly debt payments</li>
                <li>Consider your down payment savings</li>
                <li>Factor in property taxes and insurance</li>
              </ol>
            </div>
          </div>
        </section>

        <!-- Refinancing Guide Section -->
        <section id="refinancing" class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Refinancing Guide</h2>
          <div class="prose prose-indigo max-w-none">
            <h3 class="text-xl font-medium text-gray-800 mb-4">When to Consider Refinancing</h3>
            <p class="text-gray-600 mb-4">
              Refinancing your mortgage can help you save money, lower your monthly payments, or change your loan terms.
            </p>
            <h4 class="text-lg font-medium text-gray-800 mt-6 mb-3">Common Refinancing Scenarios:</h4>
            <ul class="list-disc pl-5 text-gray-600 space-y-2">
              <li>Lower interest rates available</li>
              <li>Want to shorten loan term</li>
              <li>Need to lower monthly payments</li>
              <li>Want to switch from adjustable to fixed rate</li>
              <li>Need to access home equity</li>
            </ul>
          </div>
        </section>

        <!-- Additional Resources Section -->
        <section class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8">
          <h2 class="text-2xl font-semibold text-gray-800 mb-6">Additional Resources</h2>
          <div class="grid sm:grid-cols-2 gap-6">
            <div class="space-y-4">
              <a href="https://www.consumerfinance.gov/owning-a-home/" target="_blank" class="block group">
                <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                  <h3 class="font-semibold text-gray-800 group-hover:text-indigo-600">CFPB Home Buying Guide</h3>
                  <p class="text-gray-600 text-sm mt-1">Comprehensive guide from the Consumer Financial Protection Bureau</p>
                </div>
              </a>
              <a href="https://www.hud.gov/buying/loans" target="_blank" class="block group">
                <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                  <h3 class="font-semibold text-gray-800 group-hover:text-indigo-600">HUD Loan Programs</h3>
                  <p class="text-gray-600 text-sm mt-1">Information about government-backed loan programs</p>
                </div>
              </a>
            </div>
            <div class="space-y-4">
              <a href="https://www.nerdwallet.com/mortgages" target="_blank" class="block group">
                <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                  <h3 class="font-semibold text-gray-800 group-hover:text-indigo-600">NerdWallet Mortgage Guide</h3>
                  <p class="text-gray-600 text-sm mt-1">Expert advice and mortgage rate comparisons</p>
                </div>
              </a>
              <a href="https://www.bankrate.com/mortgages/" target="_blank" class="block group">
                <div class="p-4 rounded-lg bg-gray-50 hover:bg-indigo-50 transition-colors duration-200">
                  <h3 class="font-semibold text-gray-800 group-hover:text-indigo-600">Bankrate Mortgage Resources</h3>
                  <p class="text-gray-600 text-sm mt-1">Tools and calculators for mortgage planning</p>
                </div>
              </a>
            </div>
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