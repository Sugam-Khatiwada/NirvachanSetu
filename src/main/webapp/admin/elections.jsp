<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Import JSTL core tag library -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Set active sidebar menu -->
<c:set var="activePage" value="elections" scope="request" />

<!-- Include admin layout/header -->
<%@ include file="/layout/admin-layout.jsp" %>

<!-- Page heading section -->
<div class="flex items-center justify-between mb-8">

    <!-- Page title and description -->
    <div>
        <h1 class="text-3xl font-bold text-gray-900">
            Election Management
        </h1>

        <p class="text-gray-500 mt-1">
            Configure, schedule, and monitor nationwide and local elections.
        </p>
    </div>

    <!-- Refresh button -->
    <a href="${pageContext.request.contextPath}/admin/elections"
       class="flex items-center gap-2 px-5 py-2.5 bg-blue-900 text-white rounded-lg font-medium hover:bg-blue-800 transition-all shadow-sm">

        <!-- Refresh icon -->
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
        </svg>

        Refresh List
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

<!-- Election form container -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 mb-10 hover:shadow-md transition-shadow">

    <!-- Form heading -->
    <div class="flex items-center gap-3 mb-6">

        <!-- Heading icon -->
        <div class="p-2 bg-blue-50 text-blue-600 rounded-lg">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
        </div>

        <!-- Change heading based on edit mode -->
        <h2 class="text-xl font-bold text-gray-800">
            ${isEdit ? 'Update Existing Election' : 'Create New Election'}
        </h2>
    </div>

    <!-- Election form -->
    <form method="post"
          action="${pageContext.request.contextPath}/admin/elections"
          class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">

        <!-- Hidden field to store election id during update -->
        <input type="hidden" name="electionId"
               value="${isEdit ? election.id : ''}">

        <!-- Election name -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Election Name
            </label>

            <input name="name"
                   value="${isEdit ? election.name : ''}"
                   class="w-full border border-gray-200 rounded-lg px-4 py-2.5"
                   placeholder="e.g. General Election 2025"
                   required>
        </div>

        <!-- Election type dropdown -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Election Type
            </label>

            <select name="electionType"
                    class="w-full border border-gray-200 rounded-lg px-4 py-2.5"
                    required>

                <option value="">Select Type</option>

                <!-- HOR option -->
                <option value="HOR"
                ${isEdit && election.electionType.name() == 'HOR' ? 'selected' : ''}>
                    HOR
                </option>

                <!-- Provincial option -->
                <option value="PROVINCIAL"
                ${isEdit && election.electionType.name() == 'PROVINCIAL' ? 'selected' : ''}>
                    PROVINCIAL
                </option>

                <!-- Local option -->
                <option value="LOCAL"
                ${isEdit && election.electionType.name() == 'LOCAL' ? 'selected' : ''}>
                    LOCAL
                </option>

            </select>
        </div>

        <!-- Election status -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Status
            </label>

            <select name="status"
                    class="w-full border border-gray-200 rounded-lg px-4 py-2.5">

                <option value="DRAFT">DRAFT</option>
                <option value="REGISTRATION">REGISTRATION</option>
                <option value="ACTIVE">ACTIVE</option>
                <option value="COMPLETED">COMPLETED</option>
                <option value="CANCELLED">CANCELLED</option>

            </select>
        </div>

        <!-- Election start date -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Start Date & Time
            </label>

            <input type="datetime-local"
                   name="startDate"
                   class="w-full border border-gray-200 rounded-lg px-4 py-2.5"
                   required>
        </div>

        <!-- Election end date -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                End Date & Time
            </label>

            <input type="datetime-local"
                   name="endDate"
                   class="w-full border border-gray-200 rounded-lg px-4 py-2.5"
                   required>
        </div>

        <!-- Constituency dropdown -->
        <div class="space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Specific Constituency
            </label>

            <select name="constituencyId"
                    class="w-full border border-gray-200 rounded-lg px-4 py-2.5">

                <!-- Default national option -->
                <option value="">
                    All Constituencies (National)
                </option>

                <!-- Loop through constituencies -->
                <c:forEach var="cst" items="${constituencies}">

                    <option value="${cst.id}">
                            ${cst.name}
                    </option>

                </c:forEach>

            </select>
        </div>

        <!-- Election description -->
        <div class="md:col-span-2 lg:col-span-3 space-y-1">

            <label class="text-xs font-bold text-gray-500 uppercase ml-1">
                Election Description
            </label>

            <textarea name="description"
                      class="w-full border border-gray-200 rounded-lg px-4 py-2.5 h-24 resize-none"
                      placeholder="Provide details about the election...">${isEdit ? election.description : ''}</textarea>

        </div>

        <!-- Submit button -->
        <div class="md:col-span-2 lg:col-span-3 pt-2">

            <button
                    class="w-full md:w-auto px-10 py-3 bg-blue-900 text-white rounded-lg font-bold hover:bg-blue-800">

                ${isEdit ? 'Update Election Configuration' : 'Launch New Election'}

            </button>

        </div>

    </form>
</div>

<!-- Elections table section -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">

    <!-- Table heading -->
    <div class="px-6 py-4 border-b border-gray-100 bg-gray-50">

        <h2 class="font-bold text-gray-800">
            All Registered Elections
        </h2>

    </div>

    <div class="overflow-x-auto">

        <!-- Elections table -->
        <table class="min-w-full divide-y divide-gray-200">

            <!-- Table headings -->
            <thead class="bg-gray-50">

            <tr>
                <th class="px-6 py-4 text-left">Election Name</th>
                <th class="px-6 py-4 text-left">Scope</th>
                <th class="px-6 py-4 text-left">Schedule</th>
                <th class="px-6 py-4 text-left">Status</th>
                <th class="px-6 py-4 text-right">Actions</th>
            </tr>

            </thead>

            <tbody class="bg-white divide-y divide-gray-200">

            <!-- Check if elections exist -->
            <c:choose>

                <!-- Empty table message -->
                <c:when test="${empty elections}">

                    <tr>
                        <td colspan="5"
                            class="px-6 py-12 text-center text-gray-500">

                            No elections found in the database.

                        </td>
                    </tr>

                </c:when>

                <!-- Display election records -->
                <c:otherwise>

                    <!-- Loop through elections -->
                    <c:forEach var="el" items="${elections}">

                        <tr class="hover:bg-gray-50">

                            <!-- Election name and type -->
                            <td class="px-6 py-4">

                                <div class="text-sm font-semibold">
                                        ${el.name}
                                </div>

                                <div class="text-xs text-gray-500">
                                        ${el.electionType}
                                </div>

                            </td>

                            <!-- Election scope -->
                            <td class="px-6 py-4">

                                    ${el.constituency != null ? el.constituency.name : 'National'}

                            </td>

                            <!-- Start and end dates -->
                            <td class="px-6 py-4 text-sm text-gray-500">

                                <div>
                                    Starts: ${el.startDate}
                                </div>

                                <div>
                                    Ends: ${el.endDate}
                                </div>

                            </td>

                            <!-- Election status -->
                            <td class="px-6 py-4">

                                    <span class="px-2.5 py-1 rounded-full text-xs font-bold">

                                            ${el.status}

                                    </span>

                            </td>

                            <!-- Edit action -->
                            <td class="px-6 py-4 text-right">

                                <a class="text-blue-600 font-bold"
                                   href="${pageContext.request.contextPath}/admin/elections?id=${el.id}">

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

<!-- Include footer layout -->
<%@ include file="/layout/admin-layout-close.jsp" %>