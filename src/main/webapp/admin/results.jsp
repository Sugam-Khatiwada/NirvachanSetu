
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="activePage" value="results" scope="request" />
<%@ include file="/layout/admin-layout.jsp" %>

<div class="flex items-center justify-between mb-8">
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Election Results</h1>
        <p class="text-gray-500 mt-1">Consolidated voting data and final counts from completed elections.</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/results" 
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

<c:choose>
    <c:when test="${empty completedElections}">
        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-12 text-center">
            <div class="inline-flex items-center justify-center p-4 bg-gray-50 text-gray-400 rounded-full mb-4">
                <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/></svg>
            </div>
            <h3 class="text-lg font-bold text-gray-800">No Election Results</h3>
            <p class="text-gray-500 max-w-xs mx-auto">There are no completed elections in the system to display results for.</p>
        </div>
    </c:when>
    <c:otherwise>
        <c:forEach var="election" items="${completedElections}">
            <div class="bg-white rounded-xl shadow-sm border border-gray-100 mb-10 overflow-hidden hover:shadow-md transition-shadow">
                <div class="px-6 py-5 border-b border-gray-100 bg-gray-50 flex flex-col md:flex-row md:items-center justify-between gap-4">
                    <div>
                        <h2 class="text-xl font-bold text-gray-900">${election.name}</h2>
                        <div class="flex items-center gap-3 mt-1">
                            <span class="px-2 py-0.5 bg-gray-200 text-gray-700 text-xs font-bold rounded uppercase tracking-wider">${election.electionType}</span>
                            <span class="text-sm text-gray-500 font-medium italic">Election #${election.id}</span>
                        </div>
                    </div>
                    <div class="bg-blue-900 text-white px-5 py-3 rounded-xl flex items-center gap-4">
                        <div class="p-2 bg-blue-800 rounded-lg">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                        </div>
                        <div>
                            <div class="text-[10px] uppercase font-bold text-blue-300 tracking-wider leading-none mb-1">Total Valid Votes</div>
                            <div class="text-2xl font-black leading-none">${voteCounts[election.id]}</div>
                        </div>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-white">
                            <tr>
                                <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Candidate Name</th>
                                <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Party / Affiliation</th>
                                <th class="px-6 py-4 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Constituency</th>
                                <th class="px-6 py-4 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Vote Count</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-200">
                            <c:choose>
                                <c:when test="${empty electionResults[election]}">
                                    <tr><td colspan="4" class="px-6 py-10 text-center text-gray-400 text-sm italic">No individual candidate data available for this election.</td></tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="cand" items="${electionResults[election]}">
                                        <tr class="hover:bg-blue-50 transition-colors group">
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <div class="h-8 w-8 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center font-bold text-sm">
                                                        ${fn:substring(cand.user.fullName, 0, 1)}
                                                    </div>
                                                    <div class="ml-3 text-sm font-bold text-gray-900">${cand.user.fullName}</div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <span class="px-3 py-1 bg-white border border-gray-200 rounded-full text-xs font-semibold text-gray-700 group-hover:border-blue-200 transition-colors">
                                                    ${empty cand.partyName ? 'Independent' : cand.partyName}
                                                </span>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                                ${cand.constituency.name}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-right">
                                                <span class="text-lg font-black text-blue-900">${cand.totalVotes}</span>
                                                <span class="text-[10px] text-gray-400 font-bold ml-1 uppercase">Votes</span>
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

<%@ include file="/layout/admin-layout-close.jsp" %>