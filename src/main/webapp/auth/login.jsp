<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f1f4f8;
        }
        .bg-dark-blue {
            background-color: #1a2a5c;
        }
        .text-dark-blue {
            color: #1a2a5c;
        }
        .border-dark-blue {
            border-color: #1a2a5c;
        }
        .left-panel-bg {
            background: linear-gradient(135deg, #162450 0%, #1c2e64 45%, #253a7a 55%, #162450 100%);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between">
    
    <!-- Main Content wrapper -->
    <div class="flex-grow flex items-center justify-center p-6 relative relative z-10 w-full mt-4">
        <!-- Main Form Card -->
        <div class="max-w-[950px] w-full bg-white rounded-2xl shadow-xl flex flex-col md:flex-row overflow-hidden border border-gray-100 min-h-[550px]">
            
            <!-- Left Side / Branding -->
            <div class="left-panel-bg text-white p-12 md:w-1/2 flex flex-col justify-between relative overflow-hidden">
                <!-- Decorative Glow/Lines (Subtle representation) -->
                <div class="absolute inset-0 z-0">
                    <div class="absolute top-[40%] left-[-10%] w-[120%] h-px bg-white opacity-5 transform -rotate-12"></div>
                    <div class="absolute top-[60%] left-[-10%] w-[120%] h-px bg-white opacity-5 transform rotate-6"></div>
                    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-64 h-64 bg-blue-500 rounded-full blur-[80px] opacity-20"></div>
                </div>

                <!-- Logo Section -->
                <div class="relative z-10 flex items-center space-x-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z" />
                    </svg>
                    <span class="text-xl font-bold tracking-tight">NirvachanSetu</span>
                </div>

                <!-- Hero Text -->
                <div class="relative z-10 mt-12 mb-12">
                    <h1 class="text-4xl font-bold mb-6 leading-tight max-w-sm">Empowering the<br/>Digital Democracy.</h1>
                    <p class="text-blue-200 text-sm leading-relaxed max-w-sm">
                        Access your secure voting portal, track candidates, and participate in the future of governance.
                    </p>
                </div>
                
                <!-- Bottom Info Box -->
                <div class="relative z-10 mt-auto bg-white/5 backdrop-blur-md border border-white/10 rounded-xl p-5 shadow-sm">
                    <div class="flex items-center space-x-3 mb-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-300" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                        <h3 class="font-semibold text-sm tracking-wide">Secure Authentication</h3>
                    </div>
                    <p class="text-blue-100/70 text-xs leading-relaxed pr-6">
                        Your identity is protected by multi-layer encryption and EC-standard security protocols.
                    </p>
                </div>
            </div>

            <!-- Right Side / Login Form -->
            <div class="p-10 md:p-14 md:w-1/2 flex flex-col justify-center bg-white z-10">
                <div class="mb-8">
                    <h2 class="text-[26px] font-bold text-gray-900 mb-2 text-dark-blue">Welcome Back</h2>
                    <p class="text-gray-500 text-sm">Please enter your credentials to access your account.</p>
                </div>
                
                <form action="AuthServlet" method="POST" class="flex-grow">
                    <input type="hidden" name="action" value="login">
                    
                    <!-- Voter ID / Email Container -->
                    <div class="mb-5">
                        <label class="block text-xs font-bold text-gray-800 mb-2" for="username">Voter ID / Email</label>
                        <div class="relative flex items-center bg-gray-100 rounded-lg border border-transparent focus-within:bg-white focus-within:border-gray-300 focus-within:ring-2 focus-within:ring-[#1a2a5c] transition-all">
                            <div class="pl-4 pr-3 text-gray-400">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" />
                                </svg>
                            </div>
                            <input type="text" id="username" name="username" placeholder="Enter Voter ID or Email" 
                                class="w-full py-3 bg-transparent text-sm text-gray-800 placeholder-gray-400 focus:outline-none" required>
                        </div>
                    </div>
                    
                    <!-- Password Container -->
                    <div class="mb-5">
                        <div class="flex justify-between items-center mb-2">
                            <label class="block text-xs font-bold text-gray-800" for="password">Password</label>
                            <a href="#" class="text-xs font-bold text-blue-600 tracking-tight text-dark-blue hover:text-blue-800">Forgot Password?</a>
                        </div>
                        <div class="relative flex items-center bg-gray-100 rounded-lg border border-transparent focus-within:bg-white focus-within:border-gray-300 focus-within:ring-2 focus-within:ring-[#1a2a5c] transition-all">
                            <div class="pl-4 pr-3 text-gray-400">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                                </svg>
                            </div>
                            <input type="password" id="password" name="password" placeholder="••••••••" 
                                class="w-full py-3 bg-transparent text-sm text-gray-800 placeholder-gray-400 focus:outline-none tracking-widest" required>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <div class="mb-8 flex items-center">
                        <input type="checkbox" id="remember" name="remember" class="h-4 w-4 text-[#1a2a5c] border-gray-300 rounded focus:ring-[#1a2a5c] cursor-pointer">
                        <label for="remember" class="ml-2 block text-sm text-gray-700 cursor-pointer">
                            Remember this device
                        </label>
                    </div>
                    
                    <!-- Submit Button -->
                    <button type="submit" class="w-full bg-dark-blue text-white font-medium py-3.5 px-4 rounded-lg hover:bg-blue-900 transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#1a2a5c] flex justify-center items-center font-semibold text-sm tracking-wide">
                        Login
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                        </svg>
                    </button>
                    
                    <div class="mt-8 border-t border-gray-100 pt-6">
                        <p class="text-center text-sm text-gray-600 mb-6">
                            New to the platform? 
                            <a href="${pageContext.request.contextPath}/auth/register.jsp" class="font-bold text-dark-blue hover:text-blue-800 transition-colors">Register Now</a>
                        </p>
                        
                        <div class="flex justify-center items-center space-x-6 text-[10px] text-gray-500 font-bold uppercase tracking-widest">
                            <a href="#" class="flex items-center hover:text-gray-700 transition-colors">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
                                </svg>
                                LANGUAGE: ENGLISH
                            </a>
                            <a href="#" class="flex items-center hover:text-gray-700 transition-colors">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192l-3.536 3.536M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z" />
                                </svg>
                                SUPPORT
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Global Footer -->
    <footer class="w-full border-t border-gray-200 mt-auto bg-transparent">
        <div class="max-w-7xl mx-auto px-8 py-6 flex flex-col md:flex-row justify-between items-center text-xs text-gray-500 font-medium">
            <div class="mb-4 md:mb-0 text-center md:text-left">
                <div class="font-bold text-gray-800 mb-1 text-sm">NirvachanSetu</div>
                <p>© 2026 Election Commission. All rights reserved.</p>
            </div>
            
            <div class="flex flex-wrap justify-center space-x-6">
                <a href="#" class="hover:text-gray-900 transition-colors py-1">Privacy Policy</a>
                <a href="#" class="hover:text-gray-900 transition-colors py-1">Terms of Service</a>
                <a href="#" class="hover:text-gray-900 transition-colors py-1">Accessibility</a>
                <a href="#" class="hover:text-gray-900 transition-colors py-1">Contact Support</a>
            </div>
        </div>
    </footer>

</body>
</html>
