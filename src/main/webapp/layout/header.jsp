<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<header class="bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm">
    <nav class="px-6 py-3">
        <div class="flex items-center justify-between">
            <!-- Left: Logo -->
            <div class="flex items-center">
                <a href="${pageContext.request.contextPath}/" class="flex items-center gap-2 no-underline">
                    <span class="font-bold text-base text-blue-900">NirvachanSetu</span>
                </a>
            </div>

            <!-- Center: Navigation Links -->
            <div class="flex items-center gap-8">
                <c:choose>
                    <c:when test="${sessionScope.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'dashboard' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Admin Dashboard</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'CANDIDATE'}">
                        <a href="${pageContext.request.contextPath}/candidate/dashboard" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'dashboard' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Candidate Dashboard</a>
                        <a href="${pageContext.request.contextPath}/voter/cast-vote" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'vote' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Vote</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/voter/dashboard" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'dashboard' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/voter/candidates" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'candidates' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Candidates</a>
                        <a href="${pageContext.request.contextPath}/voter/cast-vote" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'vote' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Vote</a>
                        <a href="${pageContext.request.contextPath}/voter/results" class="text-sm font-medium hover:text-blue-700 transition-colors ${requestScope.activePage == 'results' ? 'text-gray-700 font-semibold pb-1 border-b-2 border-blue-700' : 'text-gray-600'}">Results</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Right: Search & Avatar -->
            <div class="flex items-center gap-4">
                <!-- Search Bar -->
                <div class="relative">
                    <input type="text" placeholder="Search elections..." class="bg-gray-100 text-gray-700 text-sm rounded-md py-2 px-3 w-48 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:bg-white transition-all">
                </div>

                <!-- Notification Bell -->
                <button class="relative text-gray-600 hover:text-blue-700 transition-colors">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"/>
                    </svg>
                    <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full"></span>
                </button>

                <!-- User Avatar & Dropdown -->
                <c:if test="${not empty sessionScope.user}">
                    <div class="relative" id="userDropdown">
                        <button onclick="toggleDropdown()" class="flex items-center justify-center w-8 h-8 rounded-full bg-gray-700 text-white text-sm font-bold hover:bg-gray-800 transition-colors">
                            ${fn:substring(sessionScope.user.fullName, 0, 1)}
                        </button>
                        
                        <!-- Dropdown Menu -->
                        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 z-50 border border-gray-200">
                            <c:set var="profilePath" value="/voter/profile" />
                            <c:if test="${sessionScope.role == 'CANDIDATE'}"><c:set var="profilePath" value="/candidate/profile" /></c:if>
                            <c:if test="${sessionScope.role == 'ADMIN'}"><c:set var="profilePath" value="/admin/dashboard" /></c:if>
                            
                            <a href="${pageContext.request.contextPath}${profilePath}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 transition-colors">Profile</a>
                            <a href="${pageContext.request.contextPath}/logout" class="block px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition-colors">Logout</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </nav>
</header>

<script>
    function toggleDropdown() {
        const menu = document.getElementById('dropdownMenu');
        if (menu) menu.classList.toggle('hidden');
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('userDropdown');
        const menu = document.getElementById('dropdownMenu');
        if (dropdown && menu && !dropdown.contains(event.target)) {
            menu.classList.add('hidden');
        }
    });
</script>
