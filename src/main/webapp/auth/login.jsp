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
<body class="font-inter text-on-surface min-h-screen">

    <div class="min-h-screen flex flex-col lg:flex-row">

        <!-- Left Panel - Branding -->
        <div class="hidden lg:flex lg:w-1/2 xl:w-[45%] bg-gradient-to-br from-[#00236f] via-[#1e3a8a] to-[#0f172a] relative overflow-hidden flex-col justify-between p-8 xl:p-12">
            <!-- Background decorative elements -->
            <div class="absolute top-0 right-0 w-96 h-96 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2"></div>
            <div class="absolute bottom-0 left-0 w-72 h-72 bg-white/5 rounded-full translate-y-1/2 -translate-x-1/2"></div>
            <div class="absolute top-1/2 left-1/2 w-48 h-48 bg-white/3 rounded-full -translate-x-1/2 -translate-y-1/2"></div>

            <!-- Logo -->
            <div class="relative z-10">
                <div class="flex items-center gap-3 mb-2">
                    <svg class="w-10 h-10 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="3" width="7" height="7" rx="1"/>
                        <rect x="14" y="3" width="7" height="7" rx="1"/>
                        <rect x="8.5" y="14" width="7" height="7" rx="1"/>
                    </svg>
                    <span class="font-manrope font-bold text-2xl text-white">NirvachanSetu</span>
                </div>
                <p class="text-secondary-fixed/60 text-sm ml-[52px]">Election Commission Portal</p>
            </div>

            <!-- Center content -->
            <div class="relative z-10 flex-1 flex flex-col justify-center max-w-md">
                <h1 class="font-manrope font-bold text-4xl xl:text-5xl text-white leading-tight mb-6">
                    Empowering the Digital Democracy.
                </h1>
                <p class="text-secondary-fixed/80 text-base xl:text-lg leading-relaxed">
                    Access your secure voting portal, track candidates, and participate in the future of governance.
                </p>
            </div>

            <!-- Security badge -->
            <div class="relative z-10 glass-panel rounded-2xl p-5 max-w-sm">
                <div class="flex items-start gap-4">
                    <div class="w-12 h-12 rounded-xl bg-white/10 flex items-center justify-center flex-shrink-0">
                        <svg class="w-6 h-6 text-secondary-fixed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            <polyline points="9 12 11 14 15 10"/>
                        </svg>
                    </div>
                    <div>
                        <p class="font-manrope font-semibold text-white text-sm">Secure Authentication</p>
                        <p class="text-secondary-fixed/70 text-xs mt-1 leading-relaxed">Your identity is protected by multi-layer encryption and EC-standard security protocols.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Panel - Login Form -->
        <div class="flex-1 flex flex-col justify-center items-center bg-[#f8f9fb] px-4 sm:px-6 lg:px-8 py-8 lg:py-12">

            <!-- Mobile logo -->
            <div class="lg:hidden flex items-center gap-2 mb-8">
                <svg class="w-8 h-8 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="3" width="7" height="7" rx="1"/>
                    <rect x="14" y="3" width="7" height="7" rx="1"/>
                    <rect x="8.5" y="14" width="7" height="7" rx="1"/>
                </svg>
                <span class="font-manrope font-bold text-xl text-primary">NirvachanSetu</span>
            </div>

            <div class="w-full max-w-md">
                <!-- Heading -->
                <div class="mb-8">
                    <h2 class="font-manrope font-bold text-3xl text-on-surface mb-2">Welcome Back</h2>
                    <p class="text-on-surface-variant text-sm">Please enter your credentials to access your account.</p>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty error}">
                    <div class="mb-6 p-4 rounded-xl bg-red-50 flex items-start gap-3">
                        <svg class="w-5 h-5 text-red-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"/>
                            <line x1="15" y1="9" x2="9" y2="15"/>
                            <line x1="9" y1="9" x2="15" y2="15"/>
                        </svg>
                        <div>
                            <p class="text-sm font-semibold text-red-800">Login Failed</p>
                            <p class="text-sm text-red-600 mt-0.5">${error}</p>
                        </div>
                    </div>
                </c:if>

                <!-- Success Message -->
                <c:if test="${not empty success}">
                    <div class="mb-6 p-4 rounded-xl bg-green-50 flex items-start gap-3">
                        <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <p class="text-sm text-green-700">${success}</p>
                    </div>
                </c:if>

                <!-- Login Form -->
                <form method="POST" action="${pageContext.request.contextPath}/login" class="space-y-5">
                    <!-- Voter ID / Email -->
                    <div>
                        <label for="identifier" class="block text-sm font-medium text-on-surface mb-1.5">Voter ID / Email</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-on-surface-variant/50" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                                    <polyline points="14 2 14 8 20 8"/>
                                    <line x1="16" y1="13" x2="8" y2="13"/>
                                    <line x1="16" y1="17" x2="8" y2="17"/>
                                    <polyline points="10 9 9 9 8 9"/>
                                </svg>
                            </div>
                            <input type="text" id="identifier" name="email" required
                                   class="input-field w-full pl-11 pr-4 py-3 rounded-xl text-sm"
                                   placeholder="Enter your email address"
                                   autocomplete="username">
                        </div>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-on-surface mb-1.5">Password</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-on-surface-variant/50" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                                </svg>
                            </div>
                            <input type="password" id="password" name="password" required
                                   class="input-field w-full pl-11 pr-12 py-3 rounded-xl text-sm"
                                   placeholder="Enter your password"
                                   autocomplete="current-password">
                            <button type="button" onclick="togglePassword()" class="absolute inset-y-0 right-0 pr-3.5 flex items-center text-on-surface-variant/50 hover:text-on-surface-variant transition-colors">
                                <svg id="eyeIcon" class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                    <circle cx="12" cy="12" r="3"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <!-- Forgot Password + Remember -->
                    <div class="flex items-center justify-between">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="rememberDevice" class="w-4 h-4 rounded border-surface-container-low text-primary focus:ring-primary/20">
                            <span class="text-sm text-on-surface-variant">Remember device</span>
                        </label>
                        <a href="${pageContext.request.contextPath}/forgot-password" class="text-sm text-primary hover:text-primary-container font-medium transition-colors">Forgot Password?</a>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit"
                            class="btn-primary w-full py-3 px-4 rounded-xl font-manrope font-semibold text-sm text-white flex items-center justify-center gap-2 transition-all duration-200 hover:shadow-lg hover:shadow-primary/20">
                        Login
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"/>
                            <polyline points="12 5 19 12 12 19"/>
                        </svg>
                    </button>
                </form>

                <!-- Register Link -->
                <div class="mt-8 text-center">
                    <p class="text-sm text-on-surface-variant">
                        New to the platform?
                        <a href="${pageContext.request.contextPath}/register" class="text-primary hover:text-primary-container font-semibold transition-colors">Register Now</a>
                    </p>
                </div>

                <!-- Footer links -->
                <div class="mt-8 pt-6 flex items-center justify-center gap-4">
                    <a href="#" class="text-xs text-on-surface-variant/60 hover:text-on-surface-variant font-inter transition-colors">Language</a>
                    <span class="text-on-surface-variant/20">&#x2022;</span>
                    <a href="${pageContext.request.contextPath}/support" class="text-xs text-on-surface-variant/60 hover:text-on-surface-variant font-inter transition-colors">Support</a>
                </div>
            </div>
        </div>
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
