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
    <style>
        /* Base styles to ensure inputs look correct even without Tailwind output.css entirely loaded */
        input::placeholder, select::placeholder {
            color: #94a3b8;
            opacity: 1;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%2364748b' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }
        .custom-input {
            width: 100%;
            background-color: #f1f5f9;
            border: 1px solid #cbd5e1;
            border-radius: 0.5rem;
            padding: 0.875rem 1rem;
            font-size: 0.875rem;
            color: #1e293b;
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease-in-out;
            font-family: inherit;
        }
        .custom-input:focus {
            background-color: #ffffff;
            border-color: #1e3a8a;
            box-shadow: 0 0 0 2px rgba(30, 58, 138, 0.1);
        }
        .custom-label {
            display: block;
            font-size: 0.7rem;
            font-weight: 700;
            color: #334155;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body class="font-inter min-h-screen flex flex-col pt-6 pb-8 px-4 sm:px-8 relative" style="background-color: #f4f5f7; color: #0f172a; margin: 0;">

   

    <!-- Header -->
    <div class="w-full flex justify-between items-center max-w-7xl mx-auto mb-8 relative z-10" style="padding: 0 1rem;">
        <span class="font-bold text-xl" style="color: #0a1f68; font-family: inherit;">NirvachanSetu</span>
        <a href="#" class="text-sm font-semibold" style="color: #2563eb; text-decoration: none;">Support</a>
    </div>

    <div class="w-full mx-auto flex-1 flex flex-col justify-center relative z-10" style="max-width: 1050px; padding: 2rem 0;">
        <!-- Main Layout Card -->
        <div class="bg-white shadow-xl overflow-hidden flex flex-col lg:flex-row w-full" style="border-radius: 1rem; min-height: 680px;">

            <!-- Left Panel - Branding -->
            <div class="hidden lg:flex flex-col justify-between" style="width: 35%; background-color: #061e68; padding: 3.5rem 3rem; flex-shrink: 0;">
                
                <div class="flex-1 flex flex-col mt-4">
                    <h1 class="font-bold text-white leading-tight mb-6" style="font-family: inherit; font-size: 2.25rem;">
                        Join the Digital<br/>Bastion
                    </h1>
                    <p class="text-sm leading-relaxed" style="color: rgba(255,255,255,0.9); font-weight: 300;">
                        Create your secure identity to participate in the democratic process. Your data is protected by sovereign-grade encryption.
                    </p>
                </div>

                <div class="space-y-6 mb-4">
                    <div class="flex items-start gap-4">
                        <div class="flex items-center justify-center flex-shrink-0 mt-0.5">
                            <svg class="w-5 h-5" style="color: #60a5fa;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                                <polyline points="9 12 11 14 15 10"/>
                            </svg>
                        </div>
                        <div>
                            <p class="font-bold text-white text-xs tracking-wide" style="font-family: inherit;">VERIFIED</p>
                            <p style="font-size: 0.65rem; color: rgba(255,255,255,0.7); margin-top: 0.25rem;">Official Election Portal</p>
                        </div>
                    </div>
                    <div class="flex items-start gap-4">
                        <div class="flex items-center justify-center flex-shrink-0 mt-0.5">
                            <svg class="w-5 h-5" style="color: #60a5fa;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                            </svg>
                        </div>
                        <div>
                            <p class="font-bold text-white text-xs tracking-wide" style="font-family: inherit;">SECURE</p>
                            <p style="font-size: 0.65rem; color: rgba(255,255,255,0.7); margin-top: 0.25rem;">End-to-end encrypted data</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Panel - Registration Form -->
            <div class="flex flex-col justify-center bg-white" style="flex: 1; padding: 3.5rem 4.5rem;">
                
                <div class="w-full">
                    <div class="mb-8">
                        <h2 class="font-bold text-2xl mb-1.5" style="color: #0f172a; font-family: inherit;">Create Account</h2>
                        <p class="text-sm font-medium" style="color: #64748b;">Please provide your official details to register as a voter.</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="mb-6 p-4 rounded-xl border flex items-start gap-3" style="background-color: #fef2f2; border-color: #fee2e2;">
                            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" style="color: #ef4444;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
                            <p class="text-sm" style="color: #dc2626;">${error}</p>
                        </div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="mb-6 p-4 rounded-xl border flex items-start gap-3" style="background-color: #f0fdf4; border-color: #dcfce7;">
                            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" style="color: #22c55e;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                            <p class="text-sm" style="color: #15803d;">${success}</p>
                        </div>
                    </c:if>

                    <form method="POST" action="${pageContext.request.contextPath}/register" enctype="multipart/form-data">
                        
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                            <!-- Full Name -->
                            <div>
                                <label class="custom-label">FULL NAME</label>
                                <input type="text" name="fullName" required class="custom-input" placeholder="As per citizenship ID">
                            </div>
                            <!-- Email -->
                            <div>
                                <label class="custom-label">EMAIL ADDRESS</label>
                                <input type="email" name="email" required class="custom-input" placeholder="name@example.com">
                            </div>
                            <!-- Password -->
                            <div>
                                <label class="custom-label">PASSWORD</label>
                                <input type="password" name="password" required minlength="6" class="custom-input" placeholder="••••••••" oninput="document.getElementById('hiddenConfirmPassword').value = this.value;">
                            </div>
                            <!-- Citizenship Number -->
                            <div>
                                <label class="custom-label">CITIZENSHIP NUMBER</label>
                                <input type="text" name="citizenshipNumber" required class="custom-input" placeholder="ID-000-000-000">
                            </div>
                        </div>

                        <!-- Constituency -->
                        <div style="margin-top: 1.5rem;">
                            <label class="custom-label">CONSTITUENCY</label>
                            <select name="constituencyId" class="custom-input cursor-pointer" required>
                                <option value="" disabled selected>Select your registered constituency</option>
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

                        <!-- Backend required fields stored invisibly to not break logic -->
                        <input type="hidden" name="confirmPassword" id="hiddenConfirmPassword" value="">
                        <input type="hidden" name="phone" value="">
                        <input type="hidden" name="address" value="">

                        <!-- Legal ID Proof / Profile Image Upload -->
                        <div style="margin-top: 1.5rem;">
                            <label class="custom-label">LEGAL IDENTIFICATION PROOF</label>
                            <div class="relative rounded-xl flex justify-center px-6 pt-6 pb-6" style="border: 2px dashed #cbd5e1; background-color: #f8fafc; transition: all 0.2s ease;">
                                <div class="space-y-2 text-center w-full">
                                    <div style="display: flex; justify-content: center; margin-bottom: 0.5rem;">
                                        <svg style="width: 2.25rem; height: 2.25rem; color: #64748b;" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM14 13v4h-4v-4H7l5-5 5 5h-3z"/>
                                        </svg>
                                    </div>
                                    <div style="font-size: 0.875rem; font-weight: 700; color: #061e68;">
                                        <label for="file-upload" style="cursor: pointer; position: relative;">
                                            <span>Click to upload or drag and drop</span>
                                            <input id="file-upload" name="profileImage" type="file" accept="image/png,image/jpeg,application/pdf" style="opacity: 0; position: absolute; left: 0; top: 0; width: 100%; height: 100%; cursor: pointer;">
                                        </label>
                                    </div>
                                    <p style="font-size: 0.7rem; font-weight: 500; color: #64748b; margin-top: 0.25rem;">PDF, PNG or JPG (max. 10MB)</p>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit"
                                class="w-full rounded-xl font-bold text-white flex items-center justify-center transition-all duration-200 hover:shadow-lg"
                                style="background-color: #061e68; font-family: inherit; margin-top: 2.5rem; padding: 1.125rem; font-size: 1rem; border: none; cursor: pointer;">
                            Complete Registration
                            <svg style="width: 1.125rem; height: 1.125rem; margin-left: 0.5rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="5" y1="12" x2="19" y2="12"/>
                                <polyline points="12 5 19 12 12 19"/>
                            </svg>
                        </button>
                    </form>

                    <!-- Sign In Link -->
                    <div class="mt-8 text-center">
                        <p class="text-sm font-medium" style="color: #64748b;">
                            Already have an account?
                            <a href="${pageContext.request.contextPath}/login" class="font-bold transition-colors ml-1" style="color: #2563eb; text-decoration: none;">Sign In</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Links -->
        <div class="mt-8 flex flex-col items-center justify-center gap-2 pb-4">
            <p class="text-xs font-semibold" style="color: #64748b; letter-spacing: 0.05em;">&copy; 2026 NIRVACHANSETU &bull; ELECTION COMMISSION OF THE BASTION</p>
            <div class="flex items-center gap-4 mt-2">
                <a href="#" class="text-xs font-semibold uppercase" style="color: #94a3b8; text-decoration: none; letter-spacing: 0.05em;">Privacy Protocol</a>
                <a href="#" class="text-xs font-semibold uppercase" style="color: #94a3b8; text-decoration: none; letter-spacing: 0.05em;">Terms of Mandate</a>
                <a href="#" class="text-xs font-semibold uppercase" style="color: #94a3b8; text-decoration: none; letter-spacing: 0.05em;">Accessibility</a>
            </div>
        </div>
    </div>
</body>
</html>
