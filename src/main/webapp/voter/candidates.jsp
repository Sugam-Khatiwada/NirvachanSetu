<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidates - NirvachanSetu</title>
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
                <a href="candidates.jsp" class="text-blue-600 border-b-2 border-blue-600 pb-5 mb--5">Candidates</a>
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
        
        <!-- Candidates Section Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-8 gap-4">
            <div>
                <nav class="flex text-sm text-gray-500 mb-2" aria-label="Breadcrumb">
                  <ol class="inline-flex items-center space-x-1 md:space-x-3">
                    <li class="inline-flex items-center">
                      <a href="dashboard.jsp" class="hover:text-blue-600">Home</a>
                    </li>
                    <li>
                      <div class="flex items-center">
                        <i class="fa-solid fa-chevron-right text-[10px] mx-2 text-gray-400"></i>
                        <span class="text-gray-700 font-medium">Candidates</span>
                      </div>
                    </li>
                  </ol>
                </nav>
                <h2 class="text-3xl font-bold text-gray-900">All Candidates</h2>
                <p class="text-sm text-gray-500 mt-2">Explore the candidates contesting in your constituency <span class="font-semibold text-gray-700">North Bangalore</span>.</p>
            </div>
            <div class="flex items-center gap-3">
                <div class="relative">
                    <i class="fa-solid fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                    <input type="text" placeholder="Search by name..." class="bg-white border border-gray-200 text-sm rounded-lg pl-9 pr-4 py-2.5 w-60 focus:outline-none focus:ring-2 focus:ring-blue-100 shadow-sm">
                </div>
                <select class="bg-white border border-gray-200 text-sm text-gray-700 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-100 shadow-sm appearance-none pr-8 relative">
                    <option>All Parties</option>
                    <option>National Party</option>
                    <option>Regional Alliance</option>
                    <option>Independent</option>
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
                    
                    <button onclick="openModal('balen')" class="w-full bg-[#0d5bc6] hover:bg-blue-700 text-white font-medium py-2.5 rounded-lg transition duration-150 flex items-center justify-center gap-2 text-sm shadow-sm cursor-pointer">
                        View Details <i class="fa-solid fa-arrow-right text-xs"></i>
                    </button>
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
                    
                    <button onclick="openModal('harka')" class="w-full bg-[#0d5bc6] hover:bg-blue-700 text-white font-medium py-2.5 rounded-lg transition duration-150 flex items-center justify-center gap-2 text-sm shadow-sm cursor-pointer">
                        View Details <i class="fa-solid fa-arrow-right text-xs"></i>
                    </button>
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
                    
                    <button onclick="openModal('kpoli')" class="w-full bg-[#0d5bc6] hover:bg-blue-700 text-white font-medium py-2.5 rounded-lg transition duration-150 flex items-center justify-center gap-2 text-sm shadow-sm cursor-pointer">
                        View Details <i class="fa-solid fa-arrow-right text-xs"></i>
                    </button>
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
                    
                    <button onclick="openModal('parchanda')" class="w-full bg-[#0d5bc6] hover:bg-blue-700 text-white font-medium py-2.5 rounded-lg transition duration-150 flex items-center justify-center gap-2 text-sm shadow-sm cursor-pointer">
                        View Details <i class="fa-solid fa-arrow-right text-xs"></i>
                    </button>
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

    <!-- Candidate Description Modal -->
    <div id="candidateModal" class="fixed inset-0 bg-black/50 z-50 hidden items-center justify-center backdrop-blur-sm transition-opacity">
        <div class="bg-white rounded-2xl w-full max-w-2xl mx-4 overflow-hidden shadow-2xl relative" onclick="event.stopPropagation()">
            <button onclick="closeModal()" class="absolute top-4 right-4 text-gray-400 hover:text-gray-800 bg-white/70 hover:bg-white rounded-full w-8 h-8 flex items-center justify-center transition-colors z-10">
                <i class="fa-solid fa-xmark"></i>
            </button>
            <div class="md:flex">
                <div class="w-full md:w-2/5 h-64 md:h-auto relative bg-gray-100">
                    <img id="modalImage" src="" alt="Candidate" class="w-full h-full object-cover object-top">
                    <div id="modalParty" class="absolute top-3 left-3 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90"></div>
                </div>
                <div class="p-8 w-full md:w-3/5">
                    <h2 id="modalName" class="text-3xl font-bold text-gray-900 mb-1"></h2>
                    <p id="modalRole" class="text-sm text-blue-600 font-medium mb-6"></p>
                    
                    <h4 class="text-xs uppercase font-bold text-gray-400 tracking-wider mb-2">About the Candidate</h4>
                    <p id="modalDescription" class="text-gray-600 text-sm leading-relaxed mb-6">
                    </p>

                    <div class="grid grid-cols-2 gap-4 border-t border-gray-100 pt-6">
                        <div>
                            <div class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Experience</div>
                            <div id="modalExperience" class="text-sm font-semibold text-gray-800"></div>
                        </div>
                        <div>
                            <div class="text-[10px] uppercase font-bold text-gray-400 tracking-wider mb-1">Key Agenda</div>
                            <div id="modalAgenda" class="text-sm font-semibold text-gray-800"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Logic -->
    <script>
        const candidatesData = {
            'balen': {
                name: 'Balen',
                role: 'Social Reformer',
                party: 'Independent',
                image: 'assets/balen.jpg',
                partyBg: 'bg-blue-900',
                experience: 'Civic Activism',
                agenda: 'Transparency',
                description: 'Balen has been a prominent voice for civic activism, focusing on transparency in local government and sustainable urban development. He aims to bring systemic reforms to the root of city management and improve structural transparency.'
            },
            'harka': {
                name: 'Harka',
                role: 'Youth Leader',
                party: 'Regional Alliance',
                image: 'assets/harka.jpeg',
                partyBg: 'bg-blue-500',
                experience: 'Grassroots Development',
                agenda: 'Public Services',
                description: 'Harka is a grassroots youth leader who has campaigned tirelessly for the improvement of public services and community welfare. His focus is on empowering marginalized communities and mobilizing youth to take charge of community welfare.'
            },
            'kpoli': {
                name: 'Kpoli',
                role: 'Incumbent Candidate',
                party: 'National Party',
                image: 'assets/kpoli.jpg',
                partyBg: 'bg-blue-900',
                experience: '15+ Years in Admin',
                agenda: 'Urban Infra',
                description: 'As the incumbent candidate, Kpoli brings over 15 years of robust administrative experience. The primary focus remains on massive urban infrastructure upgrades, modernizing transit lines, and boosting local economic growth through strong policy reforms.'
            },
            'parchanda': {
                name: 'Parchanda',
                role: 'Revolutionist',
                party: 'National Party',
                image: 'assets/parchanda.jpg',
                partyBg: 'bg-blue-900',
                experience: '20+ Years activist',
                agenda: 'New Republic',
                description: 'A veteran revolutionist with over 20 years of political struggle, Parchanda seeks to establish policies ensuring social justice, economic equality, and building a strong foundation for a prosperous new republic.'
            }
        };

        function openModal(id) {
            const candidate = candidatesData[id];
            if(!candidate) return;

            document.getElementById('modalImage').src = candidate.image;
            
            const modalParty = document.getElementById('modalParty');
            modalParty.textContent = candidate.party;
            modalParty.className = 'absolute top-3 left-3 text-white text-[9px] font-bold px-2 py-1 rounded uppercase tracking-wider backdrop-blur-md bg-opacity-90 ' + candidate.partyBg;
            
            document.getElementById('modalName').textContent = candidate.name;
            document.getElementById('modalRole').textContent = candidate.role;
            document.getElementById('modalDescription').textContent = candidate.description;
            document.getElementById('modalExperience').textContent = candidate.experience;
            document.getElementById('modalAgenda').textContent = candidate.agenda;

            const modal = document.getElementById('candidateModal');
            modal.classList.remove('hidden');
            modal.classList.add('flex');
            document.body.style.overflow = 'hidden'; // Prevent background scrolling
        }

        function closeModal() {
            const modal = document.getElementById('candidateModal');
            modal.classList.add('hidden');
            modal.classList.remove('flex');
            document.body.style.overflow = ''; // Restore background scrolling
        }

        // Close modal when clicking outside
        document.getElementById('candidateModal').addEventListener('click', function() {
            closeModal();
        });
    </script>
</body>
</html>
