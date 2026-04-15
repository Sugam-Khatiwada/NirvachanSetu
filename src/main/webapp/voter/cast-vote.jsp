<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cast Your Ballot - NirvachanSetu</title>
    <!-- Using Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
            background-color: #fafbfc;
        }

        /* Hide radio, style the peer marker */
        input[type="radio"]:checked + div > div {
            transform: scale(1);
            opacity: 1;
        }
        input[type="radio"]:checked + div {
            border-color: #1e3a8a;
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
                <a href="cast-vote.jsp" class="text-blue-600 border-b-2 border-blue-600 pb-5 mb--5">Vote</a>
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
    <main class="flex-grow w-full max-w-4xl mx-auto px-6 py-12">
        
        <!-- Header -->
        <div class="text-center mb-10">
            <h2 class="text-[32px] font-extrabold text-[#11235a] mb-3 tracking-tight">Cast Your Ballot</h2>
            <p class="text-sm text-gray-600 font-medium">General Election 2024 &bull; Constituency: North Bangalore &bull; Voter ID: ND-9921-X</p>
        </div>

        <!-- Alert Notification -->
        <div class="bg-[#fef2f2] border-l-[3px] border-red-600 rounded-r-xl p-5 mb-8 shadow-sm flex gap-4">
            <i class="fa-solid fa-triangle-exclamation text-red-600 mt-1 text-lg"></i>
            <div>
                <h4 class="text-red-800 font-bold text-sm mb-1 hidden lg:block">Important Notice</h4>
                <p class="text-red-700 text-sm font-medium">
                    <span class="font-bold lg:hidden">Important Notice: </span>
                    You can only vote once. Please review your selection carefully before submitting. This action is final and cannot be undone.
                </p>
            </div>
        </div>

        <!-- Candidates Form -->
        <form action="submit-vote.jsp" method="POST" id="voteForm" class="space-y-4">

            <!-- Candidate 1 -->
            <label class="group relative flex items-center justify-between p-5 bg-white rounded-xl shadow-[0_2px_8px_rgb(0,0,0,0.04)] border border-gray-100 hover:border-blue-200 cursor-pointer transition-all">
                <div class="flex items-center gap-5">
                    <div class="w-14 h-14 rounded-full overflow-hidden border border-gray-100 shrink-0">
                        <img src="assets/balen.jpg" alt="Balen" class="w-full h-full object-cover object-top">
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#11235a]">Balen</h3>
                        <p class="text-[13px] text-gray-600 mb-1.5 font-medium">Independent</p>
                        <div class="flex items-center gap-1.5 text-[10px] uppercase tracking-wider font-bold text-blue-700">
                            <i class="fa-solid fa-circle-check text-blue-600"></i> Verified Candidate
                        </div>
                    </div>
                </div>
                <div class="relative flex items-center justify-center shrink-0">
                    <input type="radio" name="candidateId" value="balen" class="peer w-6 h-6 opacity-0 absolute cursor-pointer z-10" onchange="toggleConfirmState()">
                    <div class="w-[22px] h-[22px] rounded-full border-2 border-gray-300 peer-checked:border-[#1e3a8a] flex items-center justify-center transition-colors">
                        <div class="w-[10px] h-[10px] rounded-full bg-[#1e3a8a] scale-0 opacity-0 transition-all duration-200 ease-out"></div>
                    </div>
                </div>
            </label>

            <!-- Candidate 2 -->
            <label class="group relative flex items-center justify-between p-5 bg-white rounded-xl shadow-[0_2px_8px_rgb(0,0,0,0.04)] border border-gray-100 hover:border-blue-200 cursor-pointer transition-all">
                <div class="flex items-center gap-5">
                    <div class="w-14 h-14 rounded-full overflow-hidden border border-gray-100 shrink-0">
                        <img src="assets/harka.jpeg" alt="Harka" class="w-full h-full object-cover object-top">
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#11235a]">Harka</h3>
                        <p class="text-[13px] text-gray-600 mb-1.5 font-medium">Regional Alliance</p>
                        <div class="flex items-center gap-1.5 text-[10px] uppercase tracking-wider font-bold text-gray-500">
                            <i class="fa-solid fa-shield-halved"></i> Independent Nominee
                        </div>
                    </div>
                </div>
                <div class="relative flex items-center justify-center shrink-0">
                    <input type="radio" name="candidateId" value="harka" class="peer w-6 h-6 opacity-0 absolute cursor-pointer z-10" onchange="toggleConfirmState()">
                    <div class="w-[22px] h-[22px] rounded-full border-2 border-gray-300 peer-checked:border-[#1e3a8a] flex items-center justify-center transition-colors">
                        <div class="w-[10px] h-[10px] rounded-full bg-[#1e3a8a] scale-0 opacity-0 transition-all duration-200 ease-out"></div>
                    </div>
                </div>
            </label>

            <!-- Candidate 3 -->
            <label class="group relative flex items-center justify-between p-5 bg-white rounded-xl shadow-[0_2px_8px_rgb(0,0,0,0.04)] border border-gray-100 hover:border-blue-200 cursor-pointer transition-all">
                <div class="flex items-center gap-5">
                    <div class="w-14 h-14 rounded-full overflow-hidden border border-gray-100 shrink-0">
                        <img src="assets/kpoli.jpg" alt="Kpoli" class="w-full h-full object-cover object-top">
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#11235a]">Kpoli</h3>
                        <p class="text-[13px] text-gray-600 mb-1.5 font-medium">National Party</p>
                        <div class="flex items-center gap-1.5 text-[10px] uppercase tracking-wider font-bold text-blue-700">
                            <i class="fa-solid fa-circle-check text-blue-600"></i> Verified Candidate
                        </div>
                    </div>
                </div>
                <div class="relative flex items-center justify-center shrink-0">
                    <input type="radio" name="candidateId" value="kpoli" class="peer w-6 h-6 opacity-0 absolute cursor-pointer z-10" onchange="toggleConfirmState()">
                    <div class="w-[22px] h-[22px] rounded-full border-2 border-gray-300 peer-checked:border-[#1e3a8a] flex items-center justify-center transition-colors">
                        <div class="w-[10px] h-[10px] rounded-full bg-[#1e3a8a] scale-0 opacity-0 transition-all duration-200 ease-out"></div>
                    </div>
                </div>
            </label>

            <!-- Candidate 4 -->
            <label class="group relative flex items-center justify-between p-5 bg-white rounded-xl shadow-[0_2px_8px_rgb(0,0,0,0.04)] border border-gray-100 hover:border-blue-200 cursor-pointer transition-all">
                <div class="flex items-center gap-5">
                    <div class="w-14 h-14 rounded-full overflow-hidden border border-gray-100 shrink-0">
                        <img src="assets/parchanda.jpg" alt="Parchanda" class="w-full h-full object-cover object-top">
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#11235a]">Parchanda</h3>
                        <p class="text-[13px] text-gray-600 mb-1.5 font-medium">National Party</p>
                        <div class="flex items-center gap-1.5 text-[10px] uppercase tracking-wider font-bold text-gray-500">
                            <i class="fa-solid fa-shield-halved"></i> Independent Nominee
                        </div>
                    </div>
                </div>
                <div class="relative flex items-center justify-center shrink-0">
                    <input type="radio" name="candidateId" value="parchanda" class="peer w-6 h-6 opacity-0 absolute cursor-pointer z-10" onchange="toggleConfirmState()">
                    <div class="w-[22px] h-[22px] rounded-full border-2 border-gray-300 peer-checked:border-[#1e3a8a] flex items-center justify-center transition-colors">
                        <div class="w-[10px] h-[10px] rounded-full bg-[#1e3a8a] scale-0 opacity-0 transition-all duration-200 ease-out"></div>
                    </div>
                </div>
            </label>

            <!-- NOTA -->
            <label class="group relative flex items-center justify-between p-5 bg-white rounded-xl shadow-[0_2px_8px_rgb(0,0,0,0.04)] border border-gray-100 hover:border-blue-200 cursor-pointer transition-all mt-2">
                <div class="flex items-center gap-5">
                    <div class="w-14 h-14 rounded-full bg-gray-200 flex items-center justify-center text-gray-600 shrink-0">
                        <i class="fa-solid fa-ban text-2xl"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-[#11235a]">None of the Above (NOTA)</h3>
                        <p class="text-[13px] text-gray-600 font-medium">Decline all registered candidates</p>
                    </div>
                </div>
                <div class="relative flex items-center justify-center shrink-0">
                    <input type="radio" name="candidateId" value="nota" class="peer w-6 h-6 opacity-0 absolute cursor-pointer z-10" onchange="toggleConfirmState()">
                    <div class="w-[22px] h-[22px] rounded-full border-2 border-gray-300 peer-checked:border-[#1e3a8a] flex items-center justify-center transition-colors">
                        <div class="w-[10px] h-[10px] rounded-full bg-[#1e3a8a] scale-0 opacity-0 transition-all duration-200 ease-out"></div>
                    </div>
                </div>
            </label>

            <!-- Confirmation & Submit Area -->
            <div class="bg-[#f8fafc] rounded-2xl p-8 mt-10 text-center border border-gray-100 shadow-inner">
                <label id="confirmWrapper" class="inline-flex items-center justify-center gap-3 mb-6 cursor-not-allowed opacity-50 transition-opacity">
                    <input type="checkbox" id="confirmData" class="w-4 h-4 rounded text-blue-600 focus:ring-blue-500 border-gray-300 cursor-pointer pointer-events-none" disabled onchange="toggleSubmitBtn()">
                    <span class="text-sm font-medium text-gray-800">I confirm that this is my final selection.</span>
                </label>
                
                <button type="submit" id="submitVote" disabled class="w-[300px] max-w-full mx-auto bg-[#1e3aa8] text-white font-bold py-4 rounded-xl shadow-md disabled:bg-gray-300 disabled:text-gray-500 disabled:cursor-not-allowed flex items-center justify-center gap-3 transition-all hover:bg-blue-800 hover:shadow-lg text-lg">
                    <i class="fa-solid fa-user-lock"></i> Cast Vote
                </button>
                
                <p class="text-[11px] text-gray-400 font-bold tracking-[0.2em] uppercase mt-5">Secure Encryption Enabled</p>
            </div>

        </form>

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

    <!-- Form state logic -->
    <script>
        const voteForm = document.getElementById('voteForm');
        const confirmWrapper = document.getElementById('confirmWrapper');
        const confirmCheck = document.getElementById('confirmData');
        const submitBtn = document.getElementById('submitVote');

        function toggleConfirmState() {
            // Enable the confirm checkbox once a radio is selected
            const hasSelection = document.querySelector('input[name="candidateId"]:checked') !== null;
            if (hasSelection) {
                confirmWrapper.classList.remove('opacity-50', 'cursor-not-allowed');
                confirmWrapper.classList.add('cursor-pointer');
                confirmCheck.disabled = false;
                confirmCheck.classList.remove('pointer-events-none');
            }
        }

        function toggleSubmitBtn() {
            // Enable submit if checkbox is checked
            submitBtn.disabled = !confirmCheck.checked;
        }

        // Prevent default submission for demonstration
        voteForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const selected = document.querySelector('input[name="candidateId"]:checked').value;
            alert("Vote recorded securely for: " + selected + "\n\n(This is a mockup. Logic implemented!)");
        });
    </script>
</body>
</html>
