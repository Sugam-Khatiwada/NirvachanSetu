
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="activePage" value="candidates" scope="request" />
<%@ include file="/layout/admin-layout.jsp" %>

<c:set var="pendingCount" value="0" />
<c:set var="approvedCount" value="0" />
<c:set var="rejectedCount" value="0" />
<c:forEach var="a" items="${applications}">
    <c:if test="${a.status.name() == 'PENDING'}"><c:set var="pendingCount" value="${pendingCount + 1}" /></c:if>
    <c:if test="${a.status.name() == 'APPROVED'}"><c:set var="approvedCount" value="${approvedCount + 1}" /></c:if>
    <c:if test="${a.status.name() == 'REJECTED'}"><c:set var="rejectedCount" value="${rejectedCount + 1}" /></c:if>
</c:forEach>

<div class="flex items-center justify-between mb-8">
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Candidate Applications</h1>
        <p class="text-gray-500 mt-1">Review and verify applications from users seeking to run in elections.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/candidates"
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

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow">
        <div class="p-3 bg-blue-50 rounded-lg text-blue-600">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
        </div>
        <div>
            <div class="text-sm text-gray-500 font-medium">Total Apps</div>
            <div class="text-2xl font-bold text-gray-900">${applications != null ? applications.size() : 0}</div>
        </div>
    </div>
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow">
        <div class="p-3 bg-amber-50 rounded-lg text-amber-600">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
        </div>
        <div>
            <div class="text-sm text-gray-500 font-medium">Pending</div>
            <div class="text-2xl font-bold text-gray-900">${pendingCount}</div>
        </div>
    </div>
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow">
        <div class="p-3 bg-emerald-50 rounded-lg text-emerald-600">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
        </div>
        <div>
            <div class="text-sm text-gray-500 font-medium">Approved</div>
            <div class="text-2xl font-bold text-gray-900">${approvedCount}</div>
        </div>
    </div>
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow">
        <div class="p-3 bg-rose-50 rounded-lg text-rose-600">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
        </div>
        <div>
            <div class="text-sm text-gray-500 font-medium">Rejected</div>
            <div class="text-2xl font-bold text-gray-900">${rejectedCount}</div>
        </div>
    </div>
</div>

<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Candidate</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Target Election</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Region / Party</th>
                    <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-4 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:choose>
                    <c:when test="${empty applications}">
                        <tr><td colspan="5" class="px-6 py-12 text-center text-gray-500">No applications found in the system.</td></tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="application" items="${applications}">
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 flex-shrink-0 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center font-bold text-lg">
                                            ${fn:substring(application.user.fullName, 0, 1)}
                                        </div>
                                        <div class="ml-4">
                                            <div class="text-sm font-semibold text-gray-900">${application.user.fullName}</div>
                                            <div class="text-xs text-gray-500">Applied on ${application.appliedAt}</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm font-medium text-gray-900">${application.election.name}</div>
                                    <div class="text-xs text-gray-500">${application.election.electionType}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="text-sm text-gray-900">${application.constituency.name}</div>
                                    <div class="text-xs text-gray-500 font-semibold text-blue-600">${empty application.partyName ? 'Independent' : application.partyName}</div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2.5 py-1 rounded-full text-xs font-bold
                                        ${application.status == 'APPROVED' ? 'bg-emerald-100 text-emerald-700' : 
                                          application.status == 'PENDING' ? 'bg-amber-100 text-amber-700' : 
                                          'bg-rose-100 text-rose-700'}">
                                        ${application.status}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                    <c:if test="${application.status == 'PENDING'}">
                                        <div class="flex justify-end gap-2">
                                            <form method="post" action="${pageContext.request.contextPath}/admin/candidates">
                                                <input type="hidden" name="applicationId" value="${application.id}">
                                                <input type="hidden" name="action" value="approve">
                                                <button title="Approve Candidate" class="flex items-center gap-1 px-3 py-1.5 bg-emerald-600 text-white rounded-md text-xs font-bold hover:bg-emerald-700 transition-colors shadow-sm">
                                                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                                                    Approve
                                                </button>
                                            </form>
                                            <form method="post" action="${pageContext.request.contextPath}/admin/candidates">
                                                <input type="hidden" name="applicationId" value="${application.id}">
                                                <input type="hidden" name="action" value="reject">
                                                <button title="Reject Application" class="flex items-center gap-1 px-3 py-1.5 bg-rose-600 text-white rounded-md text-xs font-bold hover:bg-rose-700 transition-colors shadow-sm">
                                                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
                                                    Reject
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                    <c:if test="${application.status != 'PENDING'}">
                                        <span class="text-gray-400 text-xs italic">Processed</span>
                                    </c:if>
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