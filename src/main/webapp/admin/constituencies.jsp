<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Import JSTL core library -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Set active sidebar page -->
<c:set var="activePage" value="constituencies" scope="request" />

<!-- Include admin layout -->
<%@ include file="/layout/admin-layout.jsp" %>

<!-- Page heading -->
<div class="flex items-center justify-between mb-8">

    <div>
        <h1 class="text-3xl font-bold text-gray-900">Constituencies</h1>

        <p class="text-gray-500 mt-1">
            Manage geographical voting regions and voter population data.
        </p>
    </div>

</div>

<!-- Show error if available -->
<c:if test="${not empty error}">
    <div class="mb-6 rounded-lg bg-red-50 border border-red-200 text-red-700 px-4 py-3">
            ${error}
    </div>
</c:if>

<!-- Add new constituency form -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 mb-10">

    <h2 class="text-xl font-bold text-gray-800 mb-6">
        Add New Constituency
    </h2>

    <!-- Form starts -->
    <form method="post"
          action="${pageContext.request.contextPath}/admin/constituencies"
          class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">

        <!-- Constituency name -->
        <div>
            <label class="text-xs font-bold text-gray-500">
                Constituency Name
            </label>

            <input name="name"
                   class="w-full border rounded-lg px-4 py-2.5"
                   placeholder="e.g. Kathmandu-1"
                   required>
        </div>

        <!-- District -->
        <div>
            <label class="text-xs font-bold text-gray-500">
                District
            </label>

            <input name="district"
                   class="w-full border rounded-lg px-4 py-2.5"
                   placeholder="e.g. Kathmandu"
                   required>
        </div>

        <!-- Province -->
        <div>
            <label class="text-xs font-bold text-gray-500">
                Province
            </label>

            <input name="province"
                   class="w-full border rounded-lg px-4 py-2.5"
                   placeholder="e.g. Bagmati"
                   required>
        </div>

        <!-- Total voters -->
        <div>
            <label class="text-xs font-bold text-gray-500">
                Total Voters
            </label>

            <input type="number"
                   name="totalVoters"
                   class="w-full border rounded-lg px-4 py-2.5"
                   placeholder="Approx. population">
        </div>

        <!-- Description -->
        <div class="md:col-span-2 lg:col-span-4">

            <label class="text-xs font-bold text-gray-500">
                Description
            </label>

            <textarea name="description"
                      class="w-full border rounded-lg px-4 py-2.5 h-20"
                      placeholder="Briefly describe the constituency..."></textarea>
        </div>

        <!-- Submit button -->
        <div class="md:col-span-2 lg:col-span-4 text-right">

            <button class="px-10 py-3 bg-blue-900 text-white rounded-lg font-bold">
                Save Constituency
            </button>

        </div>

    </form>
</div>

<!-- Constituency list table -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">

    <table class="min-w-full divide-y divide-gray-200">

        <!-- Table headings -->
        <thead class="bg-gray-50">
        <tr>
            <th class="px-6 py-4 text-left">Region</th>
            <th class="px-6 py-4 text-left">Province</th>
            <th class="px-6 py-4 text-left">Voter Base</th>
            <th class="px-6 py-4 text-left">Description</th>
        </tr>
        </thead>

        <tbody class="bg-white divide-y divide-gray-200">

        <!-- Check if constituency list is empty -->
        <c:choose>

            <!-- Show message if no data -->
            <c:when test="${empty constituencies}">
                <tr>
                    <td colspan="4" class="px-6 py-12 text-center text-gray-500">
                        No constituencies registered yet.
                    </td>
                </tr>
            </c:when>

            <!-- Display constituency data -->
            <c:otherwise>

                <!-- Loop through all constituencies -->
                <c:forEach var="cst" items="${constituencies}">

                    <tr class="hover:bg-gray-50">

                        <!-- Constituency info -->
                        <td class="px-6 py-4">

                            <div class="text-sm font-semibold">
                                    ${cst.name}
                            </div>

                            <div class="text-xs text-gray-500">
                                    ${cst.district} District
                            </div>

                        </td>

                        <!-- Province -->
                        <td class="px-6 py-4">
                                ${cst.province}
                        </td>

                        <!-- Total voters -->
                        <td class="px-6 py-4">

                                ${cst.totalVoters != null ? cst.totalVoters : 'N/A'}

                        </td>

                        <!-- Description -->
                        <td class="px-6 py-4 text-sm text-gray-500">

                                ${cst.description}

                        </td>

                    </tr>

                </c:forEach>

            </c:otherwise>

        </c:choose>

        </tbody>
    </table>
</div>

<!-- Include footer layout -->
<%@ include file="/layout/admin-layout-close.jsp" %>