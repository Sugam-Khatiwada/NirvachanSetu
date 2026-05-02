
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="elections" scope="request" />
<%@ include file="/layout/admin-layout.jsp" %>

<div class="flex items-center justify-between mb-8">
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Election Management</h1>
        <p class="text-gray-500 mt-1">Configure, schedule, and monitor nationwide and local elections.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/elections" 
       class="flex items-center gap-2 px-5 py-2.5 bg-blue-900 text-white rounded-lg font-medium hover:bg-blue-800 transition-all shadow-sm">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/></svg>
        Refresh List
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
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
        </div>
        <h2 class="text-xl font-bold text-gray-800">${isEdit ? 'Update Existing Election' : 'Create New Election'}</h2>
    </div>
    
    <form method="post" action="${pageContext.request.contextPath}/admin/elections" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
        <input type="hidden" name="electionId" value="${isEdit ? election.id : ''}">
        
        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Election Name</label>
            <input name="name" value="${isEdit ? election.name : ''}" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" placeholder="e.g. General Election 2025" required>
        </div>

        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Election Type</label>
            <select name="electionType" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all appearance-none bg-no-repeat bg-[right_1rem_center] bg-[length:1em_1em]" style="background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22/%3E%3C/svg%3E');" required>
                <option value="">Select Type</option>
                <option value="HOR" ${isEdit && election.electionType.name() == 'HOR' ? 'selected' : ''}>HOR</option>
                <option value="PROVINCIAL" ${isEdit && election.electionType.name() == 'PROVINCIAL' ? 'selected' : ''}>PROVINCIAL</option>
                <option value="LOCAL" ${isEdit && election.electionType.name() == 'LOCAL' ? 'selected' : ''}>LOCAL</option>
            </select>
        </div>

        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Status</label>
            <select name="status" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all appearance-none bg-no-repeat bg-[right_1rem_center] bg-[length:1em_1em]" style="background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22/%3E%3C/svg%3E');">
                <option value="DRAFT" ${isEdit && election.status == 'DRAFT' ? 'selected' : ''}>DRAFT</option>
                <option value="REGISTRATION" ${isEdit && election.status == 'REGISTRATION' ? 'selected' : ''}>REGISTRATION</option>
                <option value="ACTIVE" ${isEdit && election.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
                <option value="COMPLETED" ${isEdit && election.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                <option value="CANCELLED" ${isEdit && election.status == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
            </select>
        </div>

        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Start Date & Time</label>
            <input type="datetime-local" name="startDate" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" required>
        </div>

        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">End Date & Time</label>
            <input type="datetime-local" name="endDate" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all" required>
        </div>

        <div class="space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Specific Constituency</label>
            <select name="constituencyId" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all appearance-none bg-no-repeat bg-[right_1rem_center] bg-[length:1em_1em]" style="background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22/%3E%3C/svg%3E');">
                <option value="">All Constituencies (National)</option>
                <c:forEach var="cst" items="${constituencies}">
                    <option value="${cst.id}" ${isEdit && election.constituency != null && election.constituency.id == cst.id ? 'selected' : ''}>${cst.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="md:col-span-2 lg:col-span-3 space-y-1">
            <label class="text-xs font-bold text-gray-500 uppercase ml-1">Election Description</label>
            <textarea name="description" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all h-24 resize-none" placeholder="Provide details about the election objectives, rules, and scope...">${isEdit ? election.description : ''}</textarea>
        </div>

        <div class="md:col-span-2 lg:col-span-3 pt-2">
            <button class="w-full md:w-auto px-10 py-3 bg-blue-900 text-white rounded-lg font-bold hover:bg-blue-800 transition-all shadow-md active:scale-[0.98]">
                ${isEdit ? 'Update Election Configuration' : 'Launch New Election'}
            </button>
        </div>
    </form>
</div>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between bg-gray-50">
        <h2 class="font-bold text-gray-800">All Registered Elections</h2>
    </div>
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Election Name</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Scope</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Schedule</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-4 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:choose>
                    <c:when test="${empty elections}">
                        <tr><td colspan="5" class="px-6 py-12 text-center text-gray-500">No elections found in the database.</td></tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="el" items="${elections}">
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-semibold text-gray-900">${el.name}</div>
                                    <div class="text-xs text-gray-500">${el.electionType}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                    ${el.constituency != null ? el.constituency.name : '<span class="text-gray-400">National</span>'}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <div><span class="font-medium text-gray-700">Starts:</span> ${el.startDate}</div>
                                    <div><span class="font-medium text-gray-700">Ends:</span> ${el.endDate}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2.5 py-1 rounded-full text-xs font-bold
                                        ${el.status == 'ACTIVE' ? 'bg-emerald-100 text-emerald-700' : 
                                          el.status == 'REGISTRATION' ? 'bg-blue-100 text-blue-700' : 
                                          el.status == 'COMPLETED' ? 'bg-gray-100 text-gray-700' : 
                                          'bg-amber-100 text-amber-700'}">
                                        ${el.status}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                    <a class="flex items-center justify-end gap-1 text-blue-600 hover:text-blue-900 font-bold" href="${pageContext.request.contextPath}/admin/elections?id=${el.id}">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                                        Edit
                                    </a>
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