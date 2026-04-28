<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elections Gallery - NirvachanSetu</title>
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
                            900: '#0f2042',
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        ::-webkit-scrollbar { width: 6px; height: 6px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
    </style>
</head>
<body class="bg-[#f8fafc] text-gray-800 font-sans antialiased overflow-hidden">

<div class="flex h-screen w-full">
    <!-- Sidebar -->
    <aside class="w-64 bg-white border-r border-gray-200 flex flex-col flex-shrink-0">
        <div class="h-16 flex items-center px-6 border-b border-gray-100">
            <div class="w-8 h-8 bg-brand-900 rounded flex items-center justify-center mr-3 text-white">
                <i class="fa-solid fa-building-columns text-sm"></i>
            </div>
            <div>
                <h1 class="text-brand-900 font-bold text-lg leading-tight">NirvachanSetu</h1>
                <p class="text-[9px] text-gray-500 font-bold tracking-wider uppercase">Election Management</p>
            </div>
        </div>

        <nav class="flex-1 py-6 px-4 space-y-1.5 overflow-y-auto">
            <a href="dashboard.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-border-all w-5 h-5 mr-3 text-gray-400 group-hover:text-gray-600"></i>
                Dashboard
            </a>
            <a href="users.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-users w-5 h-5 mr-3 text-gray-400"></i>
                Users
            </a>
            <a href="candidates.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-user-tie w-5 h-5 mr-3 text-gray-400"></i>
                Candidates
            </a>
            <!-- Active Menu Item: Elections -->
            <a href="elections.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-check-to-slot w-5 h-5 mr-3 text-blue-700"></i>
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
        <header class="h-16 bg-white flex items-center justify-between px-8 z-10 flex-shrink-0">
            <div class="flex-1 flex">
                <div class="relative w-full max-w-md">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <i class="fa-solid fa-magnifying-glass text-gray-400 text-sm"></i>
                    </div>
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search elections, phases, or IDs...">
                </div>
            </div>

            <div class="flex items-center space-x-6">
                <button class="text-gray-400 hover:text-gray-600 relative transition-colors">
                    <i class="fa-solid fa-bell text-[1.1rem]"></i>
                    <span class="absolute -top-0.5 -right-0.5 block h-2 w-2 rounded-full bg-red-500 ring-2 ring-white"></span>
                </button>
                <button class="text-gray-400 hover:text-gray-600 transition-colors">
                    <i class="fa-solid fa-gear text-[1.1rem]"></i>
                </button>

                <div class="h-8 w-px bg-gray-200"></div>

                <div class="flex items-center cursor-pointer">
                    <div class="mr-3 text-right">
                        <div class="text-sm font-bold text-brand-900 leading-tight">Admin Console</div>
                        <div class="text-xs text-gray-500 mt-0.5">ECI Super Admin</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=11" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <main class="flex-1 overflow-y-auto p-8">
            <div class="max-w-7xl mx-auto space-y-6 pb-8">

                <!-- Page Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="text-2xl font-bold text-brand-900 tracking-tight">Elections Gallery</h2>
                        <p class="text-sm text-gray-500 mt-1">Manage and monitor national and regional electoral cycles.</p>
                    </div>
                    <button class="px-5 py-2.5 bg-brand-900 hover:bg-[#0a152e] text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                        <i class="fa-solid fa-plus mr-2 text-white/80"></i> Create New Election
                    </button>
                </div>

                <!-- Top Cards -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Ongoing Phase Card -->
                    <div class="lg:col-span-2 bg-white rounded-2xl p-8 shadow-sm border border-gray-100 relative overflow-hidden flex items-center">
                        <div class="flex-1">
                            <div class="text-[10px] font-bold text-blue-500 uppercase tracking-wider mb-2">ONGOING PHASE</div>
                            <h3 class="text-2xl font-bold text-brand-900 mb-6">General Elections 2024: Phase 4</h3>

                            <div class="flex space-x-12">
                                <div>
                                    <div class="text-3xl font-bold text-brand-900">128M</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">REGISTERED VOTERS</div>
                                </div>
                                <div>
                                    <div class="text-3xl font-bold text-brand-900">96k</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">POLLING BOOTHS</div>
                                </div>
                            </div>
                        </div>

                        <!-- Background Circle & Icon -->
                        <div class="absolute right-0 top-0 bottom-0 w-64 bg-blue-50/50 rounded-l-full flex items-center justify-center translate-x-10">
                            <div class="w-20 h-20 bg-white rounded-2xl shadow-sm border border-blue-100 flex items-center justify-center text-brand-600">
                                <i class="fa-solid fa-chart-simple text-3xl"></i>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Stats Card -->
                    <div class="bg-brand-900 rounded-2xl p-8 shadow-md text-white relative overflow-hidden flex flex-col justify-center">
                        <div class="absolute -right-10 -bottom-10 w-40 h-40 bg-white opacity-5 rounded-full"></div>
                        <div class="text-[10px] font-bold text-blue-200 uppercase tracking-wider mb-6 relative z-10">QUICK STATS</div>

                        <div class="space-y-4 relative z-10">
                            <div class="flex justify-between items-center border-b border-blue-800/50 pb-4">
                                <span class="text-sm text-blue-100 font-medium">Active Elections</span>
                                <span class="text-2xl font-bold text-white">04</span>
                            </div>
                            <div class="flex justify-between items-center border-b border-blue-800/50 pb-4">
                                <span class="text-sm text-blue-100 font-medium">Scheduled</span>
                                <span class="text-2xl font-bold text-white">12</span>
                            </div>
                            <div class="flex justify-between items-center">
                                <span class="text-sm text-blue-100 font-medium">Completed YTD</span>
                                <span class="text-2xl font-bold text-white">08</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Election Schedules Table -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="p-6 border-b border-gray-100 flex justify-between items-center">
                        <h3 class="text-base font-bold text-brand-900">Election Schedules</h3>
                        <div class="flex space-x-2">
                            <button class="w-9 h-9 flex items-center justify-center border border-gray-200 text-gray-500 hover:text-gray-700 hover:bg-gray-50 rounded-lg transition-colors">
                                <i class="fa-solid fa-filter text-sm"></i>
                            </button>
                            <button class="w-9 h-9 flex items-center justify-center border border-gray-200 text-gray-500 hover:text-gray-700 hover:bg-gray-50 rounded-lg transition-colors">
                                <i class="fa-solid fa-download text-sm"></i>
                            </button>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                            <tr class="bg-white border-b border-gray-100">
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">TITLE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">START DATE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">END DATE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">STATUS</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider text-right">ACTIONS</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                            <!-- Row 1 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded-full bg-blue-50 text-blue-600 flex items-center justify-center mr-4 shadow-sm border border-blue-100">
                                            <i class="fa-solid fa-earth-americas text-sm"></i>
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900 leading-tight">General Assembly Elections<br>2024</div>
                                            <div class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">ID: ECI-GE-2024-ND</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">April 19,<br>2024</td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">June 01,<br>2024</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-blue-700 bg-blue-100 rounded uppercase tracking-wider">
                                            Ongoing
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors inline-flex items-center justify-center">
                                        <i class="fa-solid fa-ellipsis-vertical"></i>
                                    </button>
                                </td>
                            </tr>

                            <!-- Row 2 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded-full bg-orange-50 text-orange-600 flex items-center justify-center mr-4 shadow-sm border border-orange-100">
                                            <i class="fa-solid fa-building-columns text-sm"></i>
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900 leading-tight">State Legislature:<br>Maharashtra</div>
                                            <div class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">ID: ECI-SL-2024-MH</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Oct 15, 2024</td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Nov 20,<br>2024</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-orange-700 bg-orange-100 rounded uppercase tracking-wider">
                                            Upcoming
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors inline-flex items-center justify-center">
                                        <i class="fa-solid fa-ellipsis-vertical"></i>
                                    </button>
                                </td>
                            </tr>

                            <!-- Row 3 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded-full bg-green-50 text-green-600 flex items-center justify-center mr-4 shadow-sm border border-green-100">
                                            <i class="fa-solid fa-building text-sm"></i>
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900 leading-tight">Municipal Corporation:<br>Bangalore</div>
                                            <div class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">ID: ECI-MC-2023-KA</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Dec 10,<br>2023</td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Dec 28,<br>2023</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-green-700 bg-green-100 rounded uppercase tracking-wider">
                                            Completed
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors inline-flex items-center justify-center">
                                        <i class="fa-solid fa-ellipsis-vertical"></i>
                                    </button>
                                </td>
                            </tr>

                            <!-- Row 4 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded-full bg-orange-50 text-orange-600 flex items-center justify-center mr-4 shadow-sm border border-orange-100">
                                            <i class="fa-solid fa-building-columns text-sm"></i>
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900 leading-tight">By-Elections: Kerala District 4</div>
                                            <div class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">ID: ECI-BY-2024-KL</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Sept 05,<br>2024</td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Sept 08,<br>2024</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-orange-700 bg-orange-100 rounded uppercase tracking-wider">
                                            Upcoming
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors inline-flex items-center justify-center">
                                        <i class="fa-solid fa-ellipsis-vertical"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-5 border-t border-gray-100 flex justify-between items-center bg-gray-50/30">
                        <span class="text-xs font-medium text-gray-500">Showing <span class="font-bold text-gray-800">4</span> of <span class="font-bold text-gray-800">24</span> elections</span>
                        <div class="flex space-x-2">
                            <button class="px-4 py-2 border border-gray-200 text-gray-600 text-xs font-semibold rounded-lg hover:bg-gray-50 transition-colors bg-white">
                                Previous
                            </button>
                            <button class="px-4 py-2 border border-gray-200 text-gray-600 text-xs font-semibold rounded-lg hover:bg-gray-50 transition-colors bg-white">
                                Next
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Bottom Info Cards -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 pt-2">
                    <!-- Smart Scheduling -->
                    <div class="bg-blue-50/50 rounded-2xl p-6 border border-blue-100 flex items-start">
                        <div class="w-10 h-10 rounded-xl bg-white text-blue-600 flex items-center justify-center shadow-sm mr-4 flex-shrink-0">
                            <i class="fa-solid fa-wand-magic-sparkles"></i>
                        </div>
                        <div>
                            <h4 class="text-sm font-bold text-brand-900 mb-1">Smart Scheduling</h4>
                            <p class="text-[11px] text-gray-600 leading-relaxed">The system automatically avoids religious and public holidays for polling dates based on regional calendars.</p>
                        </div>
                    </div>

                    <!-- Integrity Checks -->
                    <div class="bg-orange-50/50 rounded-2xl p-6 border border-orange-100 flex items-start">
                        <div class="w-10 h-10 rounded-xl bg-white text-orange-600 flex items-center justify-center shadow-sm mr-4 flex-shrink-0">
                            <i class="fa-solid fa-shield-check"></i>
                        </div>
                        <div>
                            <h4 class="text-sm font-bold text-brand-900 mb-1">Integrity Checks</h4>
                            <p class="text-[11px] text-gray-600 leading-relaxed">All election metadata is immutable once the notification is gazetted and pushed to blockchain nodes.</p>
                        </div>
                    </div>

                    <!-- Resource Archive -->
                    <div class="bg-indigo-50/50 rounded-2xl p-6 border border-indigo-100 flex items-start">
                        <div class="w-10 h-10 rounded-xl bg-white text-indigo-600 flex items-center justify-center shadow-sm mr-4 flex-shrink-0">
                            <i class="fa-solid fa-file-invoice"></i>
                        </div>
                        <div>
                            <h4 class="text-sm font-bold text-brand-900 mb-1">Resource Archive</h4>
                            <p class="text-[11px] text-gray-600 leading-relaxed">Past election data, including voter turnout and constituency maps, are available in the centralized archive.</p>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </div>
</div>

</body>
</html>
