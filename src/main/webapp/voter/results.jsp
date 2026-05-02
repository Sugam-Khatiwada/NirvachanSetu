<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>National Results Dashboard - NirvachanSetu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background-color: #f4f7f9; }
        .text-primary-dark { color: #1a237e; }
        .bg-primary-dark { background-color: #1a2b6d; }
        .bg-primary { background-color: #2563eb; }
        .card { background-color: #ffffff; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05); padding: 1.5rem; }
    </style>
</head>
<body class="bg-gray-50 text-gray-800">

    <!-- Navigation Bar -->
    <c:set var="activePage" value="results" scope="request" />
    <jsp:include page="../layout/header.jsp" />

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-6 py-8">
        
        <!-- Page Header -->
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-8 gap-4">
            <div>
                <p class="text-sm font-bold text-gray-500 tracking-widest uppercase mb-1">LIVE ELECTION FEED</p>
                <h1 class="text-3xl font-extrabold text-primary-dark tracking-tight">National Results Dashboard</h1>
            </div>
            <div class="flex items-center gap-4">
                <div class="bg-white px-4 py-2 rounded-full shadow-sm border border-gray-100 flex items-center gap-2 text-sm font-bold text-gray-700">
                    <span class="w-2 h-2 rounded-full bg-red-500 animate-pulse"></span>
                    Live Updates: 14:02 IST
                </div>
                <button class="bg-primary-dark text-white px-5 py-2 rounded-lg text-sm font-semibold flex items-center gap-2 hover:bg-blue-900 transition-colors shadow-sm">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                    Export Report
                </button>
            </div>
        </div>

        <!-- Dynamic Results Content -->
        <c:choose>
            <c:when test="${empty completedElections}">
                <!-- Empty State -->
                <div class="card p-12 text-center flex flex-col items-center justify-center min-h-[400px]">
                    <svg class="w-16 h-16 text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                    <h2 class="text-2xl font-bold text-gray-700 mb-2">No Results Available</h2>
                    <p class="text-gray-500 max-w-md mx-auto">There are currently no completed elections with published results. Please check back later when an election concludes.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="election" items="${completedElections}">
                    <c:set var="results" value="${electionResults[election]}" />
                    <c:set var="totalVotes" value="${voteCounts[election.id]}" />
                    
                    <div class="mb-12">
                        <div class="flex items-center justify-between mb-6">
                            <h2 class="text-2xl font-extrabold text-primary-dark">${election.name} Results</h2>
                            <span class="bg-green-100 text-green-800 text-xs font-bold px-3 py-1 rounded-full uppercase tracking-wide">Final Results</span>
                        </div>
                        
                        <!-- Stats Summary for this election -->
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                            <div class="card flex flex-col justify-center">
                                <h3 class="text-sm font-medium text-gray-500 mb-1">Total Votes Cast</h3>
                                <p class="text-3xl font-bold text-primary-dark">${totalVotes}</p>
                            </div>
                            <div class="card flex flex-col justify-center">
                                <h3 class="text-sm font-medium text-gray-500 mb-1">Election Type</h3>
                                <p class="text-xl font-bold text-primary-dark">${election.electionType}</p>
                            </div>
                            <div class="card flex flex-col justify-center">
                                <h3 class="text-sm font-medium text-gray-500 mb-1">Participating Candidates</h3>
                                <p class="text-3xl font-bold text-primary-dark">${fn:length(results)}</p>
                            </div>
                            <div class="card flex flex-col justify-center">
                                <h3 class="text-sm font-medium text-gray-500 mb-1">Concluded Date</h3>
                                <p class="text-xl font-bold text-primary-dark">${election.endDateFormatted}</p>
                            </div>
                        </div>

                        <!-- Candidates Results List -->
                        <div class="card p-0 overflow-hidden mb-8 shadow-sm border border-gray-100">
                            <div class="px-6 py-4 border-b border-gray-100 bg-gray-50">
                                <h3 class="font-bold text-gray-700">Candidate Standings</h3>
                            </div>
                            <div class="divide-y divide-gray-100">
                                <c:choose>
                                    <c:when test="${empty results}">
                                        <div class="p-8 text-center text-gray-500">No candidate results available for this election.</div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="candidate" items="${results}" varStatus="status">
                                            <!-- Calculate percentage -->
                                            <c:set var="percentage" value="${totalVotes > 0 ? (candidate.totalVotes * 100.0) / totalVotes : 0}" />
                                            
                                            <div class="p-6 flex flex-col md:flex-row md:items-center gap-6 hover:bg-gray-50 transition-colors">
                                                <div class="flex items-center gap-4 flex-1">
                                                    <div class="w-14 h-14 rounded-full overflow-hidden bg-gray-200 flex-shrink-0 border-2 border-gray-100">
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
                                                        <h4 class="font-bold text-gray-900 text-lg">${candidate.user.fullName}</h4>
                                                        <p class="text-sm text-gray-500">${candidate.partyName}</p>
                                                    </div>
                                                </div>
                                                
                                                <div class="flex-1 w-full max-w-md">
                                                    <div class="flex justify-between text-sm mb-1.5">
                                                        <span class="font-semibold text-primary-dark">${candidate.totalVotes} votes</span>
                                                        <span class="font-bold text-gray-600"><fmt:formatNumber value="${percentage}" maxFractionDigits="1"/>%</span>
                                                    </div>
                                                    <div class="w-full bg-gray-200 h-2.5 rounded-full overflow-hidden">
                                                        <div class="bg-[#1e3a8a] h-full rounded-full transition-all duration-1000" style="width: ${percentage}%"></div>
                                                    </div>
                                                </div>
                                                
                                                <div class="w-24 text-right flex justify-end">
                                                    <c:if test="${status.index == 0 && candidate.totalVotes > 0}">
                                                        <span class="bg-yellow-100 text-yellow-800 text-xs font-bold px-3 py-1.5 rounded-md border border-yellow-200 flex items-center gap-1.5 shadow-sm">
                                                            <i class="fas fa-trophy"></i> WINNER
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="../layout/footer.jsp" />

    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
