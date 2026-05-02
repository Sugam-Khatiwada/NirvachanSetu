
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="constituencies" scope="request" />
<%@ include file="/layout/admin-layout.jsp" %>

<div class="flex items-center justify-between mb-8">
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Constituencies</h1>
        <p class="text-gray-500 mt-1">Manage geographical voting regions and voter population data.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/constituencies" 
       class="flex items-center gap-2 px-5 py-2.5 bg-blue-900 text-white rounded-lg font-medium hover:bg-blue-800 transition-all shadow-sm">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/></svg>
        Refresh Data
    </a>
</div>

<c:if test="${not empty error}">
    <div class="mb-6 rounded-lg bg-red-50 border border-red-200 text-red-700 px-4 py-3 flex items-center gap-3">
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/></svg>
        ${error}
    </div>
</c:if>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 mb-10 hover:shadow-md transition-shadow">
    <div class="flex items-center gap-3 mb-6">
        <div class="p-2 bg-blue-50 text-blue-600 rounded-lg">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
        </div>
        <h2 class="text-xl font-bold text-gray-800">Add New Constituency</h2>
    </div>

    <form method="post" action="${pageContext.request.contextPath}/admin/constituencies" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">
        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Constituency Name</label>
            <input name="name" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" placeholder="e.g. Kathmandu-1" required>
        </div>
        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">District</label>
            <input name="district" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" placeholder="e.g. Kathmandu" required>
        </div>
        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Province</label>
            <input name="province" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" placeholder="e.g. Bagmati" required>
        </div>
        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Total Voters</label>
            <input type="number" name="totalVoters" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" placeholder="Approx. population">
        </div>
        <div class="md:col-span-2 lg:col-span-4 space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Description</label>
            <textarea name="description" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all h-20 resize-none" placeholder="Briefly describe the boundaries or demographic focus of this constituency..."></textarea>
        </div>
        <div class="md:col-span-2 lg:col-span-4 pt-2 text-right">
            <button class="px-10 py-3 bg-blue-900 text-white rounded-lg font-bold hover:bg-blue-800 transition-all shadow-md active:scale-[0.98]">
                Save Constituency
            </button>
        </div>
    </form>
</div>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between bg-gray-50">
        <h2 class="font-bold text-gray-800">Constituency Directory</h2>
    </div>
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Region</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Province</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Voter Base</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Description</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:choose>
                    <c:when test="${empty constituencies}">
                        <tr><td colspan="4" class="px-6 py-12 text-center text-gray-500">No constituencies registered yet.</td></tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="cst" items="${constituencies}">
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-semibold text-gray-900">${cst.name}</div>
                                    <div class="text-xs text-gray-500">${cst.district} District</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                    ${cst.province}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                    ${cst.totalVoters != null ? cst.totalVoters : 'N/A'}
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-500">
                                    <div class="max-w-xs truncate">${cst.description}</div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/layout/admin-layout-close.jsp" %>