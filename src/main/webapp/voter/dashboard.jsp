<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - NirvachanSetu</title>
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
<body class="text-slate-800 antialiased min-h-screen flex flex-col">

    <!-- Header -->
    <header class="bg-white px-8 py-4 flex items-center justify-between border-b border-gray-100">
        <div class="flex items-center gap-8">
            <h1 class="text-xl font-bold text-blue-900">Nirvachan<span class="text-blue-600">Setu</span></h1>
            <nav class="hidden md:flex gap-6 text-sm font-medium text-gray-500">
                <a href="dashboard.jsp" class="text-blue-600 border-b-2 border-blue-600 pb-5 mb--5">Dashboard</a>
                <a href="candidates.jsp" class="hover:text-blue-600 pb-5 mb--5">Candidates</a>
                <a href="cast-vote.jsp" class="hover:text-blue-600 pb-5 mb--5">Vote</a>
                <a href="results.jsp" class="hover:text-blue-600 pb-5 mb--5">Results</a>
                <a href="profile.jsp" class="hover:text-blue-600 pb-5 mb--5">Profile</a>
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
    <main class="flex-grow max-w-7xl w-full mx-auto px-8 py-8">
        
        <!-- Welcome & Info Section -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-10">
            
            <!-- Welcome Banner -->
            <div class="lg:col-span-2 bg-gradient-to-br from-blue-900 to-blue-800 rounded-2xl p-8 text-white relative overflow-hidden shadow-sm">
                <h2 class="text-4xl font-bold mb-4 mt-2">Welcome back, Rajesh.</h2>
                <p class="text-blue-200 text-base max-w-lg mb-8 leading-relaxed">
                    Your democratic participation ensures a stronger future. Review your local candidates and prepare for the upcoming polling day.
                </p>
                <div class="flex flex-wrap gap-4">
                    <div class="bg-white/10 border border-white/20 rounded-xl px-5 py-3">
                        <div class="text-[10px] uppercase font-bold text-blue-200 tracking-wider mb-1">Status</div>
                        <div class="flex items-center gap-2 font-semibold">
                            <div class="w-2 h-2 rounded-full bg-green-400"></div>
                            Verified Voter
                        </div>
                    </div>
                    <div class="bg-white/10 border border-white/20 rounded-xl px-5 py-3">
                        <div class="text-[10px] uppercase font-bold text-blue-200 tracking-wider mb-1">Polling Date</div>
                        <div class="font-semibold">May 12, 2024</div>
                    </div>
                </div>
            </div>

            <!-- Constituency Info -->
            <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex flex-col justify-between">
                <div>
                    <h3 class="text-lg font-bold text-blue-900 mb-6">Constituency Info</h3>
                    
                    <div class="flex gap-4 mb-6">
                        <div class="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center shrink-0">
                            <i class="fa-solid fa-location-dot text-blue-600"></i>
                        </div>
                        <div>
                            <div class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">District</div>
                            <div class="font-bold text-gray-800">North Bangalore</div>
                        </div>
                    </div>

                    <div class="flex gap-4">
                        <div class="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center shrink-0">
                            <i class="fa-solid fa-person-booth text-blue-600"></i>
                        </div>
                        <div>
                            <div class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Polling Booth</div>
                            <div class="font-bold text-gray-800">Govt. Arts College, Hall A</div>
                        </div>
                    </div>
                </div>
                
                <button class="w-full mt-6 py-3 rounded-lg border border-gray-200 text-blue-600 font-semibold hover:bg-gray-50 transition duration-150 flex items-center justify-center gap-2 text-sm shadow-sm">
                    <i class="fa-solid fa-map"></i> View on Map
                </button>
            </div>
        </div>

        <!-- Candidates Section Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-6 gap-4">
            <div>
                <h2 class="text-2xl font-bold text-gray-900">Constituency Candidates</h2>
                <p class="text-sm text-gray-500 mt-1">4 candidates contesting in <span class="font-semibold text-gray-700">North Bangalore</span></p>
            </div>
            <div class="flex items-center gap-3">
                <div class="relative">
                    <i class="fa-solid fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                    <input type="text" placeholder="Search by name..." class="bg-white border border-gray-200 text-sm rounded-lg pl-9 pr-4 py-2.5 w-60 focus:outline-none focus:ring-2 focus:ring-blue-100 shadow-sm">
                </div>
                <select class="bg-white border border-gray-200 text-sm text-gray-700 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-100 shadow-sm appearance-none pr-8 relative">
                    <option>All Parties</option>
                </select>
                <button class="bg-white border border-gray-200 text-gray-600 rounded-lg w-10 h-10 flex items-center justify-center hover:bg-gray-50 shadow-sm">
                    <i class="fa-solid fa-sliders"></i>
                </button>
            </div>
        </div>

        <!-- Candidate Cards Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
            
            <!-- Card 1 -->
            <div class="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-100 hover:shadow-md transition duration-200 flex flex-col top-0 relative">
                <div class="h-48 relative">
                    <img src="assets/balen.jpg" alt="Balen" class="w-full h-full object-cover object-top">
                    <div class="absolute top-3 left-3 bg-blue-900 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90">Independent</div>
                </div>
                <div class="p-5 flex flex-col flex-grow">
                    <h3 class="text-lg font-bold text-gray-900">Balen</h3>
                    <p class="text-xs text-gray-500 mt-1 mb-4 flex items-center gap-1"><i class="fa-solid fa-user-tie text-gray-400"></i> Social Reformer</p>
                    
                    <div class="flex justify-between mt-auto mb-5 border-t border-gray-50 pt-4">
                        <div>
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Experience</div>
                            <div class="text-sm font-semibold text-gray-800">Civic Activism</div>
                        </div>
                        <div class="text-right">
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Agenda</div>
                            <div class="text-sm font-semibold text-gray-800">Transparency</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-100 hover:shadow-md transition duration-200 flex flex-col top-0 relative">
                <div class="h-48 relative">
                    <img src="assets/harka.jpeg" alt="Harka" class="w-full h-full object-cover object-top">
                    <div class="absolute top-3 left-3 bg-blue-500 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90">Regional Alliance</div>
                </div>
                <div class="p-5 flex flex-col flex-grow">
                    <h3 class="text-lg font-bold text-gray-900">Harka</h3>
                    <p class="text-xs text-gray-500 mt-1 mb-4 flex items-center gap-1"><i class="fa-solid fa-bolt text-gray-400"></i> Youth Leader</p>
                    
                    <div class="flex justify-between mt-auto mb-5 border-t border-gray-50 pt-4">
                        <div>
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Experience</div>
                            <div class="text-sm font-semibold text-gray-800">Grassroots</div>
                        </div>
                        <div class="text-right">
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Agenda</div>
                            <div class="text-sm font-semibold text-gray-800">Public Services</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-100 hover:shadow-md transition duration-200 flex flex-col top-0 relative">
                <div class="h-48 relative">
                    <img src="assets/kpoli.jpg" alt="Kpoli" class="w-full h-full object-cover object-top">
                    <div class="absolute top-3 left-3 bg-blue-900 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90">National Party</div>
                </div>
                <div class="p-5 flex flex-col flex-grow">
                    <h3 class="text-lg font-bold text-gray-900">Kpoli</h3>
                    <p class="text-xs text-gray-500 mt-1 mb-4 flex items-center gap-1"><i class="fa-solid fa-certificate text-gray-400"></i> Incumbent Candidate</p>
                    
                    <div class="flex justify-between mt-auto mb-5 border-t border-gray-50 pt-4">
                        <div>
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Experience</div>
                            <div class="text-sm font-semibold text-gray-800">15+ Years</div>
                        </div>
                        <div class="text-right">
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Agenda</div>
                            <div class="text-sm font-semibold text-gray-800">Urban Infra</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="bg-white rounded-2xl overflow-hidden shadow-sm border border-gray-100 hover:shadow-md transition duration-200 flex flex-col top-0 relative">
                <div class="h-48 relative">
                    <img src="assets/parchanda.jpg" alt="Parchanda" class="w-full h-full object-cover object-top">
                    <div class="absolute top-3 left-3 bg-blue-900 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90">National Party</div>
                </div>
                <div class="p-5 flex flex-col flex-grow">
                    <h3 class="text-lg font-bold text-gray-900">Parchanda</h3>
                    <p class="text-xs text-gray-500 mt-1 mb-4 flex items-center gap-1"><i class="fa-solid fa-graduation-cap text-gray-400"></i> Revolutionist</p>
                    
                    <div class="flex justify-between mt-auto mb-5 border-t border-gray-50 pt-4">
                        <div>
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Experience</div>
                            <div class="text-sm font-semibold text-gray-800">20+ Years</div>
                        </div>
                        <div class="text-right">
                            <div class="text-[9px] uppercase font-bold text-gray-400 tracking-wider mb-1">Agenda</div>
                            <div class="text-sm font-semibold text-gray-800">New Republic</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-gray-50/80 rounded-2xl p-6 border border-gray-100 flex items-center gap-5 shadow-sm">
                <div class="w-12 h-12 rounded-xl bg-blue-100 flex items-center justify-center text-blue-600 shrink-0">
                    <i class="fa-solid fa-users text-lg"></i>
                </div>
                <div>
                    <div class="text-[10px] font-bold text-gray-500 uppercase tracking-widest mb-1">Registered Voters</div>
                    <div class="text-2xl font-bold text-gray-900">1.2M+</div>
                </div>
            </div>

            <div class="bg-gray-50/80 rounded-2xl p-6 border border-gray-100 flex items-center gap-5 shadow-sm">
                <div class="w-12 h-12 rounded-xl bg-orange-100 flex items-center justify-center text-orange-800 shrink-0">
                    <i class="fa-solid fa-stopwatch text-lg"></i>
                </div>
                <div>
                    <div class="text-[10px] font-bold text-gray-500 uppercase tracking-widest mb-1">Days to Polling</div>
                    <div class="text-2xl font-bold text-gray-900">14 Days</div>
                </div>
            </div>

            <div class="bg-gray-50/80 rounded-2xl p-6 border border-gray-100 flex items-center gap-5 shadow-sm">
                <div class="w-12 h-12 rounded-xl bg-blue-100 flex items-center justify-center text-blue-900 shrink-0">
                    <i class="fa-solid fa-map-location-dot text-lg"></i>
                </div>
                <div>
                    <div class="text-[10px] font-bold text-gray-500 uppercase tracking-widest mb-1">Constituencies</div>
                    <div class="text-2xl font-bold text-gray-900">224</div>
                </div>
            </div>
        </div>

    </main>

    <!-- Footer -->
    <footer class="mt-auto bg-gray-50 border-t border-gray-200 py-6 px-8">
        <div class="max-w-7xl mx-auto w-full flex flex-col md:flex-row justify-between items-center gap-4">
            <div class="flex items-center gap-4">
                <h2 class="text-lg font-bold text-gray-800">Nirvachan<span class="text-gray-500">Setu</span></h2>
                <span class="text-xs text-gray-500 border-l border-gray-300 pl-4">@2026 Election. All rights reserved.</span>
            </div>
            <div class="flex gap-6 text-xs font-semibold text-gray-500">
                <a href="#" class="hover:text-gray-800">Privacy Policy</a>
                <a href="#" class="hover:text-gray-800">Terms of Service</a>
                <a href="#" class="hover:text-gray-800">Accessibility</a>
                <a href="#" class="hover:text-gray-800">Contact Support</a>
            </div>
        </div>
    </footer>

</body>
</html>
