<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - NirvachanSetu</title>
    <!-- Using Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }
    </style>
</head>
<body class="text-slate-800 antialiased min-h-screen flex flex-col relative">

    <!-- Header -->
    <header class="bg-white px-8 py-4 flex items-center justify-between border-b border-gray-100">
        <div class="flex items-center gap-8">
            <h1 class="text-xl font-bold text-blue-900">Nirvachan<span class="text-blue-600">Setu</span></h1>
            <nav class="hidden md:flex gap-6 text-sm font-medium text-gray-500">
                <a href="dashboard.jsp" class="hover:text-blue-600 pb-5 mb--5">Dashboard</a>
                <a href="candidates.jsp" class="hover:text-blue-600 pb-5 mb--5">Candidates</a>
                <a href="cast-vote.jsp" class="hover:text-blue-600 pb-5 mb--5">Vote</a>
                <a href="results.jsp" class="hover:text-blue-600 pb-5 mb--5">Results</a>
                <a href="profile.jsp" class="text-blue-600 border-b-2 border-blue-600 pb-5 mb--5">Profile</a>
            </nav>
        </div>
        <div class="flex items-center gap-6">
            <div class="relative">
                <i class="fa-solid fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                <input type="text" placeholder="Search elections..." class="bg-gray-100 text-sm rounded-md pl-9 pr-4 py-2 w-64 focus:outline-none focus:ring-2 focus:ring-blue-100">
            </div>
            <button class="text-gray-600 hover:text-blue-600"><i class="fa-solid fa-bell"></i></button>
            <button class="text-gray-600 hover:text-blue-600"><i class="fa-solid fa-circle-question"></i></button>
            <div class="w-8 h-8 rounded-full bg-gray-300 overflow-hidden border border-gray-200 shrink-0">
                <img src="assets/profile.jpeg" alt="Profile" class="w-full h-full object-cover">
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="flex-grow w-full max-w-6xl mx-auto px-6 py-8">
        
        <div class="flex flex-col lg:flex-row gap-8">
            
            <!-- Left Column: Summary Cards -->
            <div class="w-full lg:w-1/3 flex flex-col gap-6">
                
                <!-- Profile Avatar Card -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8 flex flex-col items-center text-center">
                    <div class="relative mb-5 inline-block">
                        <div class="w-28 h-28 rounded-full overflow-hidden border-4 border-white shadow-md bg-gray-100 shrink-0">
                            <img src="assets/profile.jpeg" alt="Shibu Panday" class="w-full h-full object-cover object-top">
                        </div>
                        <div class="absolute bottom-0 right-0 w-8 h-8 bg-blue-500 rounded-full border-4 border-white flex items-center justify-center text-white shadow-sm">
                            <i class="fa-solid fa-check text-xs"></i>
                        </div>
                    </div>
                    
                    <h2 class="text-xl font-bold text-gray-900">Shibu Panday</h2>
                    <p class="text-xs font-semibold text-gray-500 tracking-wider mb-6 mt-1 uppercase">Voter ID: ABC1234567</p>
                    
                    <div class="w-full h-px bg-gray-100 mb-6"></div>
                    
                    <div class="flex justify-between w-full">
                        <div class="text-left">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1.5">Status</p>
                            <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-green-100 text-green-700 text-xs font-bold">
                                <span class="w-1.5 h-1.5 rounded-full bg-green-600"></span> Active
                            </span>
                        </div>
                        <div class="text-right">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1.5">Verified On</p>
                            <p class="text-sm font-bold text-gray-800">12 Oct 2023</p>
                        </div>
                    </div>
                </div>

                <!-- Polling Info Card -->
                <div class="bg-[#1e3a8a] rounded-2xl shadow-md p-7 text-white">
                    <h3 class="text-lg font-bold mb-6 opacity-90">Polling Information</h3>
                    
                    <div class="flex gap-4 mb-5">
                        <div class="w-8 flex justify-center mt-1">
                            <i class="fa-solid fa-location-dot text-blue-300 text-lg"></i>
                        </div>
                        <div>
                            <p class="text-xs text-blue-200 font-medium mb-0.5 opacity-80">Constituency</p>
                            <p class="font-bold">Koshi, Sunsari-3</p>
                        </div>
                    </div>
                    
                    <div class="flex gap-4 mb-8">
                        <div class="w-8 flex justify-center mt-1">
                            <i class="fa-solid fa-building-columns text-blue-300 text-lg"></i>
                        </div>
                        <div>
                            <p class="text-xs text-blue-200 font-medium mb-0.5 opacity-80">Polling Station</p>
                            <p class="font-bold text-[15px] leading-tight">St. Mary's School, Block B, Room 4</p>
                        </div>
                    </div>
                    
                    <button class="w-full bg-[#ffffff15] hover:bg-[#ffffff25] border border-[#ffffff30] text-white font-medium py-3 rounded-xl transition duration-150 flex items-center justify-center gap-2 text-sm">
                        View Route on Map <i class="fa-solid fa-arrow-right text-xs"></i>
                    </button>
                </div>
                
            </div>

            <!-- Right Column: Details & Activity -->
            <div class="w-full lg:w-2/3 flex flex-col gap-6">
                
                <!-- Personal Particulars Section -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8">
                    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
                        <div>
                            <h2 class="text-2xl font-bold text-gray-900">Personal Particulars</h2>
                            <p class="text-sm text-gray-500 mt-1">Details as recorded in the National Electoral Roll</p>
                        </div>
                        <button class="bg-[#11235a] hover:bg-blue-900 text-white font-semibold py-2.5 px-5 rounded-lg transition duration-150 flex items-center justify-center gap-2 text-sm shrink-0 shadow-sm">
                            <i class="fa-solid fa-pen text-xs"></i> Edit Profile
                        </button>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-8 gap-y-6">
                        <div class="border-b border-gray-100 pb-3">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Full Name</p>
                            <p class="font-bold text-gray-800">Shibu Panday</p>
                        </div>
                        <div class="border-b border-gray-100 pb-3">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Date of Birth</p>
                            <p class="font-bold text-gray-800">14 May 2001</p>
                        </div>
                        <div class="border-b border-gray-100 pb-3">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Gender</p>
                            <p class="font-bold text-gray-800">Male</p>
                        </div>
                        <div class="border-b border-gray-100 pb-3">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Mobile Number</p>
                            <p class="font-bold text-gray-800">+91 98XXX XX042</p>
                        </div>
                        <div class="col-span-1 sm:col-span-2 border-b border-gray-100 pb-3">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Registered Residential Address</p>
                            <p class="font-bold text-gray-800">Koshi, Sunsari-3, Pragati-Chowk</p>
                        </div>
                        <div class="border-b lg:border-none border-gray-100 pb-3 lg:pb-0">
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Relative's Name</p>
                            <p class="font-bold text-gray-800">Srinivasan Panday (Father)</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">EPIC Card Type</p>
                            <p class="font-bold text-gray-800">Digital PVC e-EPIC</p>
                        </div>
                    </div>
                </div>

                <!-- Admin Notice Box -->
                <div class="bg-[#eff6ff] border border-blue-100 rounded-xl p-5 flex gap-4">
                    <i class="fa-solid fa-circle-info text-blue-600 mt-0.5"></i>
                    <div>
                        <h4 class="text-blue-900 font-bold text-sm mb-1.5">Administrative Notice</h4>
                        <p class="text-blue-700/80 text-xs font-medium leading-relaxed">
                            To maintain the integrity of the electoral roll, any modifications to your profile details (except mobile/email) will undergo a verification process by the District Election Officer. Please ensure you have supporting documents ready for upload.
                        </p>
                    </div>
                </div>

                <!-- Recent Activity List -->
                <div class="mt-4">
                    <h3 class="text-lg font-bold text-gray-900 mb-6 flex items-center gap-2">
                        <i class="fa-solid fa-clock-rotate-left text-gray-500"></i> Recent Activity
                    </h3>
                    
                    <div class="space-y-4">
                        
                        <!-- Activity 1 -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-4 flex items-center justify-between">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-full bg-blue-50 flex items-center justify-center text-blue-600 shrink-0">
                                    <i class="fa-solid fa-user-check"></i>
                                </div>
                                <div>
                                    <p class="font-bold text-gray-800 text-sm mb-0.5">Identity Re-verification</p>
                                    <p class="text-xs text-gray-500 font-medium">Completed via Aadhaar OTP</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-xs font-bold text-gray-800 mb-0.5">Oct 24, 2024</p>
                                <p class="text-[10px] font-bold text-green-600 uppercase tracking-widest">Success</p>
                            </div>
                        </div>

                        <!-- Activity 2 -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-4 flex items-center justify-between">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 rounded-full bg-orange-50 flex items-center justify-center text-orange-600 shrink-0">
                                    <i class="fa-solid fa-download"></i>
                                </div>
                                <div>
                                    <p class="font-bold text-gray-800 text-sm mb-0.5">Voter Slip Download</p>
                                    <p class="text-xs text-gray-500 font-medium">Constituency: Sunsari-3</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-xs font-bold text-gray-800 mb-0.5">Oct 12, 2024</p>
                                <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest">1.2 MB</p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </main>

    <!-- Footer -->
    <footer class="mt-auto bg-gray-50 border-t border-gray-200 py-6 px-8 text-sm">
        <div class="max-w-7xl mx-auto w-full flex flex-col md:flex-row justify-between items-center gap-4">
            <div class="flex flex-col md:flex-row items-center gap-2 md:gap-4">
                <h2 class="text-base font-bold text-gray-800">Nirvachan<span class="text-gray-500">Setu</span></h2>
                <span class="hidden md:inline text-gray-300">|</span>
                <span class="text-xs text-gray-500">@2026 Election. All rights reserved.</span>
            </div>
            <div class="flex flex-wrap justify-center gap-6 text-xs font-semibold text-gray-500">
                <a href="#" class="hover:text-gray-800 transition-colors">Privacy Policy</a>
                <a href="#" class="hover:text-gray-800 transition-colors">Terms of Service</a>
                <a href="#" class="hover:text-gray-800 transition-colors">Accessibility</a>
                <a href="#" class="hover:text-gray-800 transition-colors">Contact Support</a>
            </div>
        </div>
    </footer>

</body>
</html>
