<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Import JSTL core tag library -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Set active sidebar menu -->
<c:set var="activePage" value="dashboard" scope="request" />

<!-- Include admin layout -->
<%@ include file="/layout/admin-layout.jsp" %>

<!-- Dashboard heading -->
<div class="flex items-center justify-between mb-6">

    <div>

        <h1 class="text-2xl font-bold text-gray-900">
            Admin Dashboard
        </h1>

        <p class="text-sm text-gray-500">
            All metrics are bound to backend servlet attributes.
        </p>

    </div>

    <!-- Refresh dashboard button -->
    <a href="${pageContext.request.contextPath}/admin/dashboard"
       class="px-4 py-2 bg-blue-900 text-white rounded-md text-sm">

        Refresh

    </a>

</div>

<!-- Display error message -->
<c:if test="${not empty error}">
    <div class="mb-4 rounded-md bg-red-100 text-red-700 px-4 py-3">
            ${error}
    </div>
</c:if>

<!-- Dashboard statistic cards -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">

    <!-- Total users -->
    <div class="bg-white rounded-md shadow p-4">

        <div class="text-sm text-gray-500">
            Total Users
        </div>

        <div class="text-2xl font-bold">
            ${totalUsers}
        </div>

    </div>

    <!-- Total candidates -->
    <div class="bg-white rounded-md shadow p-4">

        <div class="text-sm text-gray-500">
            Total Candidates
        </div>

        <div class="text-2xl font-bold">
            ${totalCandidates}
        </div>

    </div>

    <!-- Active elections -->
    <div class="bg-white rounded-md shadow p-4">

        <div class="text-sm text-gray-500">
            Active Elections
        </div>

        <div class="text-2xl font-bold">
            ${activeElectionCount}
        </div>

    </div>

    <!-- Pending approvals -->
    <div class="bg-white rounded-md shadow p-4">

        <div class="text-sm text-gray-500">
            Pending Approvals
        </div>

        <div class="text-2xl font-bold">
            ${pendingApprovals}
        </div>

    </div>

</div>

<!-- Dashboard tables -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

    <!-- Active elections table -->
    <div class="bg-white rounded-md shadow overflow-x-auto">

        <div class="px-4 py-3 border-b bg-gray-50 font-semibold">
            Active Elections
        </div>

        <table class="min-w-full text-sm">

            <!-- Table heading -->
            <thead class="bg-gray-100 text-gray-700">

            <tr>
                <th class="px-4 py-3 text-left">Name</th>
                <th class="px-4 py-3 text-left">Type</th>
                <th class="px-4 py-3 text-left">Status</th>
            </tr>

            </thead>

            <tbody>

            <!-- Check if active elections exist -->
            <c:choose>

                <!-- Empty message -->
                <c:when test="${empty activeElections}">

                    <tr>
                        <td colspan="3"
                            class="px-4 py-4 text-center text-gray-500">

                            No active elections.

                        </td>
                    </tr>

                </c:when>

                <!-- Show election data -->
                <c:otherwise>

                    <!-- Loop through active elections -->
                    <c:forEach var="e" items="${activeElections}">

                        <tr class="border-t">

                            <td class="px-4 py-3">${e.name}</td>

                            <td class="px-4 py-3">${e.electionType}</td>

                            <td class="px-4 py-3">${e.status}</td>

                        </tr>

                    </c:forEach>

                </c:otherwise>

            </c:choose>

            </tbody>
        </table>
    </div>

    <!-- All elections table -->
    <div class="bg-white rounded-md shadow overflow-x-auto">

        <div class="px-4 py-3 border-b bg-gray-50 font-semibold">
            All Elections
        </div>

        <table class="min-w-full text-sm">

            <!-- Table headings -->
            <thead class="bg-gray-100 text-gray-700">

            <tr>
                <th class="px-4 py-3 text-left">Name</th>
                <th class="px-4 py-3 text-left">Status</th>
                <th class="px-4 py-3 text-left">Action</th>
            </tr>

            </thead>

            <tbody>

            <!-- Check if election list is empty -->
            <c:choose>

                <!-- Empty message -->
                <c:when test="${empty elections}">

                    <tr>
                        <td colspan="3"
                            class="px-4 py-4 text-center text-gray-500">

                            No elections found.

                        </td>
                    </tr>

                </c:when>

                <!-- Display elections -->
                <c:otherwise>

                    <!-- Loop through elections -->
                    <c:forEach var="e" items="${elections}">

                        <tr class="border-t">

                            <!-- Election name -->
                            <td class="px-4 py-3">
                                    ${e.name}
                            </td>

                            <!-- Election status -->
                            <td class="px-4 py-3">
                                    ${e.status}
                            </td>

                            <!-- Manage button -->
                            <td class="px-4 py-3">

                                <a class="text-blue-700 underline"
                                   href="${pageContext.request.contextPath}/admin/elections?id=${e.id}">

                                    Manage

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

<!-- Include footer layout -->
<%@ include file="/layout/admin-layout-close.jsp" %>