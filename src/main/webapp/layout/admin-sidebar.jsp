<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fixed inset-y-0 left-0 z-30 w-64 overflow-y-auto transition duration-300 transform bg-[#1a2a5c] lg:translate-x-0 lg:static lg:inset-0">
    <div class="flex items-center justify-center mt-8">
        <div class="flex items-center">
            <svg class="w-8 h-8 text-white" viewBox="0 0 20 20" fill="currentColor">
                <path d="M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z" />
            </svg>
            <span class="mx-2 text-2xl font-bold text-white tracking-wide">Admin Panel</span>
        </div>
    </div>

    <nav class="mt-10">
        <a class="flex items-center px-6 py-2 mt-4 text-gray-100 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/admin/dashboard">
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M19 11H5M19 11C20.1046 11 21 11.8954 21 13V19C21 20.1046 20.1046 21 19 21H5C3.89543 21 3 20.1046 3 19V13C3 11.8954 3.89543 11 5 11M19 11V9C19 7.89543 18.1046 7 17 7M5 11V9C5 7.89543 5.89543 7 7 7M7 7V5C7 3.89543 7.89543 3 9 3H15C16.1046 3 17 3.89543 17 5V7M7 7H17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span class="mx-3">Dashboard</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/admin/elections">
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 7V3M16 7V3M7 11H17M5 21H19C20.1046 21 21 20.1046 21 19V7C21 5.89543 20.1046 5 19 5H5C3.89543 5 3 5.89543 3 7V19C3 20.1046 3.89543 21 5 21Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span class="mx-3">Elections</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/admin/users">
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span class="mx-3">Users</span>
        </a>
        <a class="flex items-center px-6 py-2 mt-4 text-gray-400 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" href="${pageContext.request.contextPath}/admin/candidates">
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <span class="mx-3">Candidates</span>
        </a>
    </nav>
</div>
