<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results Analytics - NirvachanSetu</title>
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
        
        /* Simple bar chart animations */
        @keyframes growUp {
            from { height: 0; }
            to { height: var(--h); }
        }
        .bar-animate {
            animation: growUp 1s ease-out forwards;
        }
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
            <a href="constituencies.jsp" class="flex items-center px-4 py-2.5 text-sm font-medium rounded-lg text-gray-600 hover:bg-gray-50 hover:text-gray-900 transition-colors">
                <i class="fa-solid fa-map-location-dot w-5 h-5 mr-3 text-gray-400"></i>
                Constituencies
            </a>
            <!-- Active Menu Item: Results -->
            <a href="results.jsp" class="flex items-center px-4 py-2.5 text-sm font-semibold rounded-lg bg-blue-50 text-blue-700">
                <i class="fa-solid fa-chart-simple w-5 h-5 mr-3 text-blue-700"></i>
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
                    <input type="text" class="block w-full pl-10 pr-3 py-2.5 border-none rounded-xl text-sm bg-gray-100 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-brand-500 focus:bg-white transition-all" placeholder="Search elections, candidates or results...">
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
                        <div class="text-sm font-bold text-brand-900 leading-tight">Admin User</div>
                        <div class="text-[10px] font-medium text-gray-500 mt-0.5">Chief Commissioner</div>
                    </div>
                    <img class="h-9 w-9 rounded-full object-cover border border-gray-200" src="https://i.pravatar.cc/150?img=12" alt="Admin Avatar">
                </div>
            </div>
        </header>

        <main class="flex-1 overflow-y-auto p-8 relative">
            <div class="max-w-7xl mx-auto space-y-6 pb-16">
                
                <!-- Page Header -->
                <div class="flex justify-between items-end">
                    <div>
                        <h2 class="text-2xl font-bold text-brand-900 tracking-tight">Results Analytics</h2>
                        <p class="text-sm text-gray-500 mt-1">Real-time voting metrics and candidate ranking for General Election 2024</p>
                    </div>
                    <div class="flex space-x-3">
                        <button class="px-4 py-2.5 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-semibold rounded-lg transition-colors flex items-center shadow-sm">
                            <i class="fa-solid fa-filter mr-2 text-gray-500"></i> Filter View
                        </button>
                        <button class="px-5 py-2.5 bg-brand-900 hover:bg-[#0a152e] text-white text-sm font-semibold rounded-lg transition-colors shadow-sm flex items-center">
                            <i class="fa-solid fa-download mr-2 text-white/80"></i> Export Report
                        </button>
                    </div>
                </div>

                <!-- Top Section -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Total Vote Counts Chart (2/3 width) -->
                    <div class="lg:col-span-2 bg-white rounded-2xl shadow-sm border border-gray-100 p-6 flex flex-col relative overflow-hidden">
                        <div class="flex justify-between items-start mb-8 relative z-10">
                            <div>
                                <h3 class="text-lg font-bold text-brand-900">Total Vote Counts per Election</h3>
                                <p class="text-xs text-gray-500 mt-1">Comparing turnout across major active election cycles</p>
                            </div>
                            <div class="flex bg-gray-100 rounded-lg p-1">
                                <button class="px-4 py-1.5 bg-white text-brand-900 text-xs font-bold rounded shadow-sm">Volume</button>
                                <button class="px-4 py-1.5 text-gray-500 hover:text-gray-700 text-xs font-bold rounded">Percentage</button>
                            </div>
                        </div>

                        <!-- Chart Area Placeholder with CSS Bars -->
                        <div class="flex-1 flex flex-col justify-end min-h-[220px] relative z-10 border-b border-gray-100 pb-2">
                            <!-- Background Grid Lines -->
                            <div class="absolute inset-0 flex flex-col justify-between pt-4 pb-2 z-0">
                                <div class="border-t border-gray-50 w-full h-0"></div>
                                <div class="border-t border-gray-50 w-full h-0"></div>
                                <div class="border-t border-gray-50 w-full h-0"></div>
                                <div class="border-t border-gray-50 w-full h-0"></div>
                                <div class="border-t border-gray-50 w-full h-0"></div>
                            </div>
                            
                            <!-- Bars -->
                            <div class="flex justify-between items-end px-4 z-10">
                                <div class="w-10 bg-blue-200 rounded-t-sm bar-animate" style="--h: 75%;"></div>
                                <div class="w-10 bg-blue-300 rounded-t-sm bar-animate" style="--h: 60%;"></div>
                                <div class="w-10 bg-brand-900 rounded-t-sm bar-animate" style="--h: 90%;"></div>
                                <div class="w-10 bg-blue-100 rounded-t-sm bar-animate" style="--h: 40%;"></div>
                                <div class="w-10 bg-blue-400 rounded-t-sm bar-animate" style="--h: 85%;"></div>
                            </div>
                            
                            <!-- Labels -->
                            <div class="flex justify-between text-[9px] font-bold text-gray-400 uppercase tracking-wider text-center mt-3 z-10">
                                <div class="w-20">NATIONAL<br>ASSEMBLY</div>
                                <div class="w-20">STATE<br>COUNCIL</div>
                                <div class="w-20">LOCAL GOV '24</div>
                                <div class="w-20">SENATE BY-<br>ELECTION</div>
                                <div class="w-20">PROVINCIAL<br>NORTH</div>
                            </div>
                        </div>

                        <!-- Bottom Stats -->
                        <div class="mt-6 flex justify-between items-end relative z-10">
                            <div class="flex space-x-12">
                                <div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">TOTAL REGISTERED</div>
                                    <div class="text-2xl font-bold text-brand-900">4,572,109</div>
                                </div>
                                <div>
                                    <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">ACTIVE TURNOUT</div>
                                    <div class="text-2xl font-bold text-brand-900">72.4%</div>
                                </div>
                            </div>
                            <div class="px-3 py-1.5 bg-blue-50 text-blue-700 text-xs font-bold rounded-lg flex items-center">
                                <i class="fa-solid fa-clock-rotate-left mr-2"></i> Updated 2 mins ago
                            </div>
                        </div>
                    </div>

                    <!-- Candidate Ranking (1/3 width) -->
                    <div class="bg-white rounded-2xl shadow-sm border border-gray-100 flex flex-col overflow-hidden relative">
                        <div class="p-6 border-b border-gray-50 bg-white">
                            <h3 class="text-lg font-bold text-brand-900">Candidate Ranking</h3>
                            <p class="text-xs text-gray-500 mt-1">Constituency: Central District-A</p>
                        </div>
                        
                        <div class="flex-1 p-6 space-y-6">
                            <!-- Rank 1 -->
                            <div class="flex items-center">
                                <div class="w-8 h-8 rounded-full bg-blue-100 text-blue-700 font-bold text-sm flex items-center justify-center mr-4 flex-shrink-0">1</div>
                                <img src="https://i.pravatar.cc/150?img=11" alt="Candidate" class="w-10 h-10 rounded-lg object-cover mr-3 border border-gray-200">
                                <div class="flex-1 min-w-0">
                                    <div class="flex justify-between items-baseline mb-1">
                                        <div class="text-sm font-bold text-brand-900 truncate">Dr. Arshad Khan</div>
                                        <div class="text-sm font-bold text-brand-900">42.8%</div>
                                    </div>
                                    <div class="text-[10px] text-gray-500 mb-1.5 truncate">Progressive Party</div>
                                    <div class="w-full bg-gray-100 rounded-full h-1.5">
                                        <div class="bg-brand-900 h-1.5 rounded-full" style="width: 42.8%"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Rank 2 -->
                            <div class="flex items-center">
                                <div class="w-8 h-8 rounded-full text-gray-400 font-bold text-sm flex items-center justify-center mr-4 flex-shrink-0">2</div>
                                <img src="https://i.pravatar.cc/150?img=5" alt="Candidate" class="w-10 h-10 rounded-lg object-cover mr-3 border border-gray-200">
                                <div class="flex-1 min-w-0">
                                    <div class="flex justify-between items-baseline mb-1">
                                        <div class="text-sm font-bold text-brand-900 truncate">Elena Rodriguez</div>
                                        <div class="text-sm font-bold text-brand-900">31.2%</div>
                                    </div>
                                    <div class="text-[10px] text-gray-500 mb-1.5 truncate">Alliance Bloc</div>
                                    <div class="w-full bg-gray-100 rounded-full h-1.5">
                                        <div class="bg-blue-600 h-1.5 rounded-full" style="width: 31.2%"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Rank 3 -->
                            <div class="flex items-center">
                                <div class="w-8 h-8 rounded-full text-gray-400 font-bold text-sm flex items-center justify-center mr-4 flex-shrink-0">3</div>
                                <img src="https://i.pravatar.cc/150?img=60" alt="Candidate" class="w-10 h-10 rounded-lg object-cover mr-3 border border-gray-200">
                                <div class="flex-1 min-w-0">
                                    <div class="flex justify-between items-baseline mb-1">
                                        <div class="text-sm font-bold text-brand-900 truncate">Samuel Whitlock</div>
                                        <div class="text-sm font-bold text-gray-700">18.5%</div>
                                    </div>
                                    <div class="text-[10px] text-gray-500 mb-1.5 truncate">National Front</div>
                                    <div class="w-full bg-gray-100 rounded-full h-1.5">
                                        <div class="bg-gray-300 h-1.5 rounded-full" style="width: 18.5%"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Rank 4 -->
                            <div class="flex items-center">
                                <div class="w-8 h-8 rounded-full text-gray-400 font-bold text-sm flex items-center justify-center mr-4 flex-shrink-0">4</div>
                                <img src="https://i.pravatar.cc/150?img=33" alt="Candidate" class="w-10 h-10 rounded-lg object-cover mr-3 border border-gray-200">
                                <div class="flex-1 min-w-0">
                                    <div class="flex justify-between items-baseline mb-1">
                                        <div class="text-sm font-bold text-brand-900 truncate">James T. Kirk</div>
                                        <div class="text-sm font-bold text-gray-700">7.5%</div>
                                    </div>
                                    <div class="text-[10px] text-gray-500 mb-1.5 truncate">Independent</div>
                                    <div class="w-full bg-gray-100 rounded-full h-1.5">
                                        <div class="bg-gray-200 h-1.5 rounded-full" style="width: 7.5%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-4 border-t border-gray-50 text-center bg-gray-50/50">
                            <button class="text-[11px] font-bold text-brand-900 hover:text-brand-700 uppercase tracking-widest transition-colors">
                                VIEW DETAILED TALLY
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Middle Cards (3 Cards) -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <!-- Verification Status -->
                    <div class="bg-brand-900 rounded-2xl p-6 shadow-md text-white flex items-center relative overflow-hidden">
                        <div class="absolute -right-6 -bottom-6 w-24 h-24 bg-white opacity-5 rounded-full"></div>
                        <div class="w-12 h-12 bg-white/10 rounded-full flex items-center justify-center mr-4 flex-shrink-0 border border-white/20 backdrop-blur-sm z-10">
                            <i class="fa-solid fa-shield-check text-xl"></i>
                        </div>
                        <div class="z-10">
                            <div class="text-[10px] font-bold text-blue-200 uppercase tracking-wider mb-1">VERIFICATION STATUS</div>
                            <div class="text-2xl font-bold mb-1">98.2% Verified</div>
                            <div class="text-[11px] text-blue-200/80">42/45 Precincts Reported</div>
                        </div>
                    </div>

                    <!-- Swing Prediction -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center">
                        <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mr-4 flex-shrink-0 text-blue-600">
                            <i class="fa-solid fa-arrow-trend-up text-xl"></i>
                        </div>
                        <div>
                            <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">SWING PREDICTION</div>
                            <div class="text-2xl font-bold text-brand-900 mb-1">+4.2% Growth</div>
                            <div class="text-[11px] text-gray-500">Compared to 2020 election</div>
                        </div>
                    </div>

                    <!-- New Voters -->
                    <div class="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 flex items-center">
                        <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center mr-4 flex-shrink-0 text-orange-600">
                            <i class="fa-solid fa-user-plus text-xl"></i>
                        </div>
                        <div>
                            <div class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">NEW VOTERS</div>
                            <div class="text-2xl font-bold text-brand-900 mb-1">124,500</div>
                            <div class="text-[11px] text-gray-500">Registered in last 90 days</div>
                        </div>
                    </div>
                </div>

                <!-- Bottom Card: Geographic Heatmap -->
                <div class="bg-gray-50 rounded-2xl border border-gray-200 p-8 relative overflow-hidden flex flex-col items-center justify-center min-h-[200px]">
                    <!-- Abstract Topography Lines Background -->
                    <div class="absolute inset-0 opacity-10" style="background-image: radial-gradient(circle at 50% 50%, transparent 20%, #cbd5e1 21%, transparent 22%), radial-gradient(circle at 50% 50%, transparent 40%, #cbd5e1 41%, transparent 42%), radial-gradient(circle at 50% 50%, transparent 60%, #cbd5e1 61%, transparent 62%); background-size: 100px 100px;"></div>
                    
                    <div class="absolute top-6 left-8 z-10">
                        <h3 class="text-lg font-bold text-brand-900">Geographic Heatmap</h3>
                        <p class="text-xs text-gray-600 mt-1">Regional distribution of voting participation</p>
                    </div>

                    <div class="absolute top-6 right-8 z-10 flex flex-col items-end space-y-2">
                        <div class="flex items-center text-[10px] font-bold text-gray-600">
                            <span class="w-2.5 h-2.5 rounded-full bg-brand-900 mr-2 shadow-sm"></span> High Density
                        </div>
                        <div class="flex items-center text-[10px] font-bold text-gray-500">
                            <span class="w-2.5 h-2.5 rounded-full bg-blue-300 mr-2 shadow-sm"></span> Low Density
                        </div>
                    </div>

                    <button class="relative z-10 px-6 py-3 bg-white text-brand-900 text-sm font-bold rounded-xl shadow-md hover:shadow-lg border border-gray-100 transition-all mt-8">
                        Open Interactive Geographic View
                    </button>
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
