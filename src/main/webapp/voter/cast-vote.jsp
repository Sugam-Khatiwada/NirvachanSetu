<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cast Your Ballot - NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; }
        
        .radio-custom:checked + div {
            border-color: #2563eb;
            background-color: #eff6ff;
        }
    </style>
</head>
<body>
    <!-- Main Content -->
    <main class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <!-- Error & Message Handling -->
        <c:if test="${not empty sessionScope.error}">
            <div class="bg-red-50 text-red-700 p-4 rounded-lg mb-6 flex items-start">
                <i class="fa-solid fa-circle-exclamation mt-1 mr-3"></i>
                <p>${sessionScope.error}</p>
            </div>
            <% request.getSession().removeAttribute("error"); %>
        </c:if>
        <c:if test="${not empty sessionScope.success}">
            <div class="bg-green-50 text-green-700 p-4 rounded-lg mb-6 flex items-start">
                <i class="fa-solid fa-circle-check mt-1 mr-3"></i>
                <p>${sessionScope.success}</p>
            </div>
            <% request.getSession().removeAttribute("success"); %>
        </c:if>
        <c:if test="${not empty error}">
            <div class="bg-red-50 text-red-700 p-4 rounded-lg mb-6 flex items-start">
                <i class="fa-solid fa-circle-exclamation mt-1 mr-3"></i>
                <p>${error}</p>
            </div>
        </c:if>

        <!-- Header -->
        <div class="text-center mb-10">
            <h1 class="text-4xl font-bold text-[#1e3a8a] mb-4 tracking-tight">Cast Your Ballot</h1>
            <p class="text-gray-600 text-[15px]">
                ${election.name} &bull; Constituency: ${constituency.name} &bull; Voter ID: ${sessionScope.user.citizenshipNumber}
            </p>
        </div>

        <!-- Warning Notice -->
        <div class="bg-[#fce8e8] border-l-[4px] border-[#dc2626] py-5 px-6 rounded-r-xl mb-10 shadow-sm">
            <div class="flex items-start">
                <div class="flex-shrink-0 mt-0.5">
                    <i class="fa-solid fa-triangle-exclamation text-[#b91c1c] text-lg"></i>
                </div>
                <div class="ml-4">
                    <h3 class="text-[16px] font-semibold text-[#991b1b] mb-1">Important Notice</h3>
                    <p class="text-[15px] text-[#b91c1c] leading-snug">
                        You can only vote once. Please review your selection carefully before submitting. This action is final and cannot be undone.
                    </p>
                </div>
            </div>
        </div>

        <!-- Form -->
        <form action="${pageContext.request.contextPath}/voter/cast-vote" method="POST" id="voteForm">
            <input type="hidden" name="electionId" value="${election.id}" />

            <div class="space-y-5 mb-10">
                <!-- Candidates Iteration -->
                <c:forEach var="candidate" items="${candidates}">
                    <label class="block relative cursor-pointer group">
                        <input type="radio" name="candidateId" value="${candidate.id}" class="peer sr-only radio-custom" required>
                        <div class="bg-white p-5 rounded-2xl shadow-sm border-[1.5px] border-transparent hover:border-blue-200 transition-all flex items-center justify-between peer-checked:border-blue-500 peer-checked:bg-blue-50 peer-checked:-translate-y-0.5 peer-checked:shadow-md">
                            <div class="flex items-center space-x-6">
                                <!-- Avatar -->
                                <div class="h-16 w-16 rounded-full bg-gray-100 flex-shrink-0 overflow-hidden border border-gray-200 shadow-sm">
                                    <c:choose>
                                        <c:when test="${not empty candidate.user.profileImage}">
                                            <img src="${pageContext.request.contextPath}/uploads/${candidate.user.profileImage}" alt="Candidate" class="h-full w-full object-cover"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="h-full w-full flex items-center justify-center bg-[#1e3a8a] text-white font-bold text-2xl">
                                                ${fn:substring(candidate.user.fullName, 0, 1)}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                <!-- Info -->
                                <div>
                                    <h3 class="text-[18px] font-bold text-[#1e3a8a] mb-1">${candidate.user.fullName}</h3>
                                    <p class="text-[14px] text-gray-700 mb-2">${candidate.partyName}</p>
                                    
                                    <div class="flex items-center text-[10px] font-bold text-[#1e3a8a] tracking-wide uppercase">
                                        <i class="fa-solid fa-circle-check text-[#1e3a8a] mr-1.5"></i> VERIFIED CANDIDATE
                                    </div>
                                    
                                </div>
                            </div>

                            <!-- Custom Radio Visual -->
                            <div class="flex-shrink-0 pl-4 pr-2">
                                <div class="w-6 h-6 rounded-full border-2 border-gray-300 flex items-center justify-center peer-checked:bg-white transition-colors peer-checked:border-blue-600">
                                    <div class="w-3 h-3 rounded-full bg-transparent peer-checked:bg-blue-600 transition-colors"></div>
                                </div>
                            </div>
                        </div>
                    </label>
                </c:forEach>

                <!-- NOTA Option -->
                <label class="block relative cursor-pointer group opacity-90 hover:opacity-100">
                    <input type="radio" name="candidateId" value="-1" class="peer sr-only radio-custom" required>
                    <div class="bg-gray-50 p-5 rounded-2xl shadow-sm border-[1.5px] border-transparent hover:border-gray-200 transition-all flex items-center justify-between peer-checked:border-gray-400 peer-checked:bg-gray-100 peer-checked:-translate-y-0.5 peer-checked:shadow-md">
                        <div class="flex items-center space-x-6">
                            <div class="h-16 w-16 rounded-full bg-gray-200 flex-shrink-0 flex items-center justify-center text-gray-500 shadow-inner border border-gray-200">
                                <i class="fa-solid fa-ban text-3xl"></i>
                            </div>
                            <div>
                                <h3 class="text-[18px] font-bold text-[#1e3a8a] mb-1">None of the Above (NOTA)</h3>
                                <p class="text-[14px] text-gray-600">Decline all registered candidates</p>
                            </div>
                        </div>
                        <div class="flex-shrink-0 pl-4 pr-2">
                            <div class="w-6 h-6 rounded-full border-2 border-gray-300 flex items-center justify-center peer-checked:bg-white transition-colors peer-checked:border-gray-600">
                                <div class="w-3 h-3 rounded-full bg-transparent peer-checked:bg-gray-600 transition-colors"></div>
                            </div>
                        </div>
                    </div>
                </label>


            </div>

            <!-- Confirmation & Submission -->
            <div class="bg-[#f9fafb] p-8 rounded-2xl text-center mb-16 shadow-none">
                <label class="flex items-center justify-center space-x-3 mb-8 cursor-pointer select-none group w-fit mx-auto">
                    <div class="relative flex items-center">
                        <input type="checkbox" id="confirmCheckbox" class="peer h-5 w-5 border border-gray-300 rounded text-blue-600 outline-none appearance-none checked:bg-blue-600 checked:border-blue-600 focus:ring-2 focus:ring-blue-200 transition">
                        <i class="fa-solid fa-check absolute text-white text-xs left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 opacity-0 peer-checked:opacity-100 pointer-events-none"></i>
                    </div>
                    <span class="text-[14px] text-gray-800 font-medium group-hover:text-[#1e3a8a] transition-colors">I confirm that this is my final selection.</span>
                </label>

                <div class="flex justify-center flex-col items-center">
                    <button type="submit" id="submitBtn" disabled class="bg-[#1e3aa8] hover:bg-[#112466] disabled:opacity-50 disabled:bg-[#1e3a8a]/70 disabled:cursor-not-allowed text-white font-semibold py-3.5 px-32 rounded-xl shadow-[0_4px_14px_0_rgba(30,58,138,0.39)] transition-all inline-flex items-center justify-center space-x-3 text-[16px]">
                        <i class="fa-solid fa-user-check"></i>
                        <span>Cast Vote</span>
                    </button>

                    <div class="mt-6 flex items-center justify-center text-gray-400 text-[10px] font-bold tracking-[0.2em]">
                        SECURE ENCRYPTION ENABLED
                    </div>
                </div>
            </div>
        </form>
    </main>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const confirmCheckbox = document.getElementById('confirmCheckbox');
            const submitBtn = document.getElementById('submitBtn');
            const radioButtons = document.querySelectorAll('input[name="candidateId"]');
            
            function updateSubmitButton() {
                const isCandidateSelected = Array.from(radioButtons).some(radio => radio.checked);
                const isConfirmed = confirmCheckbox.checked;
                
                if (isCandidateSelected && isConfirmed) {
                    submitBtn.removeAttribute('disabled');
                } else {
                    submitBtn.setAttribute('disabled', 'disabled');
                }
            }

            confirmCheckbox.addEventListener('change', updateSubmitButton);
            radioButtons.forEach(radio => radio.addEventListener('change', updateSubmitButton));
            
            // Initialize visual state
            updateSubmitButton();
        });
    </script>
</body>
</html>
