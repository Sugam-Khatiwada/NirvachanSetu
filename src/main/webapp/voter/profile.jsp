<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | NirvachanSetu</title>
    <link href="${pageContext.request.contextPath}/css/output.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 flex flex-col min-h-screen font-sans text-gray-800">

    <!-- Main Content -->
    <main class="flex-grow max-w-7xl mx-auto w-full px-4 sm:px-6 py-8 flex flex-col lg:flex-row gap-6">
        
        <!-- Left Sidebar (Cards) -->
        <aside class="w-full lg:w-1/3 flex flex-col gap-6">
            
            <!-- Profile Summary Card -->
            <div class="bg-white rounded-xl p-8 shadow-sm border border-gray-100 flex flex-col items-center">
                <!-- Avatar with Badge -->
                <div class="relative mb-6">
                    <div class="w-24 h-24 rounded-full bg-[#0a1420] overflow-hidden border-[3px] border-white shadow-md flex items-center justify-center">
                        <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=${not empty user.fullName ? user.fullName : 'User'}&backgroundColor=transparent" alt="Avatar" class="w-full h-full object-cover opacity-80">
                    </div>
                    <div class="absolute bottom-0 right-0 bg-[#2e74ff] text-white w-7 h-7 rounded-full flex items-center justify-center border-[3px] border-white text-[10px] shadow-sm">
                        <i class="fa-solid fa-check"></i>
                    </div>
                </div>

                <h2 class="text-xl font-bold text-gray-900 mb-1"><c:out value="${user.fullName}" default="Not Provided"/></h2>
                <p class="text-xs font-bold text-gray-500 tracking-widest uppercase mb-6">Voter ID: <c:out value="${user.voterId}" default="Not Found"/></p>

                <div class="w-full h-px bg-gray-100 mb-6"></div>

                <div class="w-full flex justify-between items-center px-2">
                    <div>
                        <p class="text-[10px] font-bold text-gray-400 tracking-wider uppercase mb-1.5">Status</p>
                        <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-bold bg-green-100 text-green-700">
                            <span class="w-1.5 h-1.5 rounded-full bg-green-500"></span> Active
                        </span>
                    </div>
                    <div class="text-right">
                        <p class="text-[10px] font-bold text-gray-400 tracking-wider uppercase mb-1.5">Verified On</p>
                        <p class="text-sm font-bold text-gray-900">12 Oct 2023</p>
                    </div>
                </div>
            </div>

            <!-- Polling Information Card -->
            <div class="bg-[#24387d] rounded-xl p-8 shadow-sm text-white">
                <h3 class="text-base font-bold mb-6 text-[#8b9dec]">Polling Information</h3>
                
                <div class="flex items-start gap-4 mb-6">
                    <div class="mt-1 opacity-60">
                        <i class="fa-solid fa-location-dot text-lg text-[#8b9dec]"></i>
                    </div>
                    <div>
                        <p class="text-[10px] font-bold text-[#8b9dec] tracking-wider uppercase mb-1">Constituency</p>
                        <p class="text-sm font-bold text-white"><c:out value="${user.constituency.name}" default="Not Assigned"/></p>
                    </div>
                </div>

                <div class="flex items-start gap-4 mb-8">
                    <div class="mt-1 opacity-60">
                        <i class="fa-solid fa-building-columns text-lg text-[#8b9dec]"></i>
                    </div>
                    <div>
                        <p class="text-[10px] font-bold text-[#8b9dec] tracking-wider uppercase mb-1">Polling Station</p>
                        <p class="text-sm font-bold text-white leading-snug"><c:out value="${user.pollingStation}" default="Not Assigned"/></p>
                    </div>
                </div>

                <button class="w-full bg-[#ffffff1a] hover:bg-[#ffffff2a] transition-colors py-3 rounded-lg text-xs font-bold tracking-wide flex items-center justify-center gap-2">
                    View Route on Map <i class="fa-solid fa-arrow-right text-[10px]"></i>
                </button>
            </div>

        </aside>

        <!-- Right Content Area -->
        <div class="w-full lg:w-2/3 flex flex-col gap-6">
            
            <!-- Personal Particulars Section -->
            <div class="bg-white rounded-xl p-8 shadow-sm border border-gray-100">
                <div class="flex justify-between items-start mb-8">
                    <div>
                        <h2 class="text-lg font-bold text-gray-900 mb-1">Personal Particulars</h2>
                        <p class="text-xs text-gray-500">Details as recorded in the National Electoral Roll</p>
                    </div>
                    <button class="bg-[#183183] text-white px-5 py-2.5 rounded-lg text-xs font-bold hover:bg-[#122154] transition-colors flex items-center gap-2 shadow-sm">
                        <i class="fa-solid fa-pen text-[10px]"></i> Edit Profile
                    </button>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-y-6 gap-x-12">
                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Full Name</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.fullName}" default="Not Provided"/></p>
                    </div>
                    
                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Date of Birth</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.dob}" default="Not Provided"/></p>
                    </div>

                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Gender</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.gender}" default="Not Provided"/></p>
                    </div>

                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Mobile Number</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.mobileNumber}" default="Not Provided"/></p>
                    </div>

                    <!-- Field Full Width -->
                    <div class="md:col-span-2 border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Registered Residential Address</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.address}" default="Not Provided"/></p>
                    </div>

                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">Relative's Name</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.relativeName}" default="Not Provided"/></p>
                    </div>

                    <!-- Field -->
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-[10px] font-bold text-[#6b7280] tracking-wider uppercase mb-1">EPIC Card Type</p>
                        <p class="text-sm font-bold text-gray-900"><c:out value="${user.epicCardType}" default="Not Provided"/></p>
                    </div>
                </div>

                <!-- Admin Notice Box -->
                <div class="mt-8 bg-[#f5f8ff] rounded-lg p-5 flex gap-4 border border-[#e5edff]">
                    <div class="text-[#2049d5] mt-0.5 text-lg">
                        <i class="fa-solid fa-circle-info"></i>
                    </div>
                    <div>
                        <h4 class="text-sm font-bold text-[#223985] mb-1.5">Administrative Notice</h4>
                        <p class="text-xs text-[#4056a1] leading-relaxed opacity-90">
                            To maintain the integrity of the electoral roll, any modifications to your profile details (except mobile/email) will undergo a verification process by the District Election Officer. Please ensure you have supporting documents ready for upload.
                        </p>
                    </div>
                </div>

                <!-- Recent Activity Section -->
                <div class="mt-10">
                    <h3 class="text-base font-bold text-gray-900 mb-6 flex items-center gap-2">
                        <i class="fa-solid fa-clock-rotate-left text-gray-500"></i> Recent Activity
                    </h3>

                    <div class="flex flex-col gap-5">
                        <!-- Activity Item -->
                        <div class="flex items-center justify-between group">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-full bg-gray-50 border border-gray-100 flex items-center justify-center text-[#2b3990]">
                                    <i class="fa-solid fa-user-check text-sm"></i>
                                </div>
                                <div>
                                    <h4 class="text-sm font-bold text-gray-900 mb-0.5">Identity Re-verification</h4>
                                    <p class="text-[10px] text-gray-500">Completed via Aadhaar OTP</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-xs font-bold text-gray-900 mb-0.5">Oct 24, 2024</p>
                                <p class="text-[10px] font-bold text-[#1b9a59] uppercase tracking-widest">SUCCESS</p>
                            </div>
                        </div>

                        <!-- Activity Item -->
                        <div class="flex items-center justify-between group">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-full bg-gray-50 border border-gray-100 flex items-center justify-center text-[#2b3990]">
                                    <i class="fa-solid fa-download text-sm"></i>
                                </div>
                                <div>
                                    <h4 class="text-sm font-bold text-gray-900 mb-0.5">Voter Slip Download</h4>
                                    <p class="text-[10px] text-gray-500">Constituency: Bangalore South</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-xs font-bold text-gray-900 mb-0.5">Oct 12, 2024</p>
                                <p class="text-[10px] font-bold text-gray-500 tracking-wider">1.2 MB</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </main>

</body>
</html>
