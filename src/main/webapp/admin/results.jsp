<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Import JSTL libraries -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!-- Set active sidebar menu -->
<c:set var="activePage" value="results" scope="request" />

<!-- Include admin layout -->
<%@ include file="/layout/admin-layout.jsp" %>

<!-- Page heading -->
<div class="flex items-center justify-between mb-8">

    <div>

        <h1 class="text-3xl font-bold text-gray-900">
            Election Results
        </h1>

        <p class="text-gray-500 mt-1">
            Consolidated voting data and final counts from completed elections.
        </p>

    </div>

</div>

<!-- Show error message -->
<c:if test="${not empty error}">

    <div class="mb-6 rounded-lg bg-red-50 border border-red-200 text-red-700 px-4 py-3">

            ${error}

    </div>

</c:if>

<!-- Check if completed elections exist -->
<c:choose>

    <!-- Empty state -->
    <c:when test="${empty completedElections}">

        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-12 text-center">

            <h3 class="text-lg font-bold text-gray-800">
                No Election Results
            </h3>

            <p class="text-gray-500">
                There are no completed elections in the system.
            </p>

        </div>

    </c:when>

    <!-- Show results -->
    <c:otherwise>

        <!-- Loop through completed elections -->
        <c:forEach var="election" items="${completedElections}">

            <div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-10 overflow-hidden">

                <!-- Election heading -->
                <div class="px-6 py-5 border-b border-gray-100 bg-gray-50">

                    <h2 class="text-xl font-bold text-gray-900">
                            ${election.name}
                    </h2>

                    <div class="text-sm text-gray-500">
                            ${election.electionType}
                    </div>

                </div>

                <!-- Results table -->
                <div class="overflow-x-auto">

                    <table class="min-w-full divide-y divide-gray-200">

                        <!-- Table headings -->
                        <thead class="bg-white">

                        <tr>
                            <th class="px-6 py-4 text-left">Candidate Name</th>
                            <th class="px-6 py-4 text-left">Party / Affiliation</th>
                            <th class="px-6 py-4 text-left">Constituency</th>
                            <th class="px-6 py-4 text-right">Vote Count</th>
                        </tr>

                        </thead>

                        <tbody class="divide-y divide-gray-200">

                        <!-- Check if candidate results exist -->
                        <c:choose>

                            <!-- Empty result -->
                            <c:when test="${empty electionResults[election]}">

                                <tr>

                                    <td colspan="4"
                                        class="px-6 py-10 text-center text-gray-400">

                                        No candidate data available.

                                    </td>

                                </tr>

                            </c:when>

                            <!-- Display candidate results -->
                            <c:otherwise>

                                <!-- Loop through candidates -->
                                <c:forEach var="cand"
                                           items="${electionResults[election]}">

                                    <tr class="hover:bg-blue-50">

                                        <!-- Candidate name -->
                                        <td class="px-6 py-4">

                                            <div class="flex items-center">

                                                <!-- Candidate initial -->
                                                <div class="h-8 w-8 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center font-bold">
                                                        ${fn:substring(cand.user.fullName, 0, 1)}
                                                </div>

                                                <!-- Full name -->
                                                <div class="ml-3 text-sm font-bold">
                                                        ${cand.user.fullName}
                                                </div>

                                            </div>

                                        </td>

                                        <!-- Party name -->
                                        <td class="px-6 py-4">

                                                ${empty cand.partyName ? 'Independent' : cand.partyName}

                                        </td>

                                        <!-- Constituency -->
                                        <td class="px-6 py-4">

                                                ${cand.constituency.name}

                                        </td>

                                        <!-- Total votes -->
                                        <td class="px-6 py-4 text-right">

                                                <span class="text-lg font-black text-blue-900">
                                                        ${cand.totalVotes}
                                                </span>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:otherwise>

                        </c:choose>

                        </tbody>
                    </table>
                </div>
            </div>

        </c:forEach>

    </c:otherwise>

</c:choose>

<!-- Include footer -->
<%@ include file="/layout/admin-layout-close.jsp" %>