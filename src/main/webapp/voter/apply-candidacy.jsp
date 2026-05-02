<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Candidacy - NirvachanSetu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>
<body class="bg-background font-inter text-on-surface">

    <jsp:include page="/layout/header.jsp" />

    

    <!-- Sidebar Overlay (mobile) -->
    <div id="sidebar-overlay" class="sidebar-overlay"></div>

    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar">
        <div class="p-6">
            <!-- Logo -->
            <div class="flex items-center gap-3 mb-8">
                <div class="w-10 h-10 bg-gradient-primary rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6 text-white mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                </div>
                <div>
                    <h1 class="font-manrope text-lg font-bold text-primary leading-tight">NirvachanSetu</h1>
                    <p class="text-xs text-on-surface-variant">Election Portal</p>
                </div>
            </div>

            <!-- User Info -->
            <div class="flex items-center gap-3 p-3 bg-surface-container-low rounded-xl mb-6">
                <div class="avatar">
                    <c:choose>
                        <c:when test="${not empty user.profileImage}">
                            <img src="${pageContext.request.contextPath}/images/profiles/${user.profileImage}" alt="Profile">
                        </c:when>
                        <c:otherwise>
                            ${fn:substring(user.fullName, 0, 1)}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-semibold text-on-surface truncate">${user.fullName}</p>
                    <p class="text-xs text-on-surface-variant truncate">${user.email}</p>
                </div>
            </div>

            <!-- Navigation -->
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
                <a href="${pageContext.request.contextPath}/voter/results" class="sidebar-link">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                    Results
                </a>

                <div class="divider my-4"></div>

                <a href="${pageContext.request.contextPath}/voter/apply-candidacy" class="sidebar-link-active">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                    Apply for Candidacy
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
                        <span class="text-on-surface font-medium">Apply for Candidacy</span>
                    </div>
                    <h2 class="font-manrope text-xl font-bold text-on-surface">Apply for Candidacy</h2>
                </div>
            </div>
        </header>

        <!-- Success Message -->
        <c:if test="${not empty sessionScope.success}">
            <div class="mb-6 p-4 rounded-xl bg-green-50 flex items-start gap-3 animate-fade-in">
                <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
                </svg>
                <p class="text-sm text-green-700">${sessionScope.success}</p>
            </div>
            <c:remove var="success" scope="session"/>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty sessionScope.error}">
            <div class="mb-6 p-4 rounded-xl bg-red-50 flex items-start gap-3 animate-fade-in">
                <svg class="w-5 h-5 text-red-500 flex-shrink-0 mt-0.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/>
                </svg>
                <p class="text-sm text-red-700">${sessionScope.error}</p>
            </div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <!-- Info Banner -->
        <div class="bg-gradient-hero rounded-2xl p-6 mb-6 text-white relative overflow-hidden animate-fade-in">
            <div class="absolute top-0 right-0 w-64 h-64 bg-white opacity-5 rounded-full -translate-y-1/2 translate-x-1/3"></div>
            <div class="relative z-10">
                <div class="flex items-center gap-3 mb-3">
                    <div class="w-12 h-12 bg-white/10 rounded-xl flex items-center justify-center">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                    </div>
                    <div>
                        <h3 class="font-manrope font-bold text-lg">Become a Candidate</h3>
                        <p class="text-sm opacity-80">Apply to stand in the upcoming election</p>
                    </div>
                </div>
                <p class="text-sm opacity-90 max-w-2xl">
                    As a registered voter, you can apply to become a candidate for the upcoming election.
                    If approved by the Election Commission, your role will change to Candidate.
                    When voting begins, you will automatically revert to Voter status.
                </p>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty activeApplications}">

                <!-- Active Application Status (blocks form) -->
                <div class="card mb-6 animate-fade-in">
                    <div class="flex items-center justify-between mb-6">
                        <h3 class="section-title">
                            <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            Your Application Status
                        </h3>
                    </div>

                    <c:forEach var="application" items="${activeApplications}">
                        <div class="bg-surface-container-low rounded-xl p-5 mb-4">
                            <div class="flex items-center justify-between mb-4">
                                <h4 class="font-semibold text-on-surface">${application.election.name}</h4>
                                <c:choose>
                                    <c:when test="${application.status == 'APPROVED'}">
                                        <span class="badge badge-green text-sm">
                                            <span class="dot-green"></span>
                                            Approved
                                        </span>
                                    </c:when>
                                    <c:when test="${application.status == 'PENDING'}">
                                        <span class="badge badge-yellow text-sm">
                                            <span class="dot-yellow"></span>
                                            Under Review
                                        </span>
                                    </c:when>
                                    <c:when test="${application.status == 'REJECTED'}">
                                        <span class="badge badge-red text-sm">
                                            <span class="dot-red"></span>
                                            Rejected
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-slate text-sm">${application.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                                <div>
                                    <p class="text-xs text-on-surface-variant uppercase tracking-wider mb-1">Party</p>
                                    <p class="text-sm font-semibold text-on-surface">${application.partyName}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-on-surface-variant uppercase tracking-wider mb-1">Constituency</p>
                                    <p class="text-sm font-semibold text-on-surface">${application.constituency.name}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-on-surface-variant uppercase tracking-wider mb-1">Symbol</p>
                                    <p class="text-sm font-semibold text-on-surface">${empty application.symbol ? 'Not specified' : application.symbol}</p>
                                </div>
                                <div>
                                    <p class="text-xs text-on-surface-variant uppercase tracking-wider mb-1">Submitted On</p>
                                    <p class="text-sm font-semibold text-on-surface">${application.appliedAtFormatted}</p>
                                </div>
                            </div>

                            <!-- Status Messages -->
                            <c:if test="${application.status == 'APPROVED'}">
                                <div class="alert alert-success mt-4">
                                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                    </svg>
                                    <p class="text-sm">Your application has been approved. Your role has been changed to Candidate. Once voting begins, you will revert to Voter.</p>
                                </div>
                            </c:if>
                            <c:if test="${application.status == 'PENDING'}">
                                <div class="alert alert-warning mt-4">
                                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                    </svg>
                                    <p class="text-sm">Your application is under review by the Election Commission. You will be notified once a decision is made.</p>
                                </div>
                            </c:if>
                            <c:if test="${application.status == 'REJECTED'}">
                                <div class="alert alert-error mt-4">
                                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                    </svg>
                                    <p class="text-sm">Your application was not approved. Please contact the Election Commission for more information.</p>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>

                    <a href="${pageContext.request.contextPath}/voter/dashboard" class="btn-outline btn-sm">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                        </svg>
                        Back to Dashboard
                    </a>
                </div>

            </c:when>
            <c:otherwise>

                <!-- Past Applications (for completed elections - shown as history) -->
                <c:if test="${not empty existingApplications}">
                <div class="card mb-6 animate-fade-in">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="section-title text-base">
                            <svg class="w-5 h-5 text-on-surface-variant" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            Past Election Applications
                        </h3>
                        <span class="badge badge-gray text-xs">History</span>
                    </div>
                    <div class="space-y-3">
                        <c:forEach var="application" items="${existingApplications}">
                            <div class="bg-surface-container-low rounded-xl p-4 flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-on-surface">${application.election.name}</p>
                                    <p class="text-xs text-on-surface-variant">${application.partyName} ${not empty application.symbol ? '- ' : ''}${application.symbol}</p>
                                </div>
                                <div class="text-right">
                                    <c:choose>
                                        <c:when test="${application.status == 'APPROVED'}">
                                            <span class="badge badge-green text-xs">Approved</span>
                                        </c:when>
                                        <c:when test="${application.status == 'PENDING'}">
                                            <span class="badge badge-yellow text-xs">Under Review</span>
                                        </c:when>
                                        <c:when test="${application.status == 'REJECTED'}">
                                            <span class="badge badge-red text-xs">Rejected</span>
                                        </c:when>
                                        <c:when test="${application.status == 'WITHDRAWN'}">
                                            <span class="badge badge-gray text-xs">Withdrawn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-slate text-xs">${application.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                </c:if>

                <!-- Application Form -->
                <div class="card animate-fade-in">
                    <h3 class="section-title mb-2">
                        <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        Candidacy Application Form
                    </h3>
                    <p class="text-sm text-on-surface-variant mb-6">Complete the form below to apply as a candidate in an upcoming election.</p>

                    <c:if test="${empty elections}">
                        <div class="bg-surface-container-low rounded-xl p-6 text-center">
                            <svg class="w-12 h-12 text-on-surface-variant/40 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <p class="text-sm text-on-surface-variant font-medium">No Elections Available</p>
                            <p class="text-xs text-on-surface-variant mt-1">There are currently no elections accepting candidate applications. Please check back later.</p>
                        </div>
                    </c:if>

                    <c:if test="${not empty elections}">
                        <form action="${pageContext.request.contextPath}/voter/apply-candidacy" method="post" data-validate>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                                <!-- Election -->
                                <div class="form-group">
                                    <label for="electionId" class="form-label">Select Election *</label>
                                    <select id="electionId" name="electionId" class="select-field" required>
                                        <option value="" disabled selected>Choose an election</option>
                                        <c:forEach var="election" items="${elections}">
                                            <option value="${election.id}">${election.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Constituency -->
                                <div class="form-group">
                                    <label for="constituencyId" class="form-label">Select Constituency *</label>
                                    <select id="constituencyId" name="constituencyId" class="select-field" required>
                                        <option value="" disabled selected>Choose a constituency</option>
                                        <c:forEach var="constituency" items="${constituencies}">
                                            <option value="${constituency.id}">${constituency.name} - ${constituency.district}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Party Name -->
                                <div class="form-group">
                                    <label for="partyName" class="form-label">Party Name *</label>
                                    <input type="text" id="partyName" name="partyName" class="input-field"
                                           required minlength="2" placeholder="Enter your party name">
                                </div>

                                <!-- Party Type -->
                                <div class="form-group">
                                    <label for="partyType" class="form-label">Party Type *</label>
                                    <select id="partyType" name="partyType" class="select-field" required>
                                        <option value="" disabled selected>Select party type</option>
                                        <option value="NATIONAL">National Party</option>
                                        <option value="REGIONAL">Regional Alliance</option>
                                        <option value="INDEPENDENT">Independent</option>
                                    </select>
                                </div>

                                <!-- Symbol -->
                                <div class="form-group md:col-span-2">
                                    <label for="symbol" class="form-label">Election Symbol</label>
                                    <input type="text" id="symbol" name="symbol" class="input-field"
                                           placeholder="Enter your election symbol (e.g., Sun, Tree, Lotus)">
                                </div>

                                <!-- Manifesto -->
                                <div class="form-group md:col-span-2">
                                    <label for="manifesto" class="form-label">Manifesto *</label>
                                    <textarea id="manifesto" name="manifesto" class="textarea-field" rows="8"
                                              required minlength="50"
                                              data-max-chars="5000"
                                              placeholder="Describe your vision, policies, and plans for the constituency. Minimum 50 characters..."
                                    ></textarea>
                                    <p id="manifesto-char-counter" class="text-xs text-on-surface-variant mt-1">5000 characters remaining</p>
                                </div>
                            </div>

                            <!-- Submit -->
                            <div class="flex flex-col sm:flex-row gap-3 mt-8 pt-6">
                                <button type="submit" class="btn-primary btn-lg justify-center">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/>
                                    </svg>
                                    Submit Application
                                </button>
                                <a href="${pageContext.request.contextPath}/voter/dashboard" class="btn-outline justify-center">
                                    Cancel
                                </a>
                            </div>
                        </form>
                    </c:if>
                </div>

                <!-- Requirements Info -->
                <div class="card mt-6 animate-fade-in">
                    <h4 class="section-title text-base mb-4">
                        <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                        Application Requirements
                    </h4>
                    <ul class="flex flex-col gap-3">
                        <li class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <span class="text-sm text-on-surface-variant">Must be a registered and approved voter</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <span class="text-sm text-on-surface-variant">Must be at least 25 years of age on the date of election</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <span class="text-sm text-on-surface-variant">Must not have been convicted of a criminal offense involving moral turpitude</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <span class="text-sm text-on-surface-variant">Must provide a comprehensive manifesto outlining campaign goals</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-blue-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            <span class="text-sm text-on-surface-variant">Upon approval, your role changes to Candidate. When voting begins, you automatically revert to Voter.</span>
                        </li>
                    </ul>
                </div>

            </c:otherwise>
        </c:choose>

    </main>

    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
