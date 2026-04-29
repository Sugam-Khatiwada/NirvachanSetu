<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    colors: {
                        primary: '#1e3a8a',
                        brand: {
                            50: '#f0f9ff',
                            100: '#e0f2fe',
                            500: '#0ea5e9',
                            600: '#0284c7',
                            900: '#1e3a8a',
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Custom scrollbar */
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
    </style>
</head>
<body class="bg-gray-50 text-gray-800 font-sans antialiased overflow-hidden">

<div class="flex h-screen w-full">
    <!-- Sidebar -->
    <aside class="w-64 bg-white border-r border-gray-200 flex flex-col flex-shrink-0">
        <!-- Logo -->
        <div class="h-16 flex items-center px-6 border-b border-gray-100">
            <div class="w-8 h-8 bg-brand-900 rounded flex items-center justify-center mr-3 text-white">
                <i class="fa-solid fa-building-columns text-sm"></i>
            </div>
            <div>
                <h1 class="text-brand-900 font-bold text-lg leading-tight">NirvachanSetu</h1>
                <p class="text-[9px] text-gray-500 font-bold tracking-wider uppercase">Election Management</p>
            </div>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 py-6 px-4 space-y-1.5 overflow-y-auto">
            <a href="dashboard.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-border-all w-5 h-5 mr-3 text-blue-700"></i>
                Dashboard
            </a>
            <a href="users.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-users w-5 h-5 mr-3 text-gray-400 group-hover:text-gray-600"></i>
                Users
            </a>
            <a href="candidates.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-user-tie w-5 h-5 mr-3 text-gray-400"></i>
                Candidates
            </a>
            <a href="elections.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-check-to-slot w-5 h-5 mr-3 text-gray-400"></i>
                Elections
            </a>
            <a href="constituencies.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-map-location-dot w-5 h-5 mr-3 text-gray-400"></i>
                Constituencies
            </a>
            <a href="results.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-chart-simple w-5 h-5 mr-3 text-gray-400"></i>
                Results
            </a>
        </nav>

        <!-- Bottom Links -->
        <div class="p-4 border-t border-gray-100 space-y-1">
            <a href="#" class="flex items-center px-4 py-2.5 text-sm font-medium text-gray-600 hover:bg-gray-50 hover:text-gray-900 rounded-lg transition-colors">
                <i class="fa-regular fa-circle-question w-5 h-5 mr-3 text-gray-400"></i>
                Support
            </a>
            <a href="#" class="flex items-center px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50 rounded-lg transition-colors">
                <i class="fa-solid fa-arrow-right-from-bracket w-5 h-5 mr-3 text-red-500"></i>
                Logout
            </a>
        </div>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col overflow-hidden relative">
        <!-- Top Header -->
        <header class="h-16 bg-white flex items-center justify-between px-8 z-10 flex-shrink-0">
            <!-- Search Bar -->
            <div class="flex-1 flex">
                <div class="relative w-full max-w-md">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <i class="fa-solid fa-magnifying-glass text-gray-400 text-sm"></i>
                    </div>
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search elections, voters, or results...">
                </div>
            </div>

            <!-- Right Actions -->
            <div class="flex items-center space-x-6">
                <!-- Notifications -->
                <button class="text-gray-400 hover:text-gray-600 relative transition-colors">
                    <i class="fa-solid fa-bell text-[1.1rem]"></i>
                    <span class="absolute -top-0.5 -right-0.5 block h-2 w-2 rounded-full bg-red-500 ring-2 ring-white"></span>
                </button>
                <!-- Settings -->
                <button class="text-gray-400 hover:text-gray-600 transition-colors">
                    <i class="fa-solid fa-gear text-[1.1rem]"></i>
                </button>

                <div class="h-8 w-px bg-gray-200"></div>

                <!-- Profile -->
                <div class="flex items-center cursor-pointer">
                    <div class="mr-3 text-right">
                        <div class="text-sm font-bold text-brand-900 leading-tight">Admin Principal</div>
                        <div class="text-xs text-gray-500 mt-0.5">ECI Authority</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=11" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <main class="flex-1 overflow-y-auto p-8 bg-[#f8fafc]">
            <div class="max-w-7xl mx-auto space-y-6">

                <!-- Stat Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <!-- Total Users -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600">
                                <i class="fa-solid fa-user-check text-lg"></i>
                            </div>
                            <span class="px-2.5 py-1 text-xs font-semibold text-green-700 bg-green-100 rounded-full">+12%</span>
                        </div>
                        <div class="text-sm text-gray-500 font-medium">Total Users</div>
                        <div class="text-3xl font-bold text-brand-900 mt-1">1,248,392</div>
                        <div class="text-xs text-gray-400 mt-2">Registered Voters</div>
                    </div>

                    <!-- Total Candidates -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center text-blue-600">
                                <i class="fa-solid fa-fingerprint text-lg"></i>
                            </div>
                            <span class="px-2.5 py-1 text-xs font-semibold text-blue-700 bg-blue-100 rounded-full">New: 42</span>
                        </div>
                        <div class="text-sm text-gray-500 font-medium">Total Candidates</div>
                        <div class="text-3xl font-bold text-brand-900 mt-1">4,821</div>
                        <div class="text-xs text-gray-400 mt-2">Across all constituencies</div>
                    </div>

                    <!-- Ongoing Elections -->
                    <div class="bg-brand-900 rounded-2xl p-6 shadow-md relative overflow-hidden text-white">
                        <div class="absolute -right-6 -top-6 w-24 h-24 bg-white opacity-5 rounded-full"></div>
                        <div class="flex justify-between items-start mb-4 relative z-10">
                            <div class="w-10 h-10 rounded-xl bg-white/10 flex items-center justify-center text-white backdrop-blur-sm">
                                <i class="fa-solid fa-clipboard-list text-lg"></i>
                            </div>
                            <span class="w-2.5 h-2.5 bg-green-400 rounded-full shadow-[0_0_8px_rgba(74,222,128,0.8)]"></span>
                        </div>
                        <div class="text-sm text-blue-100 font-medium relative z-10">Ongoing Elections</div>
                        <div class="text-3xl font-bold text-white mt-1 relative z-10">08</div>
                        <div class="text-xs text-blue-200 mt-2 relative z-10">Live polling stations active</div>
                    </div>

                    <!-- Total Votes Cast -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-10 h-10 rounded-xl bg-orange-50 flex items-center justify-center text-orange-500">
                                <i class="fa-solid fa-list-ul text-lg"></i>
                            </div>
                            <span class="px-2.5 py-1 text-xs font-semibold text-orange-700 bg-orange-100 rounded-full">68% Turnout</span>
                        </div>
                        <div class="text-sm text-gray-500 font-medium">Total Votes Cast</div>
                        <div class="text-3xl font-bold text-brand-900 mt-1">849,203</div>
                        <div class="text-xs text-gray-400 mt-2">Validated blockchain entries</div>
                    </div>
                </div>

                <!-- Middle Section -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Live Tracking -->
                    <div class="lg:col-span-2 bg-white rounded-2xl p-6 shadow-sm border border-gray-100">
                        <div class="flex justify-between items-center mb-6">
                            <div>
                                <h2 class="text-lg font-bold text-brand-900">Live Election Tracking</h2>
                                <p class="text-sm text-gray-500 mt-0.5">Real-time status of General Assembly 2024</p>
                            </div>
                            <a href="#" class="text-sm font-semibold text-brand-600 hover:text-brand-800 flex items-center">
                                View Live Map <i class="fa-solid fa-arrow-up-right-from-square ml-1.5 text-xs"></i>
                            </a>
                        </div>

                        <div class="space-y-5">
                            <!-- Zone A -->
                            <div>
                                <div class="flex justify-between text-sm mb-1.5 font-medium">
                                    <span class="text-gray-800">Zone A: Northern District</span>
                                    <span class="text-brand-900 font-bold">82% Complete</span>
                                </div>
                                <div class="w-full bg-gray-100 rounded-full h-2">
                                    <div class="bg-brand-900 h-2 rounded-full" style="width: 82%"></div>
                                </div>
                            </div>
                            <!-- Zone B -->
                            <div>
                                <div class="flex justify-between text-sm mb-1.5 font-medium">
                                    <span class="text-gray-800">Zone B: Coastal Region</span>
                                    <span class="text-brand-900 font-bold">45% Complete</span>
                                </div>
                                <div class="w-full bg-gray-100 rounded-full h-2">
                                    <div class="bg-brand-900 h-2 rounded-full" style="width: 45%"></div>
                                </div>
                            </div>
                            <!-- Zone C -->
                            <div>
                                <div class="flex justify-between text-sm mb-1.5 font-medium">
                                    <span class="text-gray-800">Zone C: Metropolitan Hub</span>
                                    <span class="text-brand-900 font-bold">12% Complete</span>
                                </div>
                                <div class="w-full bg-gray-100 rounded-full h-2">
                                    <div class="bg-brand-900 h-2 rounded-full" style="width: 12%"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Alert -->
                        <div class="mt-8 bg-yellow-50 border border-yellow-100 rounded-xl p-4 flex items-start">
                            <div class="text-yellow-500 mr-3 mt-0.5">
                                <i class="fa-solid fa-circle-exclamation text-lg"></i>
                            </div>
                            <div>
                                <h4 class="text-sm font-bold text-gray-900">Security Alert: Connectivity Check</h4>
                                <p class="text-xs text-gray-600 mt-1 leading-relaxed">System identified 4 nodes in Zone C requiring manual sync verification. No data loss reported, standard protocol initiated.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="space-y-6">
                        <!-- System Integrity -->
                        <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 text-center">
                            <div class="w-12 h-12 bg-blue-50 rounded-full flex items-center justify-center mx-auto mb-4 text-brand-600">
                                <i class="fa-solid fa-shield-halved text-xl"></i>
                            </div>
                            <h3 class="text-base font-bold text-brand-900 mb-2">System Integrity</h3>
                            <p class="text-xs text-gray-500 mb-5 leading-relaxed">All biometric authentication servers are reporting 100% uptime with sub-20ms latency.</p>
                            <button class="w-full py-2.5 bg-brand-900 hover:bg-brand-800 text-white text-sm font-semibold rounded-lg transition-colors shadow-sm">
                                Health Check
                            </button>
                        </div>

                        <!-- Report Ready -->
                        <div class="bg-indigo-50 rounded-2xl p-6 relative overflow-hidden border border-indigo-100">
                            <i class="fa-regular fa-file-lines absolute -right-4 -bottom-4 text-6xl text-indigo-100 opacity-50 transform -rotate-12"></i>
                            <div class="relative z-10">
                                <h3 class="text-base font-bold text-brand-900 mb-2">Report Ready</h3>
                                <p class="text-xs text-indigo-800/70 pr-8 mb-5 leading-relaxed">Monthly administrative audit report is now available for download.</p>
                                <button class="py-2 px-4 bg-brand-900 hover:bg-brand-800 text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                                    <i class="fa-solid fa-download mr-2 text-xs"></i> PDF
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Upcoming Elections Table -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden relative">
                    <div class="p-6 border-b border-gray-100 flex justify-between items-center">
                        <h2 class="text-lg font-bold text-brand-900">Upcoming Elections Schedule</h2>
                        <div class="flex space-x-2">
                            <button class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-gray-600 hover:bg-gray-50 rounded-lg transition-colors">
                                <i class="fa-solid fa-filter text-sm"></i>
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-gray-600 hover:bg-gray-50 rounded-lg transition-colors">
                                <i class="fa-solid fa-ellipsis-vertical text-sm"></i>
                            </button>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                            <tr class="border-b border-gray-100 bg-gray-50/50">
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Election Name</th>
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Date Range</th>
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Level</th>
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Voter Base</th>
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Status</th>
                                <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-8 h-8 rounded bg-blue-50 text-blue-600 flex items-center justify-center mr-3">
                                            <i class="fa-solid fa-city text-xs"></i>
                                        </div>
                                        <span class="text-sm font-bold text-gray-900">Municipal Council Elections</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600">Oct 12 - Oct 14, 2024</td>
                                <td class="px-6 py-4">
                                    <span class="px-2.5 py-1 text-[10px] font-bold text-gray-600 bg-gray-100 rounded uppercase">Local</span>
                                </td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-900">125,000</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <span class="w-2 h-2 rounded-full bg-blue-500 mr-2"></span>
                                        <span class="text-sm font-medium text-blue-600">Registration</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-bold text-brand-900 cursor-pointer hover:underline">Manage</td>
                            </tr>
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-8 h-8 rounded bg-orange-50 text-orange-600 flex items-center justify-center mr-3">
                                            <i class="fa-solid fa-landmark text-xs"></i>
                                        </div>
                                        <span class="text-sm font-bold text-gray-900">Senate Representative Poll</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600">Nov 05 - Nov 06, 2024</td>
                                <td class="px-6 py-4">
                                    <span class="px-2.5 py-1 text-[10px] font-bold text-orange-600 bg-orange-50 rounded uppercase">State</span>
                                </td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-900">2,450,000</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <span class="w-2 h-2 rounded-full bg-gray-300 mr-2"></span>
                                        <span class="text-sm font-medium text-gray-500">Pending</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-bold text-brand-900 cursor-pointer hover:underline">Manage</td>
                            </tr>
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="w-8 h-8 rounded bg-green-50 text-green-600 flex items-center justify-center mr-3">
                                            <i class="fa-solid fa-users-rays text-xs"></i>
                                        </div>
                                        <span class="text-sm font-bold text-gray-900">Trade Union Council</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600">Dec 20, 2024</td>
                                <td class="px-6 py-4">
                                    <span class="px-2.5 py-1 text-[10px] font-bold text-green-600 bg-green-50 rounded uppercase">Union</span>
                                </td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-900">12,500</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <span class="w-2 h-2 rounded-full bg-gray-300 mr-2"></span>
                                        <span class="text-sm font-medium text-gray-500">Draft</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-bold text-brand-900 cursor-pointer hover:underline">Manage</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-4 border-t border-gray-100 flex justify-center">
                        <a href="#" class="text-xs font-semibold text-gray-500 hover:text-gray-800 transition-colors">
                            View Full Calendar <i class="fa-solid fa-calendar-days ml-1"></i>
                        </a>
                    </div>
                </div>

            </div>

            <!-- Floating Action Button -->
            <button class="fixed bottom-10 right-10 w-14 h-14 bg-brand-900 text-white rounded-full shadow-lg shadow-brand-900/30 flex items-center justify-center hover:bg-brand-800 hover:scale-105 transition-all z-50">
                <i class="fa-solid fa-plus text-xl"></i>
            </button>

        </main>
    </div>
</div>

</body>
</html>
