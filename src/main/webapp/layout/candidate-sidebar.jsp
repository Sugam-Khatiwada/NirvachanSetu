<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fixed inset-y-0 left-0 z-30 w-64 overflow-y-auto transition duration-300 transform bg-[#1a2a5c] lg:translate-x-0 lg:static lg:inset-0">
    <div class="flex items-center justify-center mt-8">
        <div class="flex items-center">
            <svg class="w-8 h-8 text-white" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" />
            </svg>
            <span class="mx-2 text-2xl font-bold text-white tracking-wide">Candidate Portal</span>
        </div>
    </div>

    <nav class="mt-10 mb-6">
        <a class="flex items-center px-6 py-2 mt-4 text-gray-100 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/candidate/dashboard">
            <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
            </svg>
            <span class="mx-3">Dashboard</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/candidate/profile">
            <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" />
            </svg>
            <span class="mx-3">My Profile</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/candidate/application">
            <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clip-rule="evenodd" />
            </svg>
            <span class="mx-3">My Application</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/candidate/manifesto">
            <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z" />
            </svg>
            <span class="mx-3">Manifesto</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/candidate/competing">
            <svg class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3.005 3.005 0 013.75-2.906z" />
            </svg>
            <span class="mx-3">Competing Candidates</span>
        </a>
    </nav>
</div>
