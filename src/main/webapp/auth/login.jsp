<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - NirvachanSetu</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/output.css" rel="stylesheet">
</head>
<body class="font-inter min-h-screen flex flex-col pt-8 pb-8 px-4 sm:px-8" style="background-color: #f8fafc; color: #0f172a;">

    <div class="w-full max-w-6xl mx-auto flex-1 flex flex-col justify-center">
        <!-- Main Layout Card -->
        <div class="bg-white shadow-2xl overflow-hidden flex flex-col lg:flex-row min-h-[600px] w-full" style="border-radius: 2rem;">

            <!-- Left Panel - Branding -->
            <div class="hidden lg:flex lg:w-1/2 relative flex-col justify-between p-10 xl:p-14" style="background: linear-gradient(135deg, #1e3a8a 0%, #1e40af 100%);">
                <!-- Decorative background elements -->
                <div class="absolute inset-0 opacity-10" style="background-image: radial-gradient(circle at 2px 2px, rgba(255,255,255,0.8) 1px, transparent 0); background-size: 32px 32px;"></div>
                
                <!-- Logo -->
                <div class="relative z-10">
                    <div class="flex items-center gap-3 mb-2">
                        <div class="bg-white p-2 rounded-lg flex items-center justify-center">
                            <svg class="w-6 h-6" style="color: #1e3a8a;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                <line x1="12" y1="22.08" x2="12" y2="12"></line>
                            </svg>
                        </div>
                        <span class="font-bold text-2xl text-white" style="font-family: inherit;">NirvachanSetu</span>
                    </div>
                </div>

                <!-- Center content -->
                <div class="relative z-10 flex-1 flex flex-col justify-center max-w-md mt-12 mb-12">
                    <h1 class="font-bold text-4xl xl:text-5xl text-white leading-tight mb-6" style="font-family: inherit;">
                        Empowering the<br/>Digital Democracy.
                    </h1>
                    <p class="text-base xl:text-lg leading-relaxed" style="color: rgba(255,255,255,0.8);">
                        Access your secure voting portal, track candidates, and participate in the future of governance.
                    </p>
                </div>

                <!-- Security badge -->
                <div class="relative z-10 rounded-2xl p-5 border max-w-md" style="background-color: rgba(255,255,255,0.05); border-color: rgba(255,255,255,0.1); backdrop-filter: blur(8px);">
                    <div class="flex items-center gap-4">
                        <div class="w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0" style="background-color: rgba(255,255,255,0.1);">
                            <svg class="w-5 h-5 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                                <polyline points="9 12 11 14 15 10"/>
                            </svg>
                        </div>
                        <div>
                            <p class="font-semibold text-white text-sm" style="font-family: inherit;">Secure Authentication</p>
                            <p class="text-xs mt-1 leading-relaxed" style="color: rgba(255,255,255,0.7);">Your identity is protected by multi-layer encryption and EC-standard security protocols.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Panel - Login Form -->
            <div class="flex-1 flex flex-col justify-center items-center bg-white px-6 sm:px-10 lg:px-16 py-10 lg:py-16">

                <!-- Mobile logo -->
                <div class="lg:hidden flex items-center gap-2 mb-10 w-full max-w-md">
                    <div class="p-1.5 rounded-lg flex items-center justify-center" style="background-color: #1e3a8a;">
                        <svg class="w-5 h-5 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                            <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                            <line x1="12" y1="22.08" x2="12" y2="12"></line>
                        </svg>
                    </div>
                    <span class="font-bold text-2xl" style="color: #1e3a8a;">NirvachanSetu</span>
                </div>

                <div class="w-full max-w-md">
                    <!-- Heading -->
                    <div class="mb-10">
                        <h2 class="font-bold text-3xl mb-2" style="color: #0f172a; font-family: inherit;">Welcome Back</h2>
                        <p class="text-sm font-medium" style="color: #64748b;">Please enter your credentials to access your account.</p>
                    </div>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="mb-6 p-4 rounded-xl border flex items-start gap-3" style="background-color: #fef2f2; border-color: #fee2e2;">
                            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" style="color: #ef4444;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"/>
                                <line x1="15" y1="9" x2="9" y2="15"/>
                                <line x1="9" y1="9" x2="15" y2="15"/>
                            </svg>
                            <div>
                                <p class="text-sm font-semibold" style="color: #991b1b;">Login Failed</p>
                                <p class="text-sm mt-0.5" style="color: #dc2626;">${error}</p>
                            </div>
                        </div>
                    </c:if>

                    <!-- Success Message -->
                    <c:if test="${not empty success}">
                        <div class="mb-6 p-4 rounded-xl border flex items-start gap-3" style="background-color: #f0fdf4; border-color: #dcfce7;">
                            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" style="color: #22c55e;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                                <polyline points="22 4 12 14.01 9 11.01"/>
                            </svg>
                            <p class="text-sm font-medium" style="color: #15803d;">${success}</p>
                        </div>
                    </c:if>

                    <!-- Login Form -->
                    <form method="POST" action="${pageContext.request.contextPath}/login" class="space-y-6">
                        <!-- Voter ID / Email -->
                        <div>
                            <label for="identifier" class="block text-sm font-semibold mb-2" style="color: #334155;">Voter ID / Email</label>
                            <div class="relative" style="position: relative;">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none" style="position: absolute; top: 0; bottom: 0; left: 0; padding-left: 1rem; display: flex; align-items: center; pointer-events: none;">
                                    <svg class="w-5 h-5" style="color: #94a3b8; width: 1.25rem; height: 1.25rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                        <path d="M8 14h.01"></path>
                                        <path d="M12 14h.01"></path>
                                        <path d="M16 14h.01"></path>
                                        <path d="M8 18h.01"></path>
                                        <path d="M12 18h.01"></path>
                                        <path d="M16 18h.01"></path>
                                    </svg>
                                </div>
                                <input type="text" id="identifier" name="email" required
                                       class="w-full pl-12 pr-4 py-3.5 border-0 rounded-xl text-sm font-medium focus:ring-2 focus:bg-white transition-colors"
                                       style="background-color: #f1f5f9; color: #1e293b; outline: none; width: 100%; padding-left: 3rem; padding-right: 1rem; padding-top: 0.875rem; padding-bottom: 0.875rem; border-radius: 0.75rem; box-sizing: border-box;"
                                       placeholder="Enter Voter ID or Email"
                                       autocomplete="username">
                            </div>
                        </div>

                        <!-- Password -->
                        <div style="margin-top: 1.5rem;">
                            <div class="flex items-center justify-between mb-2" style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.5rem;">
                                <label for="password" class="block text-sm font-semibold" style="color: #334155;">Password</label>
                                <a href="${pageContext.request.contextPath}/forgot-password" class="text-sm font-semibold transition-colors" style="color: #2563eb;">Forgot Password?</a>
                            </div>
                            <div class="relative" style="position: relative;">
                                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none" style="position: absolute; top: 0; bottom: 0; left: 0; padding-left: 1rem; display: flex; align-items: center; pointer-events: none;">
                                    <svg class="w-5 h-5" style="color: #94a3b8; width: 1.25rem; height: 1.25rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                                    </svg>
                                </div>
                                <input type="password" id="password" name="password" required
                                       class="w-full pl-12 pr-12 py-3.5 border-0 rounded-xl text-sm font-medium focus:ring-2 focus:bg-white transition-colors tracking-widest"
                                       style="background-color: #f1f5f9; color: #1e293b; outline: none; width: 100%; padding-left: 3rem; padding-right: 3rem; padding-top: 0.875rem; padding-bottom: 0.875rem; border-radius: 0.75rem; box-sizing: border-box; letter-spacing: 0.1em;"
                                       placeholder="••••••••"
                                       autocomplete="current-password">
                                <button type="button" onclick="togglePassword()" class="absolute inset-y-0 right-0 pr-4 flex items-center transition-colors" style="position: absolute; top: 0; bottom: 0; right: 0; padding-right: 1rem; display: flex; align-items: center; background: none; border: none; cursor: pointer; color: #94a3b8;">
                                    <svg id="eyeIcon" class="w-5 h-5" style="width: 1.25rem; height: 1.25rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                        <circle cx="12" cy="12" r="3"/>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- Remember -->
                        <div class="flex items-center gap-3" style="display: flex; align-items: center; gap: 0.75rem; margin-top: 1rem;">
                            <input type="checkbox" id="rememberDevice" name="rememberDevice" class="w-4 h-4 rounded border-gray-300 bg-white" style="width: 1rem; height: 1rem; cursor: pointer;">
                            <label for="rememberDevice" class="text-sm font-medium cursor-pointer select-none" style="color: #64748b;">Remember this device</label>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit"
                                class="w-full py-4 px-4 rounded-xl font-bold text-sm text-white flex items-center justify-center gap-2 transition-all duration-200 hover:shadow-lg"
                                style="background-color: #1e3a8a; font-family: inherit; width: 100%; padding-top: 1rem; padding-bottom: 1rem; border-radius: 0.75rem; border: none; cursor: pointer; display: flex; justify-content: center; align-items: center; margin-top: 1.5rem;">
                            Login
                            <svg class="w-4 h-4 ml-1" style="width: 1rem; height: 1rem; margin-left: 0.25rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="5" y1="12" x2="19" y2="12"/>
                                <polyline points="12 5 19 12 12 19"/>
                            </svg>
                        </button>
                    </form>

                    <!-- Divider -->
                    <div class="w-full h-px my-8" style="background-color: #e2e8f0;"></div>

                    <!-- Register Link -->
                    <div class="text-center mb-6">
                        <p class="text-sm font-medium" style="color: #64748b;">
                            New to the platform?
                            <a href="${pageContext.request.contextPath}/register" class="font-bold transition-colors ml-1" style="color: #2563eb;">Register Now</a>
                        </p>
                    </div>

                    <!-- Small Links -->
                    <div class="mt-8 flex items-center justify-center gap-8">
                        <button type="button" class="flex items-center gap-2 text-xs font-bold transition-colors uppercase tracking-wider" style="color: #64748b;">
                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="2" y1="12" x2="22" y2="12"></line>
                                <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                            </svg>
                            Language: English
                        </button>
                        <a href="${pageContext.request.contextPath}/support" class="flex items-center gap-2 text-xs font-bold transition-colors uppercase tracking-wider" style="color: #64748b;">
                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M15.05 5A5 5 0 0 1 19 8.95M15.05 1A9 9 0 0 1 23 8.94m-1 7.98v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                            </svg>
                            Support
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer under the card -->
        <footer class="mt-8 mb-4 w-full flex flex-col md:flex-row items-center justify-between gap-4 text-xs font-medium p-4" style="color: #64748b;">
            <div class="flex flex-col items-center md:items-start gap-1">
                <span class="font-bold text-sm" style="color: #0f172a;">NirvachanSetu</span>
                <span>&copy; 2026 Election Commission. All rights reserved.</span>
            </div>
            <div class="flex flex-wrap justify-center gap-6">
                <a href="#" class="transition-colors hover:text-slate-900">Privacy Policy</a>
                <a href="#" class="transition-colors hover:text-slate-900">Terms of Service</a>
                <a href="#" class="transition-colors hover:text-slate-900">Accessibility</a>
                <a href="#" class="transition-colors hover:text-slate-900">Contact Support</a>
            </div>
        </footer>
    </div>


    <script>
        function togglePassword() {
            const input = document.getElementById('password');
            const icon = document.getElementById('eyeIcon');
            if (input.type === 'password') {
                input.type = 'text';
                icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
            } else {
                input.type = 'password';
                icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            }
        }
    </script>
</body>
</html>
