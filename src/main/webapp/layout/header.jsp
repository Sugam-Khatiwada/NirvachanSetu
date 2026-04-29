<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="flex items-center justify-between px-6 py-4 bg-white border-b-4 border-[#1a2a5c]">
    <div class="flex items-center">
        <!-- Search or Burger icon could go here -->
    </div>
    
    <div class="flex items-center">
        <!-- Notification Icon -->
        <button class="flex mx-4 text-gray-600 focus:outline-none">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M15 17H20L18.5951 15.5951C18.2141 15.2141 18 14.6973 18 14.1585V11C18 8.38757 16.3304 6.16509 14 5.34142V5C14 3.89543 13.1046 3 12 3C10.8954 3 10 3.89543 10 5V5.34142C7.66962 6.16509 6 8.38757 6 11V14.1585C6 14.6973 5.78595 15.2141 5.40493 15.5951L4 17H9M15 17V18C15 19.6569 13.6569 21 12 21C10.3431 21 9 19.6569 9 18V17M15 17H9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>

        <!-- User Profile -->
        <div class="relative">
            <button class="relative block w-8 h-8 overflow-hidden rounded-full shadow focus:outline-none">
                <img class="object-cover w-full h-full" src="https://ui-avatars.com/api/?name=Admin+User&background=1a2a5c&color=fff" alt="Your avatar">
            </button>
        </div>
        
        <!-- Logout Link -->
        <div class="ml-4">
            <a href="${pageContext.request.contextPath}/AuthServlet?action=logout" class="text-sm font-medium text-gray-700 hover:text-red-600">Logout</a>
        </div>
    </div>
</header>
