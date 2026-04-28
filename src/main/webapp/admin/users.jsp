<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - NirvachanSetu</title>
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
                            900: '#0a1930', // Slightly darker blue for the new UI style
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
            <!-- Active Menu Item: Users -->
            <a href="users.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-users w-5 h-5 mr-3 text-blue-700"></i>
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
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search voters...">
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
                        <div class="text-sm font-bold text-brand-900 leading-tight">Admin User</div>
                        <div class="text-xs text-gray-500 mt-0.5">ECI Official</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=12" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <main class="flex-1 overflow-y-auto p-8">
            <div class="max-w-7xl mx-auto space-y-6">

                <!-- Page Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="text-2xl font-bold text-brand-900 tracking-tight">User Management</h2>
                        <p class="text-sm text-gray-500 mt-1">Review and manage voter registrations across constituencies.</p>
                    </div>
                    <div class="flex space-x-3">
                        <button class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-semibold rounded-lg transition-colors flex items-center">
                            <i class="fa-solid fa-filter mr-2 text-gray-500"></i> Filter
                        </button>
                        <button class="px-4 py-2 bg-brand-900 hover:bg-[#081325] text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                            <i class="fa-solid fa-user-plus mr-2 text-white/80"></i> New Voter
                        </button>
                    </div>
                </div>

                <!-- Stat Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <!-- Total Voters -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2">TOTAL VOTERS</div>
                        <div class="flex items-end space-x-3">
                            <div class="text-3xl font-bold text-brand-900">1,284,092</div>
                            <div class="text-sm font-semibold text-green-500 mb-1 flex items-center">
                                <i class="fa-solid fa-arrow-up mr-1 text-[10px]"></i> 12%
                            </div>
                        </div>
                    </div>

                    <!-- Pending Review -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2">PENDING REVIEW</div>
                        <div class="flex items-end space-x-3">
                            <div class="text-3xl font-bold text-brand-900">4,392</div>
                            <div class="text-sm font-semibold text-orange-500 mb-1 flex items-center">
                                <i class="fa-solid fa-exclamation mr-1 text-[10px]"></i> High
                            </div>
                        </div>
                    </div>

                    <!-- Approved Today -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2">APPROVED TODAY</div>
                        <div class="flex items-end space-x-3">
                            <div class="text-3xl font-bold text-brand-900">842</div>
                            <div class="text-sm font-medium text-blue-500 mb-1">
                                Syncing...
                            </div>
                        </div>
                    </div>

                    <!-- Verification Rate -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 relative overflow-hidden">
                        <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2">VERIFICATION RATE</div>
                        <div class="flex items-center space-x-4">
                            <div class="text-3xl font-bold text-brand-900">98.4%</div>
                            <div class="flex-1">
                                <div class="w-full bg-gray-100 rounded-full h-2">
                                    <div class="bg-brand-900 h-2 rounded-full" style="width: 98.4%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Registrations Table -->
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="p-6 border-b border-gray-100 flex justify-between items-center">
                        <h3 class="text-base font-bold text-brand-900">Recent Registrations</h3>
                        <div class="flex items-center text-sm text-gray-500">
                            <span class="mr-3">Page 1 of 42</span>
                            <div class="flex space-x-1">
                                <button class="w-7 h-7 flex items-center justify-center text-gray-400 hover:text-gray-600 hover:bg-gray-50 rounded transition-colors disabled:opacity-50">
                                    <i class="fa-solid fa-chevron-left text-[10px]"></i>
                                </button>
                                <button class="w-7 h-7 flex items-center justify-center text-gray-400 hover:text-gray-600 hover:bg-gray-50 rounded transition-colors">
                                    <i class="fa-solid fa-chevron-right text-[10px]"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                            <tr class="bg-white">
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">VOTER NAME</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">REGISTRATION DATE</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider">STATUS</th>
                                <th class="px-6 py-4 text-[10px] font-bold text-gray-400 uppercase tracking-wider text-right">ACTIONS</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                            <!-- Row 1 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=33" alt="Avatar" class="w-10 h-10 rounded-full mr-4 border border-gray-100 object-cover">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Arjun Sharma</div>
                                            <div class="text-xs text-gray-500 mt-0.5 font-medium">ID: #VX-920412</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600 font-medium">Oct 24, 2023</td>
                                <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-green-700 bg-green-50 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 mr-1.5"></span> Approved
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <!-- No actions for approved -->
                                </td>
                            </tr>

                            <!-- Row 2 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=47" alt="Avatar" class="w-10 h-10 rounded-full mr-4 border border-gray-100 object-cover">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Meera Deshmukh</div>
                                            <div class="text-xs text-gray-500 mt-0.5 font-medium">ID: #VX-920415</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600 font-medium">Oct 26, 2023</td>
                                <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-orange-700 bg-orange-50 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-orange-500 mr-1.5"></span> Pending
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <div class="flex items-center justify-end space-x-2">
                                        <button class="px-3 py-1.5 bg-green-600 hover:bg-green-700 text-white text-xs font-semibold rounded-md transition-colors shadow-sm">
                                            Approve
                                        </button>
                                        <button class="px-3 py-1.5 bg-red-50 text-red-600 hover:bg-red-100 text-xs font-semibold rounded-md transition-colors">
                                            Reject
                                        </button>
                                        <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors flex items-center justify-center">
                                            <i class="fa-solid fa-ellipsis-vertical text-sm"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 3 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=5" alt="Avatar" class="w-10 h-10 rounded-full mr-4 border border-gray-100 object-cover">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Priya Iyer</div>
                                            <div class="text-xs text-gray-500 mt-0.5 font-medium">ID: #VX-920419</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600 font-medium">Oct 27, 2023</td>
                                <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-green-700 bg-green-50 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 mr-1.5"></span> Approved
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                </td>
                            </tr>

                            <!-- Row 4 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=11" alt="Avatar" class="w-10 h-10 rounded-full mr-4 border border-gray-100 object-cover">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Rahul Verma</div>
                                            <div class="text-xs text-gray-500 mt-0.5 font-medium">ID: #VX-920422</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600 font-medium">Oct 28, 2023</td>
                                <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-orange-700 bg-orange-50 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-orange-500 mr-1.5"></span> Pending
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <div class="flex items-center justify-end space-x-2">
                                        <button class="px-3 py-1.5 bg-green-600 hover:bg-green-700 text-white text-xs font-semibold rounded-md transition-colors shadow-sm">
                                            Approve
                                        </button>
                                        <button class="px-3 py-1.5 bg-red-50 text-red-600 hover:bg-red-100 text-xs font-semibold rounded-md transition-colors">
                                            Reject
                                        </button>
                                        <button class="w-8 h-8 text-gray-400 hover:text-gray-600 rounded-full transition-colors flex items-center justify-center">
                                            <i class="fa-solid fa-ellipsis-vertical text-sm"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                            <!-- Row 5 -->
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <img src="https://i.pravatar.cc/150?img=12" alt="Avatar" class="w-10 h-10 rounded-full mr-4 border border-gray-100 object-cover">
                                        <div>
                                            <div class="text-sm font-bold text-brand-900">Sanjay Gupta</div>
                                            <div class="text-xs text-gray-500 mt-0.5 font-medium">ID: #VX-920425</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600 font-medium">Oct 29, 2023</td>
                                <td class="px-6 py-4">
                                        <span class="inline-flex items-center px-2.5 py-1 text-[10px] font-bold text-green-700 bg-green-50 rounded-full">
                                            <span class="w-1.5 h-1.5 rounded-full bg-green-500 mr-1.5"></span> Approved
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-4 border-t border-gray-100 flex justify-between items-center bg-gray-50/30">
                        <span class="text-xs font-medium text-gray-500">Showing 1-5 of 210 registrations</span>
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

            </div>
        </main>
    </div>
</div>

</body>
</html>
