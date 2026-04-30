<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - NirvachanSetu</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/output.css" rel="stylesheet">
</head>
<body class="font-inter text-on-surface min-h-screen">

<div class="min-h-screen flex flex-col lg:flex-row">

    <!-- Left Panel - Branding -->
    <div class="hidden lg:flex lg:w-[45%] bg-gradient-to-br from-[#00236f] via-[#1e3a8a] to-[#0f172a] relative overflow-hidden flex-col justify-between p-8 xl:p-12">
        <div class="absolute top-0 right-0 w-96 h-96 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2"></div>
        <div class="absolute bottom-0 left-0 w-72 h-72 bg-white/5 rounded-full translate-y-1/2 -translate-x-1/2"></div>

        <div class="relative z-10">
            <div class="flex items-center gap-3 mb-2">
                <svg class="w-10 h-10 text-white" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="8.5" y="14" width="7" height="7" rx="1"/>
                </svg>
                <span class="font-manrope font-bold text-2xl text-white">NirvachanSetu</span>
            </div>
            <p class="text-secondary-fixed/60 text-sm ml-[52px]">Election Commission Portal</p>
        </div>

        <div class="relative z-10 flex-1 flex flex-col justify-center max-w-md">
            <h1 class="font-manrope font-bold text-4xl xl:text-5xl text-white leading-tight mb-6">
                Join the Digital Bastion
            </h1>
            <p class="text-secondary-fixed/80 text-base xl:text-lg leading-relaxed">
                Create your secure identity to participate in the democratic process. Your data is protected by sovereign-grade encryption.
            </p>
        </div>

        <div class="relative z-10 space-y-4 max-w-sm">
            <div class="flex items-start gap-4 glass-panel rounded-2xl p-4">
                <div class="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5 text-secondary-fixed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><polyline points="9 12 11 14 15 10"/>
                    </svg>
                </div>
                <div>
                    <p class="font-manrope font-semibold text-white text-sm">VERIFIED</p>
                    <p class="text-secondary-fixed/70 text-xs mt-0.5">Official Election Portal</p>
                </div>
            </div>
            <div class="flex items-start gap-4 glass-panel rounded-2xl p-4">
                <div class="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5 text-secondary-fixed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                </div>
                <div>
                    <p class="font-manrope font-semibold text-white text-sm">SECURE</p>
                    <p class="text-secondary-fixed/70 text-xs mt-0.5">End-to-end encrypted data</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Panel - Registration Form -->
    <div class="flex-1 flex flex-col justify-center items-center bg-[#f8f9fb] px-4 sm:px-6 lg:px-8 py-8 lg:py-12">
        <div class="lg:hidden flex items-center gap-2 mb-8">
            <svg class="w-8 h-8 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="8.5" y="14" width="7" height="7" rx="1"/></svg>
            <span class="font-manrope font-bold text-xl text-primary">NirvachanSetu</span>
        </div>

        <div class="w-full max-w-lg">
            <div class="mb-8">
                <h2 class="font-manrope font-bold text-3xl text-on-surface mb-2">Create Account</h2>
                <p class="text-on-surface-variant text-sm">Please provide your official details to register as a voter.</p>
            </div>

            <c:if test="${not empty error}">
                <div class="mb-6 p-4 rounded-xl bg-red-50 flex items-start gap-3">
                    <svg class="w-5 h-5 text-red-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
                    <p class="text-sm text-red-700">${error}</p>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="mb-6 p-4 rounded-xl bg-green-50 flex items-start gap-3">
                    <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                    <p class="text-sm text-green-700">${success}</p>
                </div>
            </c:if>

            <form method="POST" action="${pageContext.request.contextPath}/register" enctype="multipart/form-data" class="space-y-5">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Full Name *</label>
                        <input type="text" name="fullName" required class="input-field" placeholder="As per citizenship ID">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Email Address *</label>
                        <input type="email" name="email" required class="input-field" placeholder="name@example.com">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Password *</label>
                        <input type="password" name="password" required minlength="6" class="input-field" placeholder="Min 6 characters">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Confirm Password *</label>
                        <input type="password" name="confirmPassword" required minlength="6" class="input-field" placeholder="Re-enter password">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Citizenship No. *</label>
                        <input type="text" name="citizenshipNumber" required class="input-field" placeholder="CIT-000-000-000">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Phone Number</label>
                        <input type="tel" name="phone" class="input-field" placeholder="+977-98XXXXXXXX">
                    </div>
                </div>

                <div>
                    <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Constituency</label>
                    <select name="constituencyId" class="input-field" style="background-image:none;">
                        <option value="">Select your registered constituency</option>
                        <option value="1">Kathmandu-1</option>
                        <option value="2">Kathmandu-2</option>
                        <option value="3">Kathmandu-3</option>
                        <option value="4">Lalitpur-1</option>
                        <option value="5">Bhaktapur-1</option>
                        <option value="6">Pokhara-1</option>
                        <option value="7">Biratnagar-1</option>
                        <option value="8">Chitwan-1</option>
                    </select>
                </div>

                <div>
                    <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-1.5">Address</label>
                    <input type="text" name="address" class="input-field" placeholder="Your permanent address">
                </div>

                <div>
                    <label class="block text-xs font-semibold text-on-surface-variant uppercase tracking-wider mb-2">Profile Image</label>
                    <input type="file" name="profileImage" accept="image/png,image/jpeg" class="block w-full text-sm text-on-surface-variant file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-primary/10 file:text-primary hover:file:bg-primary/20 cursor-pointer">
                    <p class="text-on-surface-variant text-xs mt-1.5">PNG or JPG (max 5MB). Optional.</p>
                </div>

                <button type="submit" class="btn-primary w-full py-3 px-4 rounded-xl font-manrope font-semibold text-sm text-white flex items-center justify-center gap-2">
                    Complete Registration
                    <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </button>
            </form>

            <div class="mt-8 text-center">
                <p class="text-sm text-on-surface-variant">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/login" class="text-primary hover:text-primary-container font-semibold transition-colors">Sign In</a>
                </p>
            </div>

            <div class="mt-6 pt-6 flex items-center justify-center gap-4">
                <a href="#" class="text-xs text-on-surface-variant/60 hover:text-on-surface-variant font-inter transition-colors">Privacy Protocol</a>
                <span class="text-on-surface-variant/20">&#x2022;</span>
                <a href="#" class="text-xs text-on-surface-variant/60 hover:text-on-surface-variant font-inter transition-colors">Terms of Mandate</a>
                <span class="text-on-surface-variant/20">&#x2022;</span>
                <a href="#" class="text-xs text-on-surface-variant/60 hover:text-on-surface-variant font-inter transition-colors">Accessibility</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
