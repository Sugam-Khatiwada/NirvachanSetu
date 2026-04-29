<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; }
    </style>
</head>
<body class="flex items-center justify-center h-screen">
<div class="bg-white p-10 rounded-2xl shadow-sm border border-gray-100 text-center">
    <h1 class="text-3xl font-bold text-[#0f2042] mb-6">NirvachanSetu Admin Pages</h1>
    <div class="flex flex-col space-y-3">
        <a href="admin/dashboard.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Dashboard</a>
        <a href="admin/users.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Users</a>
        <a href="admin/candidates.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Candidates</a>
        <a href="admin/elections.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Elections</a>
        <a href="admin/constituencies.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Constituencies</a>
        <a href="admin/results.jsp" class="px-6 py-3 bg-[#0ea5e9] text-white font-semibold rounded-lg hover:bg-[#0284c7] transition-colors">Results Analytics</a>
    </div>
</div>
</body>
</html>
