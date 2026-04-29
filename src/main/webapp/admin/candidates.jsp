<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Management - NirvachanSetu</title>
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
                            900: '#0a1930',
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
            <a href="dashboard.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-border-all w-5 h-5 mr-3 text-gray-400 group-hover:text-gray-600"></i>
                Dashboard
            </a>
            <a href="users.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-users w-5 h-5 mr-3 text-gray-400"></i>
                Users
            </a>
            <!-- Active Menu Item: Candidates -->
            <a href="candidates.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-user-tie w-5 h-5 mr-3 text-blue-700"></i>
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
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search applications...">
                </div>
            </div>

            <!-- Right Actions -->
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
                        <div class="text-xs text-gray-500 mt-0.5">System Overseer</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=11" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <main class="flex-1 overflow-y-auto p-8 relative">
            <div class="max-w-7xl mx-auto space-y-6 pb-12">

                <!-- Page Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="text-2xl font-bold text-brand-900 tracking-tight">Candidate Management</h2>
                        <p class="text-sm text-gray-600 mt-1">Review and manage official application filings for the 2024 General Elections.</p>
                    </div>
                    <div class="flex space-x-3">
                        <button class="px-4 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-semibold rounded-lg transition-colors flex items-center shadow-sm">
                            <i class="fa-solid fa-filter mr-2 text-gray-500"></i> Filters
                        </button>
                        <button class="px-5 py-2.5 bg-brand-900 hover:bg-[#081325] text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                            <i class="fa-solid fa-plus mr-2 text-white/80"></i> New Nomination
                        </button>
                    </div>
                </div>

                <!-- Stat Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <!-- Total Applications -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-500 uppercase tracking-wider mb-2">TOTAL APPLICATIONS</div>
                        <div class="text-3xl font-bold text-brand-900 mb-2">1,284</div>
                        <div class="text-xs font-semibold text-green-600 flex items-center">
                            <i class="fa-solid fa-arrow-trend-up mr-1.5"></i> +12% from last week
                        </div>
                    </div>

                    <!-- Pending Review -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-500 uppercase tracking-wider mb-2">PENDING REVIEW</div>
                        <div class="text-3xl font-bold text-orange-700 mb-2">42</div>
                        <div class="text-xs font-semibold text-orange-700 flex items-center">
                            <i class="fa-regular fa-clock mr-1.5"></i> Requires immediate action
                        </div>
                    </div>

                    <!-- Approved -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-500 uppercase tracking-wider mb-2">APPROVED</div>
                        <div class="text-3xl font-bold text-blue-700 mb-2">1,192</div>
                        <div class="text-xs font-semibold text-gray-500 flex items-center">
                            <i class="fa-solid fa-check mr-1.5 text-gray-400"></i> Verified & Finalized
                        </div>
                    </div>

                    <!-- Rejected -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-500 uppercase tracking-wider mb-2">REJECTED</div>
                        <div class="text-3xl font-bold text-red-600 mb-2">50</div>
                        <div class="text-xs font-semibold text-red-600 flex items-center">
                            <i class="fa-solid fa-triangle-exclamation mr-1.5"></i> Documentation issues
                        </div>
                    </div>
                </div>

                <!-- Recent Applications Table -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="p-6 border-b border-gray-100 flex justify-between items-center bg-white">
                        <h3 class="text-base font-bold text-brand-900">Recent Applications</h3>
                        <div class="flex items-center text-sm">
                            <span class="text-gray-500 mr-2 text-xs">Sort by:</span>
                            <button class="font-semibold text-brand-900 flex items-center text-xs hover:text-brand-700">
                                Latest Submission <i class="fa-solid fa-chevron-down ml-1.5 text-[10px] text-gray-400"></i>
                            </button>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                            <tr class="bg-white border-b border-gray-100">
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">CANDIDATE DETAILS</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">CONSTITUENCY</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">APPLIED DATE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">STATUS</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider text-right">ACTIONS</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                            <!-- Row 1 -->
                            <tr class="hover:bg-gray-50/50 transition-colors group">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=1" alt="Avatar" class="w-11 h-11 rounded-lg mr-4 border border-gray-200 object-cover shadow-sm">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Dr. Aruna Sharma</div>
                                            <div class="text-[11px] text-gray-500 mt-1">Independent • 15 years exp.</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">North Delhi Central</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">ZONE-04</div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Oct 12,<br>2023</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-3 py-1.5 text-[11px] font-bold text-yellow-800 bg-yellow-100 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-yellow-500 mr-2 shadow-sm"></span> Pending Review
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center justify-end space-x-3">
                                        <button class="text-brand-900 hover:text-brand-700 bg-blue-50 p-2 rounded transition-colors" title="View Document">
                                            <i class="fa-solid fa-file-lines text-sm"></i>
                                        </button>
                                        <button class="px-4 py-2 bg-blue-100 text-blue-700 hover:bg-blue-200 text-xs font-bold rounded transition-colors">
                                            Approve
                                        </button>
                                        <button class="text-red-500 hover:text-red-700 p-2 rounded hover:bg-red-50 transition-colors" title="Reject">
                                            <i class="fa-solid fa-xmark text-lg"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 2 -->
                            <tr class="hover:bg-gray-50/50 transition-colors group">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=11" alt="Avatar" class="w-11 h-11 rounded-lg mr-4 border border-gray-200 object-cover shadow-sm">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Vikram Malhotra</div>
                                            <div class="text-[11px] text-gray-500 mt-1">People's Front Party</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">South Mumbai</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">ZONE-01</div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Oct 10,<br>2023</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-3 py-1.5 text-[11px] font-bold text-green-700 bg-green-100 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 mr-2 shadow-sm"></span> Approved
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="px-4 py-2 bg-gray-100 text-gray-600 hover:bg-gray-200 text-xs font-bold rounded transition-colors">
                                        View Details
                                    </button>
                                </td>
                            </tr>

                            <!-- Row 3 -->
                            <tr class="hover:bg-gray-50/50 transition-colors group">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=5" alt="Avatar" class="w-11 h-11 rounded-lg mr-4 border border-gray-200 object-cover shadow-sm">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Sanya Verma</div>
                                            <div class="text-[11px] text-gray-500 mt-1">Social Justice Alliance</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">Bangalore East</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">ZONE-09</div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Oct 09,<br>2023</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-3 py-1.5 text-[11px] font-bold text-red-700 bg-red-100 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-red-500 mr-2 shadow-sm"></span> Rejected
                                        </span>
                                </td>
                                <td class="px-6 py-5 text-right">
                                    <button class="px-4 py-2 bg-gray-100 text-gray-600 hover:bg-gray-200 text-xs font-bold rounded transition-colors">
                                        View Reason
                                    </button>
                                </td>
                            </tr>

                            <!-- Row 4 -->
                            <tr class="hover:bg-gray-50/50 transition-colors group">
                                <td class="px-6 py-5">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=52" alt="Avatar" class="w-11 h-11 rounded-lg mr-4 border border-gray-200 object-cover shadow-sm">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Rajesh Gokhale</div>
                                            <div class="text-[11px] text-gray-500 mt-1">National Heritage Party</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="text-sm font-bold text-brand-900">Pune West</div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mt-1">ZONE-02</div>
                                </td>
                                <td class="px-6 py-5 text-sm text-gray-600 font-medium">Oct 08,<br>2023</td>
                                <td class="px-6 py-5">
                                        <span class="inline-flex items-center px-3 py-1.5 text-[11px] font-bold text-yellow-800 bg-yellow-100 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-yellow-500 mr-2 shadow-sm"></span> Pending Review
                                        </span>
                                </td>
                                <td class="px-6 py-5">
                                    <div class="flex items-center justify-end space-x-3">
                                        <button class="text-brand-900 hover:text-brand-700 bg-blue-50 p-2 rounded transition-colors" title="View Document">
                                            <i class="fa-solid fa-file-lines text-sm"></i>
                                        </button>
                                        <button class="px-4 py-2 bg-blue-100 text-blue-700 hover:bg-blue-200 text-xs font-bold rounded transition-colors">
                                            Approve
                                        </button>
                                        <button class="text-red-500 hover:text-red-700 p-2 rounded hover:bg-red-50 transition-colors" title="Reject">
                                            <i class="fa-solid fa-xmark text-lg"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-5 border-t border-gray-100 flex justify-between items-center bg-gray-50/30">
                        <span class="text-xs font-bold text-gray-500">Showing 1-10 of 1,284 candidates</span>
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

                <!-- Footer -->
                <div class="text-center mt-10">
                    <p class="text-[9px] font-bold text-gray-400 uppercase tracking-widest">© 2024 ELECTION COMMISSION MANAGEMENT PORTAL • NIRVACHANSETU</p>
                </div>

            </div>
        </main>
    </div>
</div>

</body>
</html>
