<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f7f9fc;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between">
    <!-- Header -->
    <header class="w-full bg-white shadow-sm px-8 py-4 flex justify-between items-center">
        <div class="text-[#0a2569] font-bold text-xl tracking-tight">NirvachanSetu</div>
        <a href="#" class="text-blue-600 font-medium hover:underline text-sm">Support</a>
    </header>

    <!-- Main Content -->
    <main class="flex-grow flex items-center justify-center p-6">
        <div class="max-w-5xl w-full bg-white rounded-xl shadow-lg flex flex-col md:flex-row overflow-hidden border border-gray-100">
            <!-- Left Side -->
            <div class="bg-[#0a2569] text-white p-12 md:w-5/12 flex flex-col justify-between relative overflow-hidden">
                <div class="relative z-10">
                    <h1 class="text-3xl font-bold mb-4 leading-tight">Join the Digital Bastion</h1>
                    <p class="text-blue-100 text-sm leading-relaxed mb-8">
                        Create your secure identity to participate in the democratic process. Your data is protected by sovereign-grade encryption.
                    </p>
                </div>
                
                <div class="space-y-6 relative z-10 mt-12 md:mt-32">
                    <div class="flex items-start space-x-3">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-300 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                        <div>
                            <h3 class="font-semibold text-sm">VERIFIED</h3>
                            <p class="text-blue-200 text-xs">Official Election Portal</p>
                        </div>
                    </div>
                    <div class="flex items-start space-x-3">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-300 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                        </svg>
                        <div>
                            <h3 class="font-semibold text-sm">SECURE</h3>
                            <p class="text-blue-200 text-xs">End-to-end encrypted data</p>
                        </div>
                    </div>
                </div>
                
                <!-- Background decoration -->
                <div class="absolute -bottom-24 -right-24 w-64 h-64 bg-blue-800 rounded-full opacity-50 blur-3xl"></div>
            </div>

            <!-- Right Side (Form) -->
            <div class="p-10 md:p-12 md:w-7/12">
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Create Account</h2>
                <p class="text-gray-500 text-sm mb-8">Please provide your official details to register as a voter.</p>
                
                <form action="AuthServlet" method="POST">
                    <input type="hidden" name="action" value="register">
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mb-5">
                        <!-- Full Name -->
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5" for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" placeholder="As per citizenship ID" 
                                class="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0a2569] focus:border-transparent transition-colors text-sm" required>
                        </div>
                        
                        <!-- Email Address -->
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5" for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="name@example.com" 
                                class="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0a2569] focus:border-transparent transition-colors text-sm" required>
                        </div>
                        
                        <!-- Password -->
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5" for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="••••••••" 
                                class="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0a2569] focus:border-transparent transition-colors text-sm" required>
                        </div>
                        
                        <!-- Citizenship Number -->
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5" for="citizenshipId">Citizenship Number</label>
                            <input type="text" id="citizenshipId" name="citizenshipId" placeholder="ID-000-000-000" 
                                class="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0a2569] focus:border-transparent transition-colors text-sm" required>
                        </div>
                    </div>
                    
                    <!-- Constituency -->
                    <div class="mb-6">
                        <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5" for="constituency">Constituency</label>
                        <select id="constituency" name="constituency" 
                            class="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0a2569] focus:border-transparent transition-colors text-sm appearance-none text-gray-600" required>
                            <option value="" disabled selected>Select your registered constituency</option>
                            <option value="1">Constituency 1</option>
                            <option value="2">Constituency 2</option>
                        </select>
                    </div>
                    
                    <!-- File Upload -->
                    <div class="mb-8">
                        <label class="block text-xs font-semibold text-gray-700 uppercase mb-1.5">Legal Identification Proof</label>
                        <div class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-lg bg-gray-50 hover:bg-gray-100 transition-colors cursor-pointer">
                            <div class="space-y-1 text-center">
                                <svg class="mx-auto h-10 w-10 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                    <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                                <div class="flex text-sm text-gray-600 justify-center">
                                    <label for="idProof" class="relative cursor-pointer rounded-md font-medium text-[#0a2569] hover:text-blue-800 focus-within:outline-none">
                                        <span>Click to upload or drag and drop</span>
                                        <input id="idProof" name="idProof" type="file" class="sr-only">
                                    </label>
                                </div>
                                <p class="text-xs text-gray-500">PDF, PNG or JPG (max. 10MB)</p>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="w-full bg-[#0a2569] text-white font-medium py-3 px-4 rounded-lg hover:bg-[#081b52] transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#0a2569] flex justify-center items-center">
                        Complete Registration
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                        </svg>
                    </button>
                    
                    <p class="mt-6 text-center text-sm text-gray-600">
                        Already have an account? 
                        <a href="${pageContext.request.contextPath}/auth/login.jsp" class="font-semibold text-[#0a2569] hover:text-blue-800 transition-colors">Sign In</a>
                    </p>
                </form>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="w-full text-center py-6 text-xs text-gray-500 font-medium">
        <p class="mb-2">© 2026 NIRVACHANSETU • ELECTION COMMISSION OF THE BASTION</p>
        <div class="flex justify-center space-x-6">
            <a href="#" class="hover:text-gray-800 transition-colors">PRIVACY PROTOCOL</a>
            <a href="#" class="hover:text-gray-800 transition-colors">TERMS OF MANDATE</a>
            <a href="#" class="hover:text-gray-800 transition-colors">ACCESSIBILITY</a>
        </div>
    </footer>
</body>
</html>
