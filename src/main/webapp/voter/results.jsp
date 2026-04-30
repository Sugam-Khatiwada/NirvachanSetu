<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election Results - NirvachanSetu</title>
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
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.0 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
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
                <a href="${pageContext.request.contextPath}/voter/cast-vote" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                    Cast Vote
                </a>
                <a href="${pageContext.request.contextPath}/voter/results" class="sidebar-link-active">
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
                        <span class="text-on-surface font-medium">Results</span>
                    </div>
                    <h2 class="font-manrope text-xl font-bold text-on-surface">Election Results</h2>
                </div>
            </div>
            <button onclick="window.print()" class="btn-outline btn-sm hidden md:inline-flex">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                </svg>
                Print
            </button>
        </header>

        <c:choose>
            <c:when test="${empty completedElections}">

                <!-- No Results Available -->
                <div class="card text-center py-16 px-6 animate-fade-in-up">
                    <div class="w-20 h-20 bg-surface-container-low rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-on-surface-variant opacity-50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                        </svg>
                    </div>
                    <h3 class="font-manrope text-xl font-semibold text-on-surface mb-2">Results Not Yet Published</h3>
                    <p class="text-on-surface-variant max-w-md mx-auto">
                        Election results have not been published yet. Results will be made available after the vote counting process is complete and officially certified by the Election Commission.
                    </p>
                    <div class="flex flex-col sm:flex-row gap-3 justify-center mt-6">
                        <a href="${pageContext.request.contextPath}/voter/dashboard" class="btn-primary justify-center mx-auto">
                            Return to Dashboard
                        </a>
                    </div>
                </div>

            </c:when>
            <c:otherwise>

                <!-- Election Results -->
                <c:forEach var="election" items="${completedElections}" varStatus="loop">

                    <c:set var="candidates" value="${electionResults[election]}" />
                    <c:set var="totalVotes" value="${voteCounts[election.id]}" />

                    <!-- Election Header Card -->
                    <div class="card mb-6 animate-fade-in">
                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                            <div>
                                <h3 class="font-manrope text-lg font-bold text-on-surface">${election.name}</h3>
                                <div class="flex items-center gap-3 mt-2">
                                    <c:choose>
                                        <c:when test="${election.electionType == 'HOR'}"><span class="badge-blue">House of Representatives</span></c:when>
                                        <c:when test="${election.electionType == 'PROVINCIAL'}"><span class="badge-orange">Provincial</span></c:when>
                                        <c:otherwise><span class="badge-green">Local</span></c:otherwise>
                                    </c:choose>
                                    <span class="text-xs text-on-surface-variant">${election.startDateFormatted} - ${election.endDateFormatted}</span>
                                </div>
                            </div>
                            <div class="flex items-center gap-3">
                                <span class="badge badge-green">Published</span>
                                <span class="text-sm text-on-surface-variant">Total Votes: <strong class="text-on-surface">${empty totalVotes ? 0 : totalVotes}</strong></span>
                            </div>
                        </div>
                    </div>

                    <c:if test="${not empty candidates}">

                        <!-- Winner Highlight -->
                        <c:if test="${candidates[0].totalVotes > 0}">
                        <div class="bg-gradient-primary rounded-2xl p-6 md:p-8 mb-6 text-white relative overflow-hidden animate-fade-in-up">
                            <div class="absolute top-0 right-0 w-48 h-48 bg-white opacity-5 rounded-full -translate-y-1/2 translate-x-1/4"></div>
                            <div class="relative z-10">
                                <div class="flex items-center gap-2 mb-4">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"/>
                                    </svg>
                                    <span class="text-sm uppercase tracking-wider opacity-80">Election Winner</span>
                                </div>
                                <div class="flex items-center gap-4">
                                    <div class="avatar avatar-2xl bg-white/20">
                                        ${fn:substring(candidates[0].user.fullName, 0, 1)}
                                    </div>
                                    <div>
                                        <h3 class="font-manrope text-2xl font-bold">${candidates[0].user.fullName}</h3>
                                        <p class="opacity-90">${candidates[0].partyName} ${not empty candidates[0].symbol ? '- ' : ''}${candidates[0].symbol}</p>
                                        <div class="flex items-center gap-4 mt-2">
                                            <c:choose>
                                                <c:when test="${totalVotes > 0}">
                                                    <c:set var="winnerPct" value="${(candidates[0].totalVotes * 100.0) / totalVotes}" />
                                                    <span class="text-2xl font-bold">${candidates[0].totalVotes} votes</span>
                                                    <span class="bg-white/20 rounded-full px-3 py-1 text-sm font-medium">${winnerPct < 1 ? '0' : ''}${winnerPct}%</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-2xl font-bold">${candidates[0].totalVotes} votes</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>

                        <!-- Results Table -->
                        <div class="table-container mb-6 animate-fade-in">
                            <div class="table-header flex items-center gap-4">
                                <span class="flex-1">Rank</span>
                                <span class="flex-1">Candidate</span>
                                <span class="flex-1 hidden md:block">Party</span>
                                <span class="text-right w-24">Votes</span>
                                <span class="text-right w-20 hidden sm:block">Share</span>
                            </div>

                            <c:forEach var="cand" items="${candidates}" varStatus="rank">
                                <c:choose>
                                    <c:when test="${totalVotes > 0}">
                                        <c:set var="pct" value="${(cand.totalVotes * 100.0) / totalVotes}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="pct" value="0" />
                                    </c:otherwise>
                                </c:choose>

                                <div class="table-row">
                                    <div class="flex items-center gap-4">
                                        <!-- Rank -->
                                        <div class="flex-1 flex items-center gap-2">
                                            <span class="w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold flex-shrink-0
                                                ${rank.index == 0 ? 'bg-yellow-100 text-yellow-700' : rank.index == 1 ? 'bg-gray-100 text-gray-600' : rank.index == 2 ? 'bg-orange-100 text-orange-700' : 'bg-surface-container-low text-on-surface-variant'}">
                                                ${rank.index + 1}
                                            </span>
                                        </div>

                                        <!-- Candidate -->
                                        <div class="flex-1 flex items-center gap-2 min-w-0">
                                            <div class="avatar avatar-sm flex-shrink-0">
                                                ${fn:substring(cand.user.fullName, 0, 1)}
                                            </div>
                                            <span class="text-sm font-medium truncate">${cand.user.fullName}</span>
                                        </div>

                                        <!-- Party -->
                                        <div class="flex-1 hidden md:block">
                                            <span class="text-sm text-on-surface-variant">${cand.partyName}</span>
                                        </div>

                                        <!-- Votes -->
                                        <div class="text-right w-24">
                                            <span class="text-sm font-semibold">${cand.totalVotes}</span>
                                        </div>

                                        <!-- Share -->
                                        <div class="text-right w-20 hidden sm:block">
                                            <span class="text-sm font-medium ${rank.index == 0 ? 'text-green-600' : 'text-on-surface-variant'}">${pct < 1 ? '0' : ''}${pct}%</span>
                                        </div>
                                    </div>

                                    <!-- Vote Bar -->
                                    <div class="mt-3">
                                        <div class="progress-bar">
                                            <div class="progress-bar-fill ${rank.index == 0 ? 'progress-bar-fill-green' : ''}" style="width: ${pct < 1 ? '0' : ''}${pct}%"></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Horizontal Bar Chart -->
                        <div class="card mb-8">
                            <h4 class="section-title text-base mb-4">Vote Distribution</h4>
                            <div class="flex flex-col gap-4">
                                <c:forEach var="cand" items="${candidates}" varStatus="rank">
                                    <div class="flex items-center gap-3">
                                        <div class="w-28 md:w-40 flex-shrink-0">
                                            <p class="text-sm font-medium text-on-surface truncate">${cand.user.fullName}</p>
                                            <p class="text-xs text-on-surface-variant truncate">${cand.partyName}</p>
                                        </div>
                                        <div class="flex-1">
                                            <c:choose>
                                                <c:when test="${rank.index == 0}">
                                                    <div class="chart-bar chart-bar-green" style="width: ${pct < 1 ? '0' : ''}${pct}%">
                                                        <span class="text-xs font-semibold text-white whitespace-nowrap">${pct < 1 ? '0' : ''}${pct}%</span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${rank.index == 1}">
                                                    <div class="chart-bar" style="width: ${pct < 1 ? '0' : ''}${pct}%">
                                                        <span class="text-xs font-semibold text-white whitespace-nowrap">${pct < 1 ? '0' : ''}${pct}%</span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${rank.index == 2}">
                                                    <div class="chart-bar chart-bar-orange" style="width: ${pct < 1 ? '0' : ''}${pct}%">
                                                        <span class="text-xs font-semibold text-white whitespace-nowrap">${pct < 1 ? '0' : ''}${pct}%</span>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="chart-bar chart-bar-purple" style="width: ${pct < 1 ? '0' : ''}${pct}%">
                                                        <span class="text-xs font-semibold text-white whitespace-nowrap">${pct < 1 ? '0' : ''}${pct}%</span>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="w-16 text-right flex-shrink-0">
                                            <span class="text-sm font-semibold text-on-surface">${cand.totalVotes}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </c:if>
                    <c:if test="${empty candidates}">
                        <div class="card text-center py-8 mb-8">
                            <p class="text-sm text-on-surface-variant">No candidate data available for this election.</p>
                        </div>
                    </c:if>

                </c:forEach>

            </c:otherwise>
        </c:choose>

        <!-- Footer -->
        <footer class="text-center py-6 text-sm text-on-surface-variant mt-8">
            <p>&copy; 2025 NirvachanSetu &mdash; Election Commission of Nepal. All rights reserved.</p>
        </footer>
    </main>

    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
