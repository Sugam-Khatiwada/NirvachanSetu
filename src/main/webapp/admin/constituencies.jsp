<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Constituency Management - NirvachanSetu</title>
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
                            900: '#142550',
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
            <a href="elections.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-check-to-slot w-5 h-5 mr-3 text-gray-400"></i>
                Elections
            </a>
            <!-- Active Menu Item: Constituencies -->
            <a href="constituencies.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-map-location-dot w-5 h-5 mr-3 text-blue-700"></i>
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
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search constituencies...">
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
                        <div class="text-sm font-bold text-brand-900 leading-tight">Admin Panel</div>
                        <div class="text-xs text-gray-500 mt-0.5">super_admin_01</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=11" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <main class="flex-1 overflow-y-auto p-8 relative">
            <div class="max-w-7xl mx-auto space-y-6 pb-8">

                <!-- Page Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <div class="flex items-center text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                            <span>MANAGEMENT</span>
                            <i class="fa-solid fa-chevron-right text-[8px] mx-2"></i>
                            <span class="text-brand-900">CONSTITUENCIES</span>
                        </div>
                        <h2 class="text-2xl font-bold text-brand-900 tracking-tight">Constituency Management</h2>
                        <p class="text-sm text-gray-500 mt-1">Manage geographic electoral boundaries and voter density distribution.</p>
                    </div>
                    <button class="px-5 py-2.5 bg-brand-900 hover:bg-[#0a152e] text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                        <i class="fa-solid fa-plus mr-2 text-white/80"></i> Add Constituency
                    </button>
                </div>

                <!-- Top Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <!-- Total Units -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-10 h-10 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center">
                                <i class="fa-solid fa-map text-lg"></i>
                            </div>
                            <span class="text-xs font-bold text-green-600">+2 New</span>
                        </div>
                        <div class="text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Total Units</div>
                        <div class="text-3xl font-bold text-brand-900">543</div>
                    </div>

                    <!-- Avg. Voter Count -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="flex justify-between items-start mb-4">
                            <div class="w-10 h-10 rounded-xl bg-orange-50 text-orange-600 flex items-center justify-center">
                                <i class="fa-solid fa-users text-lg"></i>
                            </div>
                        </div>
                        <div class="text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Avg. Voter Count</div>
                        <div class="text-3xl font-bold text-brand-900">1.2M</div>
                    </div>

                    <!-- Registration Status -->
                    <div class="md:col-span-2 bg-brand-900 rounded-2xl p-6 shadow-md text-white relative overflow-hidden flex flex-col justify-center">
                        <i class="fa-solid fa-certificate absolute -right-10 -bottom-10 text-9xl text-white opacity-5 transform -rotate-12"></i>
                        <div class="relative z-10">
                            <div class="text-[10px] font-bold text-blue-200 uppercase tracking-wider mb-2">REGISTRATION STATUS</div>
                            <div class="text-2xl font-bold text-white mb-4">94% Verification Complete</div>
                            <div class="w-full bg-blue-800 rounded-full h-2">
                                <div class="bg-white h-2 rounded-full" style="width: 94%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Constituency Directory Table -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="p-6 border-b border-gray-100 flex justify-between items-center">
                        <h3 class="text-base font-bold text-brand-900">Constituency Directory</h3>
                        <div class="flex space-x-3">
                            <button class="px-4 py-2 bg-gray-50 hover:bg-gray-100 text-gray-600 text-xs font-semibold rounded-lg transition-colors flex items-center border border-gray-200">
                                <i class="fa-solid fa-filter mr-2"></i> Filter
                            </button>
                            <button class="px-4 py-2 bg-gray-50 hover:bg-gray-100 text-gray-600 text-xs font-semibold rounded-lg transition-colors flex items-center border border-gray-200">
                                <i class="fa-solid fa-download mr-2"></i> Export
                            </button>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                            <tr class="bg-white border-b border-gray-100">
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">CONSTITUENCY NAME</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">REGION TYPE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">TOTAL VOTERS</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">REGISTERED CANDIDATES</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">STATUS</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                            <!-- Row 1 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded bg-blue-50 text-blue-700 font-bold text-xs flex items-center justify-center mr-4 border border-blue-100 flex-shrink-0">
                                            ND
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">New Delhi - Central</div>
                                            <div class="text-[11px] text-gray-500 mt-0.5">Code: DL-01</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Metropolitan</td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">1,452,089</div>
                                    <div class="text-[10px] font-bold text-green-600 mt-1">+0.8% YoY</div>
                                </td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex px-3 py-1.5 text-xs font-bold text-blue-800 bg-blue-100 rounded-full">
                                            12 Candidates
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center text-xs font-bold text-gray-900">
                                        <span class="w-2 h-2 rounded-full bg-green-500 mr-2 shadow-sm"></span> Active
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 2 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded bg-blue-50 text-blue-700 font-bold text-xs flex items-center justify-center mr-4 border border-blue-100 flex-shrink-0">
                                            WB
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Wayanad - South</div>
                                            <div class="text-[11px] text-gray-500 mt-0.5">Code: KL-12</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Semi-Urban</td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">892,441</div>
                                    <div class="text-[10px] font-bold text-green-600 mt-1">+1.2% YoY</div>
                                </td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex px-3 py-1.5 text-xs font-bold text-blue-800 bg-blue-100 rounded-full">
                                            8 Candidates
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center text-xs font-bold text-gray-900">
                                        <span class="w-2 h-2 rounded-full bg-green-500 mr-2 shadow-sm"></span> Active
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 3 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded bg-blue-50 text-blue-700 font-bold text-xs flex items-center justify-center mr-4 border border-blue-100 flex-shrink-0">
                                            LS
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Lucknow - East</div>
                                            <div class="text-[11px] text-gray-500 mt-0.5">Code: UP-24</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Urban</td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">2,110,750</div>
                                    <div class="text-[10px] font-bold text-gray-400 mt-1">+0.1% YoY</div>
                                </td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex px-3 py-1.5 text-xs font-bold text-blue-800 bg-blue-100 rounded-full">
                                            18 Candidates
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center text-xs font-bold text-gray-900">
                                        <span class="w-2 h-2 rounded-full bg-yellow-500 mr-2 shadow-sm"></span> Review Required
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 4 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 rounded bg-blue-50 text-blue-700 font-bold text-xs flex items-center justify-center mr-4 border border-blue-100 flex-shrink-0">
                                            BN
                                        </div>
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Bangalore - North</div>
                                            <div class="text-[11px] text-gray-500 mt-0.5">Code: KA-04</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Metropolitan</td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">2,890,201</div>
                                    <div class="text-[10px] font-bold text-green-600 mt-1">+2.4% YoY</div>
                                </td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex px-3 py-1.5 text-xs font-bold text-blue-800 bg-blue-100 rounded-full">
                                            15 Candidates
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center text-xs font-bold text-gray-900">
                                        <span class="w-2 h-2 rounded-full bg-green-500 mr-2 shadow-sm"></span> Active
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-5 border-t border-gray-100 flex justify-between items-center bg-gray-50/30">
                        <span class="text-xs font-medium text-gray-500">Showing <span class="font-bold text-gray-800">4</span> of <span class="font-bold text-gray-800">543</span> Constituencies</span>
                        <div class="flex space-x-1.5">
                            <button class="w-8 h-8 flex items-center justify-center border border-gray-200 text-gray-400 hover:text-gray-600 rounded bg-white transition-colors">
                                <i class="fa-solid fa-chevron-left text-[10px]"></i>
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center bg-brand-900 text-white font-bold text-xs rounded transition-colors">
                                1
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center border border-gray-200 text-gray-600 hover:bg-gray-50 font-bold text-xs rounded bg-white transition-colors">
                                2
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center border border-gray-200 text-gray-600 hover:bg-gray-50 font-bold text-xs rounded bg-white transition-colors">
                                3
                            </button>
                            <button class="w-8 h-8 flex items-center justify-center border border-gray-200 text-gray-600 hover:bg-gray-50 rounded bg-white transition-colors">
                                <i class="fa-solid fa-chevron-right text-[10px]"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Bottom Section: Map and Insights -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden flex flex-col md:flex-row">
                    <!-- Map Side -->
                    <div class="p-8 md:w-2/3 flex items-center">
                        <div class="w-40 h-40 bg-gray-600 rounded-xl mr-8 flex-shrink-0 relative overflow-hidden flex items-center justify-center text-white/50">
                            <!-- Placeholder for actual map image. Using a generic map shape visualization -->
                            <div class="absolute inset-0 opacity-40 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-gray-500 to-gray-700"></div>
                            <i class="fa-solid fa-map text-6xl relative z-10 opacity-30"></i>
                            <div class="absolute inset-0 flex items-center justify-center z-20">
                                <i class="fa-solid fa-location-dot text-brand-900 text-3xl drop-shadow-md"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="text-base font-bold text-brand-900 mb-2">Geographic Integrity Check</h3>
                            <p class="text-xs text-gray-500 leading-relaxed mb-4 max-w-md">Run an automated audit to ensure no overlapping boundaries between neighboring constituencies.</p>
                            <button class="text-xs font-bold text-brand-900 hover:text-brand-700 uppercase tracking-wider flex items-center transition-colors">
                                START BOUNDARY AUDIT <i class="fa-solid fa-arrow-right ml-2 text-[10px]"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Insights Side -->
                    <div class="p-8 md:w-1/3 bg-gray-50/50 border-t md:border-t-0 md:border-l border-gray-100">
                        <h3 class="text-sm font-bold text-brand-900 mb-4">Quick Insights</h3>
                        <ul class="space-y-3">
                            <li class="flex items-start">
                                <span class="w-2 h-2 rounded-full bg-blue-600 mt-1.5 mr-3 flex-shrink-0"></span>
                                <span class="text-xs font-medium text-gray-700">85% Digital Roll Conversion</span>
                            </li>
                            <li class="flex items-start">
                                <span class="w-2 h-2 rounded-full bg-red-900 mt-1.5 mr-3 flex-shrink-0"></span>
                                <span class="text-xs font-medium text-gray-700">12 Pending Delimitations</span>
                            </li>
                            <li class="flex items-start">
                                <span class="w-2 h-2 rounded-full bg-blue-500 mt-1.5 mr-3 flex-shrink-0"></span>
                                <span class="text-xs font-medium text-gray-700">All Master Data Synced</span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </main>
    </div>
</div>

</body>
</html>
