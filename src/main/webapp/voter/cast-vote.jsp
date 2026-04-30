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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>
<body class="bg-background font-inter text-on-surface">

    <!-- Sidebar Overlay (mobile) -->
    <div id="sidebar-overlay" class="sidebar-overlay"></div>

    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar">
        <div class="p-6">
            <div class="flex items-center gap-3 mb-8">
                <div class="w-10 h-10 bg-gradient-primary rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                </div>
                <div>
                    <h1 class="font-manrope text-lg font-bold text-primary leading-tight">NirvachanSetu</h1>
                    <p class="text-xs text-on-surface-variant">Election Portal</p>
                </div>
            </div>

            <div class="flex items-center gap-3 p-3 bg-surface-container-low rounded-xl mb-6">
                <div class="avatar">
                    ${fn:substring(user.fullName, 0, 1)}
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-semibold text-on-surface truncate">${user.fullName}</p>
                    <p class="text-xs text-on-surface-variant truncate">${user.email}</p>
                </div>
            </div>

            <nav class="flex flex-col gap-1">
                <a href="${pageContext.request.contextPath}/voter/dashboard" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                    </svg>
                    Dashboard
                </a>
                <a href="${pageContext.request.contextPath}/voter/candidates" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                    </svg>
                    Candidates
                </a>
                <a href="${pageContext.request.contextPath}/voter/cast-vote" class="sidebar-link-active">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                    Cast Vote
                </a>
                <a href="${pageContext.request.contextPath}/voter/results" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                    Results
                </a>
                <div class="divider my-4"></div>
                <a href="${pageContext.request.contextPath}/voter/profile" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                    My Profile
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="sidebar-link text-red-500">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
                    </svg>
                    Logout
                </a>
            </nav>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">

        <!-- Navbar -->
        <header class="navbar rounded-xl mb-6">
            <div class="flex items-center gap-3">
                <button id="sidebar-toggle" class="btn-icon lg:hidden">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                    </svg>
                </button>
                <div>
                    <div class="flex items-center gap-2 text-sm text-on-surface-variant">
                        <a href="${pageContext.request.contextPath}/voter/dashboard" class="hover:text-primary transition-colors">Dashboard</a>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                        <span class="text-on-surface font-medium">Cast Vote</span>
                    </div>
                    <h2 class="font-manrope text-xl font-bold text-on-surface flex items-center gap-2">
                        <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                        </svg>
                        Cast Your Vote
                    </h2>
                </div>
            </div>
            <div class="hidden md:flex items-center gap-2">
                <div class="w-2 h-2 rounded-full bg-green-500 animate-pulse"></div>
                <span class="text-sm text-on-surface-variant">Secure Voting Active</span>
            </div>
        </header>

        <!-- Privacy Alert -->
        <div class="alert alert-info mb-6 animate-fade-in">
            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
            </svg>
            <div>
                <p class="font-semibold text-sm">Your Vote is Completely Anonymous</p>
                <p class="text-sm opacity-80 mt-0.5">Your identity will <strong>NOT</strong> be linked to your vote. This system uses end-to-end encryption to ensure ballot secrecy as required by election law.</p>
            </div>
        </div>

        <c:choose>
            <c:when test="${alreadyVoted}">

                <!-- Already Voted Success State -->
                <div class="card text-center py-12 px-6 animate-fade-in-up max-w-lg mx-auto">
                    <div class="w-20 h-20 bg-green-50 rounded-full flex items-center justify-center mx-auto mb-6">
                        <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <h3 class="font-manrope text-2xl font-bold text-on-surface mb-3">Vote Successfully Cast</h3>
                    <p class="text-on-surface-variant mb-6">
                        You have already cast your vote in this election. Thank you for participating in democracy!
                    </p>
                    <div class="bg-surface-container-low rounded-xl p-4 mb-6">
                        <div class="flex items-center justify-center gap-2 text-sm">
                            <span class="dot-green"></span>
                            <span class="font-medium text-on-surface">Your vote has been securely recorded</span>
                        </div>
                    </div>
                    <div class="flex flex-col sm:flex-row gap-3 justify-center">
                        <a href="${pageContext.request.contextPath}/voter/results" class="btn-primary justify-center">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                            </svg>
                            View Results
                        </a>
                        <a href="${pageContext.request.contextPath}/voter/dashboard" class="btn-outline justify-center">
                            Back to Dashboard
                        </a>
                    </div>
                </div>

            </c:when>
            <c:otherwise>

                <!-- Voting Form -->
                <form id="vote-form" action="${pageContext.request.contextPath}/voter/cast-vote" method="post">
                    <input type="hidden" name="electionId" value="${election.id}">

                    <!-- Election Info Card -->
                    <div class="card mb-6 animate-fade-in">
                        <div class="flex flex-col sm:flex-row sm:items-center gap-4">
                            <div class="w-12 h-12 bg-primary-light rounded-xl flex items-center justify-center flex-shrink-0">
                                <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                </svg>
                            </div>
                            <div class="flex-1">
                                <h4 class="font-manrope font-semibold text-on-surface">${election.name}</h4>
                                <p class="text-sm text-on-surface-variant">
                                    ${election.startDateFull}
                                    &nbsp;&bull;&nbsp; ${user.constituency.name}, ${user.constituency.district}
                                </p>
                            </div>
                            <span class="badge badge-green">Polling Open</span>
                        </div>
                    </div>

                    <!-- Instructions -->
                    <div class="flex items-center gap-2 mb-4">
                        <span class="text-sm font-medium text-on-surface">Step 1:</span>
                        <span class="text-sm text-on-surface-variant">Select a candidate from the list below</span>
                    </div>

                    <!-- Candidate Selection Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-8">

                        <c:forEach var="candidate" items="${candidates}">
                            <div class="radio-card card candidate-card cursor-pointer"
                                 data-candidate-card
                                 data-candidate-name="${candidate.user.fullName}"
                                 data-candidate-display-name="${candidate.user.fullName}">

                                <input type="radio" name="candidateId" value="${candidate.id}" id="candidate-${candidate.id}" required>

                                <!-- Profile -->
                                <div class="flex items-center gap-3 mb-3">
                                    <div class="avatar avatar-lg flex-shrink-0">
                                        <c:choose>
                                            <c:when test="${not empty candidate.user.profileImage}">
                                                <img src="${pageContext.request.contextPath}/images/profiles/${candidate.user.profileImage}" alt="${candidate.user.fullName}">
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(candidate.user.fullName, 0, 1)}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="flex-1 min-w-0">
                                        <h4 class="font-manrope font-semibold text-on-surface" data-candidate-display-name>${candidate.user.fullName}</h4>
                                        <p class="text-sm text-on-surface-variant">${candidate.partyName}</p>
                                    </div>
                                </div>

                                <!-- Party Badge & Symbol -->
                                <div class="flex items-center gap-2 mb-2">
                                    <c:choose>
                                        <c:when test="${candidate.partyType == 'NATIONAL'}">
                                            <span class="badge badge-blue">NATIONAL</span>
                                        </c:when>
                                        <c:when test="${candidate.partyType == 'REGIONAL'}">
                                            <span class="badge badge-orange">REGIONAL</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-gray">INDEPENDENT</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${not empty candidate.symbol}">
                                        <span class="text-lg">${candidate.symbol}</span>
                                    </c:if>
                                </div>

                                <!-- Radio indicator -->
                                <div class="flex items-center justify-end">
                                    <div class="w-5 h-5 rounded-full border-2 border-gray-300 flex items-center justify-center radio-indicator">
                                        <div class="w-2.5 h-2.5 rounded-full bg-primary scale-0 transition-transform"></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Confirmation Section -->
                    <div class="card bg-surface-container-low animate-fade-in" id="vote-confirmation-section">
                        <div class="flex items-center gap-2 mb-4">
                            <span class="text-sm font-medium text-on-surface">Step 2:</span>
                            <span class="text-sm text-on-surface-variant">Confirm your vote</span>
                        </div>

                        <!-- Selected Candidate Display -->
                        <div class="bg-white rounded-xl p-4 mb-4">
                            <p class="text-sm text-on-surface-variant mb-1">You are about to vote for:</p>
                            <p class="font-manrope text-xl font-bold text-primary" id="selected-candidate-name">No candidate selected</p>
                        </div>

                        <!-- Warning -->
                        <div class="alert alert-warning mb-6">
                            <svg class="w-5 h-5 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z"/>
                            </svg>
                            <p class="text-sm">
                                <strong>This action cannot be undone.</strong> Once confirmed, your vote will be permanently recorded and cannot be changed.
                            </p>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex flex-col sm:flex-row gap-3">
                            <button type="button" id="confirm-vote-btn" class="btn-primary btn-xl flex-1 justify-center">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                Confirm Vote
                            </button>
                            <a href="${pageContext.request.contextPath}/voter/dashboard" class="btn-outline flex-1 justify-center">
                                Cancel
                            </a>
                        </div>
                    </div>
                </form>

                <!-- Vote Confirmation Modal -->
                <div id="vote-confirm-modal" class="modal-overlay">
                    <div class="modal-content text-center">
                        <div class="w-16 h-16 bg-primary-light rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                            </svg>
                        </div>
                        <h3 class="font-manrope text-xl font-bold text-on-surface mb-2">Confirm Your Vote</h3>
                        <p class="text-on-surface-variant mb-1">Are you sure you want to vote for:</p>
                        <p class="font-manrope text-lg font-bold text-primary mb-4" id="modal-candidate-name">--</p>
                        <p class="text-sm text-red-600 font-medium mb-6">This action is final and cannot be undone.</p>
                        <div class="flex gap-3">
                            <button type="button" id="vote-proceed-btn" class="btn-primary flex-1 justify-center">
                                Yes, Cast My Vote
                            </button>
                            <button type="button" id="vote-cancel-btn" class="btn-outline flex-1 justify-center">
                                Go Back
                            </button>
                        </div>
                    </div>
                </div>

            </c:otherwise>
        </c:choose>

        <!-- Footer -->
        <footer class="text-center py-6 text-sm text-on-surface-variant mt-8">
            <p>&copy; 2025 NirvachanSetu &mdash; Election Commission of Nepal. All rights reserved.</p>
        </footer>
    </main>

    <script src="${pageContext.request.contextPath}/js/app.js?v=2"></script>
</body>
</html>
