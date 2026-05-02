<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<style>
  header {
    background: linear-gradient(90deg, rgba(255, 255, 255, 0.98) 0%, rgba(255, 255, 255, 0.95) 100%);
    backdrop-filter: blur(8px);
    box-shadow: 0 1px 3px rgba(15, 58, 151, 0.1);
  }

  .header-logo {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    text-decoration: none;
    transition: transform 0.2s ease;
  }

  .header-logo:hover {
    transform: scale(1.02);
  }

  .header-logo svg {
    width: 2rem;
    height: 2rem;
    color: #0f3a97;
  }

  .header-logo-text {
    font-family: 'Manrope', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    font-weight: 700;
    font-size: 1.25rem;
    color: #0f3a97;
    letter-spacing: -0.02em;
  }

  .nav-link {
    transition: all 0.2s ease;
  }

  .nav-link.active {
    background: #0f3a97;
    color: white;
  }
</style>

<header class="sticky top-0 z-50 bg-surface-container-lowest/95 backdrop-blur-md shadow-sm">
    <div class="max-w-full mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">

            <!-- Left: Logo -->
            <div class="flex items-center gap-2">
                <a href="${pageContext.request.contextPath}/" class="flex items-center gap-2 no-underline">
                    <svg class="w-8 h-8 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="3" width="7" height="7" rx="1"/>
                        <rect x="14" y="3" width="7" height="7" rx="1"/>
                        <rect x="8.5" y="14" width="7" height="7" rx="1"/>
                    </svg>
                    <span class="font-manrope font-bold text-xl text-primary">NirvachanSetu</span>
                </a>
            </div>

            <!-- Center: Navigation Links (hidden on mobile) -->
            <nav class="hidden md:flex items-center gap-1">
                <c:choose>
                    <c:when test="${sessionScope.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'dashboard' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/admin/users"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'users' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Users</a>
                        <a href="${pageContext.request.contextPath}/admin/candidates"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'candidates' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Candidates</a>
                        <a href="${pageContext.request.contextPath}/admin/elections"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'elections' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Elections</a>
                        <a href="${pageContext.request.contextPath}/admin/constituencies"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'constituencies' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Constituencies</a>
                        <a href="${pageContext.request.contextPath}/admin/results"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'results' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Results</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'VOTER'}">
                        <a href="${pageContext.request.contextPath}/voter/dashboard"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'dashboard' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/voter/candidates"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'candidates' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Candidates</a>
                        <a href="${pageContext.request.contextPath}/voter/cast-vote"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'vote' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Vote</a>
                        <a href="${pageContext.request.contextPath}/voter/results"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'results' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Results</a>
                        <a href="${pageContext.request.contextPath}/voter/profile"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'profile' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Profile</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'CANDIDATE'}">
                        <a href="${pageContext.request.contextPath}/candidate/dashboard"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'dashboard' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/candidate/application"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'apply' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Apply</a>
                        <a href="${pageContext.request.contextPath}/candidate/manifesto"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'manifesto' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Manifesto</a>
                        <a href="${pageContext.request.contextPath}/candidate/profile"
                           class="px-3 py-2 rounded-lg text-sm font-medium font-inter transition-colors duration-150 ${requestScope.activePage == 'profile' ? 'bg-primary text-white' : 'text-on-surface-variant hover:bg-surface-container-low hover:text-on-surface'}">Profile</a>
                    </c:when>
                </c:choose>
            </nav>

            <!-- Right: Notifications + User -->
            <div class="flex items-center gap-3">
                <!-- Notification Bell -->
                <button class="relative p-2 rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-150" aria-label="Notifications">
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                    </svg>
                    <span class="absolute top-1.5 right-1.5 w-2 h-2 bg-red-500 rounded-full"></span>
                </button>

                <!-- User Dropdown -->
                <c:if test="${not empty sessionScope.user}">
                    <div class="relative" id="userDropdown">
                        <button onclick="toggleDropdown()" class="flex items-center gap-2 px-3 py-1.5 rounded-lg hover:bg-surface-container-low transition-colors duration-150">
                            <div class="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center">
                                <svg class="w-4 h-4 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                                    <circle cx="12" cy="7" r="4"/>
                                </svg>
                            </div>
                            <span class="hidden sm:block text-sm font-medium text-on-surface font-inter">${sessionScope.user.fullName}</span>
                            <svg class="hidden sm:block w-4 h-4 text-on-surface-variant" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="6 9 12 15 18 9"/>
                            </svg>
                        </button>

                        <!-- Dropdown Menu -->
                        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-surface-container-lowest rounded-xl shadow-lg py-2 z-50">
                            <div class="px-4 py-2 border-b border-surface-container-low">
                                <p class="text-sm font-medium text-on-surface font-inter">${sessionScope.user.fullName}</p>
                                <p class="text-xs text-on-surface-variant font-inter">${sessionScope.role}</p>
                            </div>
                            <a href="${pageContext.request.contextPath}/${sessionScope.role != null ? fn:toLowerCase(sessionScope.role) : ''}/profile" class="flex items-center gap-2 px-4 py-2 text-sm text-on-surface-variant hover:bg-surface-container-low font-inter transition-colors">
                                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                                    <circle cx="12" cy="7" r="4"/>
                                </svg>
                                My Profile
                            </a>
                            <a href="${pageContext.request.contextPath}/logout" class="flex items-center gap-2 px-4 py-2 text-sm text-red-500 hover:bg-red-50 font-inter transition-colors">
                                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                                    <polyline points="16 17 21 12 16 7"/>
                                    <line x1="21" y1="12" x2="9" y2="12"/>
                                </svg>
                                Logout
                            </a>
                        </div>
                    </div>
                </c:if>

                <!-- Mobile Hamburger Menu -->
                <button onclick="toggleMobileMenu()" class="md:hidden p-2 rounded-lg text-on-surface-variant hover:bg-surface-container-low transition-colors duration-150" aria-label="Toggle menu">
                    <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="menuIcon">
                        <line x1="3" y1="6" x2="21" y2="6"/>
                        <line x1="3" y1="12" x2="21" y2="12"/>
                        <line x1="3" y1="18" x2="21" y2="18"/>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Mobile Navigation Menu -->
        <div id="mobileMenu" class="hidden md:hidden pb-4">
            <nav class="flex flex-col gap-1">
                <c:choose>
                    <c:when test="${sessionScope.role == 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link ${requestScope.activePage == 'dashboard' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="8.5" y="14" width="7" height="7" rx="1"/></svg>
                            Dashboard
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-link ${requestScope.activePage == 'users' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                            Users
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/candidates" class="sidebar-link ${requestScope.activePage == 'candidates' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/></svg>
                            Candidates
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/elections" class="sidebar-link ${requestScope.activePage == 'elections' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
                            Elections
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/constituencies" class="sidebar-link ${requestScope.activePage == 'constituencies' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
                            Constituencies
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/results" class="sidebar-link ${requestScope.activePage == 'results' ? 'sidebar-link-active' : ''}">
                            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M18 20V10"/><path d="M12 20V4"/><path d="M6 20v-6"/></svg>
                            Results
                        </a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'VOTER'}">
                        <a href="${pageContext.request.contextPath}/voter/dashboard" class="sidebar-link ${requestScope.activePage == 'dashboard' ? 'sidebar-link-active' : ''}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/voter/candidates" class="sidebar-link ${requestScope.activePage == 'candidates' ? 'sidebar-link-active' : ''}">Candidates</a>
                        <a href="${pageContext.request.contextPath}/voter/cast-vote" class="sidebar-link ${requestScope.activePage == 'vote' ? 'sidebar-link-active' : ''}">Vote</a>
                        <a href="${pageContext.request.contextPath}/voter/results" class="sidebar-link ${requestScope.activePage == 'results' ? 'sidebar-link-active' : ''}">Results</a>
                        <a href="${pageContext.request.contextPath}/voter/profile" class="sidebar-link ${requestScope.activePage == 'profile' ? 'sidebar-link-active' : ''}">Profile</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 'CANDIDATE'}">
                        <a href="${pageContext.request.contextPath}/candidate/dashboard" class="sidebar-link ${requestScope.activePage == 'dashboard' ? 'sidebar-link-active' : ''}">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/candidate/application" class="sidebar-link ${requestScope.activePage == 'apply' ? 'sidebar-link-active' : ''}">Apply</a>
                        <a href="${pageContext.request.contextPath}/candidate/manifesto" class="sidebar-link ${requestScope.activePage == 'manifesto' ? 'sidebar-link-active' : ''}">Manifesto</a>
                        <a href="${pageContext.request.contextPath}/candidate/profile" class="sidebar-link ${requestScope.activePage == 'profile' ? 'sidebar-link-active' : ''}">Profile</a>
                    </c:when>
                </c:choose>
            </nav>
        </div>
    </div>
</header>

<script>
    function toggleDropdown() {
        const menu = document.getElementById('dropdownMenu');
        menu.classList.toggle('hidden');
    }

    function toggleMobileMenu() {
        const menu = document.getElementById('mobileMenu');
        menu.classList.toggle('hidden');
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
