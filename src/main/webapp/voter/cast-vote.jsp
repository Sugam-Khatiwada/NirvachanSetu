<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cast Your Vote - NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; }
        .candidate-card { transition: all 0.2s ease; border: 2px solid transparent; }
        .candidate-card:hover { border-color: #e2e8f0; }
        .candidate-card.selected { border-color: #1e3a8a; background-color: #eff6ff; }
        
        .radio-custom {
            appearance: none;
            background-color: transparent;
            margin: 0;
            font: inherit;
            color: currentColor;
            width: 1.5em;
            height: 1.5em;
            border: 2px solid #cbd5e1;
            border-radius: 50%;
            display: grid;
            place-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .candidate-card.selected .radio-custom {
            background-color: #1e3a8a;
            border-color: #1e3a8a;
        }

        .radio-custom::after {
            content: "\f00c";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: white;
            font-size: 0.8rem;
            display: none;
        }

        .candidate-card.selected .radio-custom::after {
            display: block;
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-800">

    <!-- Navigation Bar -->
    <c:set var="activePage" value="vote" scope="request" />
    <jsp:include page="../layout/header.jsp" />

    <!-- Main Content -->
    <main class="max-w-3xl mx-auto px-6 py-12">

        <!-- Header Titles -->
        <div class="text-center mb-10">
            <h1 class="text-4xl font-bold text-[#1e3a8a] mb-3">Cast Your Ballot</h1>
            <p class="text-sm text-gray-600 font-medium">
                ${not empty election.name ? election.name : 'General Election 2024'} &bull; 
                Constituency: ${not empty user.constituency.name ? user.constituency.name : 'Central Metropolitan'} &bull; 
                Voter ID: ${not empty user.voterId ? user.voterId : 'ND-9921-X'}
            </p>
        </div>

        <!-- Warning Alert -->
        <div class="bg-[#fee2e2] border-l-4 border-red-600 p-5 rounded-lg mb-8 flex gap-3 shadow-sm">
            <i class="fas fa-exclamation-triangle text-red-600 mt-0.5"></i>
            <div>
                <h3 class="font-bold text-red-800 mb-1">Important Notice</h3>
                <p class="text-sm text-red-700">You can only vote once. Please review your selection carefully before submitting. This action is final and cannot be undone.</p>
            </div>
        </div>

        <!-- Voting Form -->
        <form id="voteForm" action="${pageContext.request.contextPath}/voter/cast-vote" method="post">
            <input type="hidden" name="electionId" value="${election.id}">
            <div class="flex flex-col gap-4 mb-8">
                
                <!-- Candidates -->
                <c:choose>
                    <c:when test="${not empty candidates}">
                        <c:forEach var="candidate" items="${candidates}" varStatus="status">
                            <label class="candidate-card bg-white p-5 rounded-xl shadow-sm flex items-center justify-between cursor-pointer">
                                <div class="flex items-center gap-5">
                                    <div class="w-14 h-14 rounded-full bg-gray-200 overflow-hidden flex items-center justify-center border-2 border-gray-100">
                                        <c:choose>
                                            <c:when test="${not empty candidate.user.profileImage}">
                                                <img src="${candidate.user.profileImage}" alt="${candidate.user.fullName}" class="w-full h-full object-cover">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://ui-avatars.com/api/?name=${candidate.user.fullName}&background=random" alt="${candidate.user.fullName}" class="w-full h-full object-cover">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-[#1e3a8a] mb-1">${candidate.user.fullName}</h3>
                                        <p class="text-sm text-gray-600 mb-1">${candidate.partyName}</p>
                                        <div class="flex items-center gap-1.5 text-xs font-bold text-blue-600 uppercase tracking-wide">
                                            <i class="fas fa-check-circle"></i> Verified Candidate
                                        </div>
                                    </div>
                                </div>
                                <input type="radio" name="candidateId" value="${candidate.id}" class="hidden" onchange="updateSelection(this)">
                                <div class="radio-custom"></div>
                            </label>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- Dummy data if no candidates present to show the UI -->
                        <label class="candidate-card bg-white p-5 rounded-xl shadow-sm flex items-center justify-between cursor-pointer">
                            <div class="flex items-center gap-5">
                                <div class="w-14 h-14 rounded-full bg-gray-200 overflow-hidden flex items-center justify-center border-2 border-gray-100">
                                    <img src="https://ui-avatars.com/api/?name=Aris+Thorne&background=1e3a8a&color=fff" alt="Dr. Aris Thorne" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="text-xl font-bold text-[#1e3a8a] mb-1">Dr. Aris Thorne</h3>
                                    <p class="text-sm text-gray-600 mb-1">Progressive Unity Party (PUP)</p>
                                    <div class="flex items-center gap-1.5 text-xs font-bold text-blue-600 uppercase tracking-wide">
                                        <i class="fas fa-check-circle"></i> Verified Candidate
                                    </div>
                                </div>
                            </div>
                            <input type="radio" name="candidateId" value="1" class="hidden" onchange="updateSelection(this)">
                            <div class="radio-custom"></div>
                        </label>
                        
                        <label class="candidate-card bg-white p-5 rounded-xl shadow-sm flex items-center justify-between cursor-pointer">
                            <div class="flex items-center gap-5">
                                <div class="w-14 h-14 rounded-full bg-gray-200 overflow-hidden flex items-center justify-center border-2 border-gray-100">
                                    <img src="https://ui-avatars.com/api/?name=Maya+Sterling&background=b91c1c&color=fff" alt="Maya V. Sterling" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="text-xl font-bold text-[#1e3a8a] mb-1">Maya V. Sterling</h3>
                                    <p class="text-sm text-gray-600 mb-1">Reform Alliance Collective</p>
                                    <div class="flex items-center gap-1.5 text-xs font-bold text-gray-500 uppercase tracking-wide">
                                        <i class="fas fa-shield-alt"></i> Independent Nominee
                                    </div>
                                </div>
                            </div>
                            <input type="radio" name="candidateId" value="2" class="hidden" onchange="updateSelection(this)">
                            <div class="radio-custom"></div>
                        </label>

                        <label class="candidate-card bg-white p-5 rounded-xl shadow-sm flex items-center justify-between cursor-pointer">
                            <div class="flex items-center gap-5">
                                <div class="w-14 h-14 rounded-full bg-gray-200 overflow-hidden flex items-center justify-center border-2 border-gray-100">
                                    <img src="https://ui-avatars.com/api/?name=Julian+Oak&background=15803d&color=fff" alt="Julian Oak" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="text-xl font-bold text-[#1e3a8a] mb-1">Julian Oak</h3>
                                    <p class="text-sm text-gray-600 mb-1">Environmental Stewardship Front</p>
                                    <div class="flex items-center gap-1.5 text-xs font-bold text-blue-600 uppercase tracking-wide">
                                        <i class="fas fa-check-circle"></i> Verified Candidate
                                    </div>
                                </div>
                            </div>
                            <input type="radio" name="candidateId" value="3" class="hidden" onchange="updateSelection(this)">
                            <div class="radio-custom"></div>
                        </label>
                    </c:otherwise>
                </c:choose>

                <!-- NOTA Option -->
                <label class="candidate-card bg-white p-5 rounded-xl shadow-sm flex items-center justify-between cursor-pointer">
                    <div class="flex items-center gap-5">
                        <div class="w-14 h-14 rounded-full bg-gray-200 text-gray-500 overflow-hidden flex items-center justify-center border-2 border-gray-100 text-xl">
                            <i class="fas fa-ban"></i>
                        </div>
                        <div>
                            <h3 class="text-xl font-bold text-[#1e3a8a] mb-1">None of the Above (NOTA)</h3>
                            <p class="text-sm text-gray-600 mb-1">Decline all registered candidates</p>
                        </div>
                    </div>
                    <input type="radio" name="candidateId" value="-1" class="hidden" onchange="updateSelection(this)">
                    <div class="radio-custom"></div>
                </label>
                
            </div>

            <!-- Confirmation Box -->
            <div class="bg-gray-100 rounded-xl p-8 flex flex-col items-center shadow-inner">
                <label class="flex items-center gap-3 cursor-pointer mb-6">
                    <input type="checkbox" id="confirmCheckbox" class="w-5 h-5 rounded border-gray-300 text-[#1e3a8a] focus:ring-[#1e3a8a]" onchange="toggleSubmitButton()">
                    <span class="text-sm font-medium text-gray-800">I confirm that this is my final selection.</span>
                </label>

                <button type="button" id="submitBtn" disabled class="bg-[#1e3a8a] text-white font-bold text-lg py-4 px-12 rounded-lg shadow-md w-full max-w-sm flex items-center justify-center gap-3 disabled:opacity-50 disabled:cursor-not-allowed hover:bg-blue-900 transition-colors" onclick="submitVote()">
                    <i class="fas fa-user-lock"></i> Cast Vote
                </button>
                
                <p class="text-xs font-bold text-gray-400 tracking-widest mt-6">SECURE ENCRYPTION ENABLED</p>
            </div>
        </form>

    </main>

    <div id="voteSuccessModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-2xl p-8 max-w-sm w-full mx-4 shadow-2xl text-center transform transition-all duration-300 scale-95 opacity-0" id="successContent">
            <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                <i class="fas fa-check text-4xl text-green-600"></i>
            </div>
            <h2 class="text-2xl font-bold text-gray-800 mb-2">Vote Cast!</h2>
            <p class="text-gray-600 mb-8">Your selection has been securely encrypted and recorded in the digital ballot box.</p>
            <button onclick="window.location.href='${pageContext.request.contextPath}/voter/dashboard'" class="w-full bg-[#1e3a8a] text-white font-bold py-3 rounded-xl hover:bg-blue-900 transition-colors">
                Return to Dashboard
            </button>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <script>
        function updateSelection(radioInput) {
            // Remove 'selected' class from all cards
            document.querySelectorAll('.candidate-card').forEach(card => {
                card.classList.remove('selected');
            });
            // Add 'selected' class to the checked radio's parent label
            if (radioInput.checked) {
                radioInput.closest('.candidate-card').classList.add('selected');
            }
            toggleSubmitButton();
        }

        function toggleSubmitButton() {
            const hasCandidate = document.querySelector('input[name="candidateId"]:checked') !== null;
            const isConfirmed = document.getElementById('confirmCheckbox').checked;
            document.getElementById('submitBtn').disabled = !(hasCandidate && isConfirmed);
        }

        async function submitVote() {
            const hasCandidate = document.querySelector('input[name="candidateId"]:checked') !== null;
            const isConfirmed = document.getElementById('confirmCheckbox').checked;
            
            if (hasCandidate && isConfirmed) {
                const submitBtn = document.getElementById('submitBtn');
                const originalContent = submitBtn.innerHTML;
                
                // Show loading state
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-circle-notch fa-spin"></i> Processing...';
                
                const formData = new FormData(document.getElementById('voteForm'));
                
                try {
                    const response = await fetch(document.getElementById('voteForm').action, {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    });
                    
                    if (response.ok) {
                        // Show success animation
                        document.getElementById('voteSuccessModal').classList.remove('hidden');
                        setTimeout(() => {
                            const content = document.getElementById('successContent');
                            content.classList.remove('scale-95', 'opacity-0');
                            content.classList.add('scale-100', 'opacity-100');
                        }, 10);
                    } else {
                        throw new Error('Submission failed');
                    }
                } catch (error) {
                    alert('Error casting vote. Please try again.');
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalContent;
                }
            }
        }
    </script>
</body>
</html>
