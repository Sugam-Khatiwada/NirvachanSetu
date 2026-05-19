<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Import JSTL function library -->
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!-- Set active sidebar page -->
<c:set var="activePage" value="candidates" scope="request" />

<!-- Include admin layout -->
<%@ include file="/layout/admin-layout.jsp" %>

<!-- Initialize counters for application statuses -->
<c:set var="pendingCount" value="0" />
<c:set var="approvedCount" value="0" />
<c:set var="rejectedCount" value="0" />

<!-- Count total pending, approved and rejected applications -->
<c:forEach var="a" items="${applications}">

    <!-- Increase pending count -->
    <c:if test="${a.status.name() == 'PENDING'}">
        <c:set var="pendingCount" value="${pendingCount + 1}" />
    </c:if>

    <!-- Increase approved count -->
    <c:if test="${a.status.name() == 'APPROVED'}">
        <c:set var="approvedCount" value="${approvedCount + 1}" />
    </c:if>

    <!-- Increase rejected count -->
    <c:if test="${a.status.name() == 'REJECTED'}">
        <c:set var="rejectedCount" value="${rejectedCount + 1}" />
    </c:if>

</c:forEach>

<!-- Page header -->
<div class="flex items-center justify-between mb-8">

    <!-- Page title and description -->
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Candidate Applications</h1>

        <p class="text-gray-500 mt-1">
            Review and verify applications from users seeking to run in elections.
        </p>
    </div>

    <!-- Refresh button -->
    <a href="${pageContext.request.contextPath}/admin/candidates"
       class="flex items-center gap-2 px-5 py-2.5 bg-blue-900 text-white rounded-lg font-medium hover:bg-blue-800 transition-all shadow-sm">

        <!-- Refresh icon -->
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
        </svg>

        Refresh Data
    </a>
</div>

<!-- Show error message if available -->
<c:if test="${not empty error}">

    <div class="mb-6 rounded-lg bg-red-50 border border-red-200 text-red-700 px-4 py-3 flex items-center gap-3">

        <!-- Error icon -->
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd"
                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z"
                  clip-rule="evenodd"/>
        </svg>

            ${error}
    </div>

</c:if>

<!-- Statistics cards -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

    <!-- Total applications card -->
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100">
        <div class="text-sm text-gray-500">Total Apps</div>

        <!-- Show total applications -->
        <div class="text-2xl font-bold">
            ${applications != null ? applications.size() : 0}
        </div>
    </div>

    <!-- Pending applications card -->
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100">
        <div class="text-sm text-gray-500">Pending</div>
        <div class="text-2xl font-bold">${pendingCount}</div>
    </div>

    <!-- Approved applications card -->
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100">
        <div class="text-sm text-gray-500">Approved</div>
        <div class="text-2xl font-bold">${approvedCount}</div>
    </div>

    <!-- Rejected applications card -->
    <div class="bg-white rounded-xl p-6 shadow-sm border border-gray-100">
        <div class="text-sm text-gray-500">Rejected</div>
        <div class="text-2xl font-bold">${rejectedCount}</div>
    </div>

</div>

<!-- Applications table -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">

    <div class="overflow-x-auto">

        <table class="min-w-full divide-y divide-gray-200">

            <!-- Table headings -->
            <thead class="bg-gray-50">
            <tr>
                <th class="px-6 py-4 text-left">Candidate</th>
                <th class="px-6 py-4 text-left">Target Election</th>
                <th class="px-6 py-4 text-left">Region / Party</th>
                <th class="px-6 py-4 text-left">Status</th>
                <th class="px-6 py-4 text-right">Actions</th>
            </tr>
            </thead>

            <tbody class="bg-white divide-y divide-gray-200">

            <!-- Check if applications exist -->
            <c:choose>

                <!-- Show message if empty -->
                <c:when test="${empty applications}">
                    <tr>
                        <td colspan="5" class="px-6 py-12 text-center text-gray-500">
                            No applications found in the system.
                        </td>
                    </tr>
                </c:when>

                <!-- Display applications -->
                <c:otherwise>

                    <!-- Loop through all applications -->
                    <c:forEach var="application" items="${applications}">

                        <tr class="hover:bg-gray-50">

                            <!-- Candidate details -->
                            <td class="px-6 py-4">

                                <div class="flex items-center">

                                    <!-- Show first letter of candidate name -->
                                    <div class="h-10 w-10 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center font-bold">
                                            ${fn:substring(application.user.fullName, 0, 1)}
                                    </div>

                                    <!-- Name and applied date -->
                                    <div class="ml-4">

                                        <div class="text-sm font-semibold">
                                                ${application.user.fullName}
                                        </div>

                                        <div class="text-xs text-gray-500">
                                            Applied on ${application.appliedAt}
                                        </div>

                                    </div>

                                </div>
                            </td>

                            <!-- Election details -->
                            <td class="px-6 py-4">

                                <div class="text-sm font-medium">
                                        ${application.election.name}
                                </div>

                                <div class="text-xs text-gray-500">
                                        ${application.election.electionType}
                                </div>

                            </td>

                            <!-- Constituency and party -->
                            <td class="px-6 py-4">

                                <div class="text-sm">
                                        ${application.constituency.name}
                                </div>

                                <!-- Show party name or Independent -->
                                <div class="text-xs text-blue-600 font-semibold">
                                        ${empty application.partyName ? 'Independent' : application.partyName}
                                </div>

                            </td>

                            <!-- Application status -->
                            <td class="px-6 py-4">

                                    <span class="px-2.5 py-1 rounded-full text-xs font-bold">

                                            ${application.status}

                                    </span>
                            </td>

                            <!-- Action buttons -->
                            <td class="px-6 py-4 text-right">

                                <!-- Only show buttons for pending applications -->
                                <c:if test="${application.status == 'PENDING'}">

                                    <div class="flex justify-end gap-2">

                                        <!-- Approve form -->
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/candidates">

                                            <input type="hidden" name="applicationId"
                                                   value="${application.id}">

                                            <input type="hidden" name="action" value="approve">

                                            <button class="px-3 py-1.5 bg-emerald-600 text-white rounded-md text-xs">
                                                Approve
                                            </button>

                                        </form>

                                        <!-- Reject form -->
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/candidates">

                                            <input type="hidden" name="applicationId"
                                                   value="${application.id}">

                                            <input type="hidden" name="action" value="reject">

                                            <button class="px-3 py-1.5 bg-rose-600 text-white rounded-md text-xs">
                                                Reject
                                            </button>

                                        </form>

                                    </div>

                                </c:if>

                                <!-- Show processed text -->
                                <c:if test="${application.status != 'PENDING'}">
                                        <span class="text-gray-400 text-xs italic">
                                            Processed
                                        </span>
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

<!-- Include footer layout -->
<%@ include file="/layout/admin-layout-close.jsp" %>