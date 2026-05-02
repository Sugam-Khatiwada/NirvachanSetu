<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <c:set var="activePage" value="users" scope="request" />
        <%@ include file="/layout/admin-layout.jsp" %>

            <c:set var="pendingUsers" value="0" />
            <c:set var="approvedUsers" value="0" />
            <c:forEach var="u" items="${users}">
                <c:if test="${u.status.name() == 'PENDING'}">
                    <c:set var="pendingUsers" value="${pendingUsers + 1}" />
                </c:if>
                <c:if test="${u.status.name() == 'APPROVED'}">
                    <c:set var="approvedUsers" value="${approvedUsers + 1}" />
                </c:if>
            </c:forEach>

            <div class="flex items-center justify-between mb-6">
                <div>
                    <h1 class="text-2xl font-bold text-gray-900">User Management</h1>
                    <p class="text-sm text-gray-500">Live voter/admin/candidate users from backend.</p>
                </div>
                <a href="${pageContext.request.contextPath}/admin/users"
                    class="px-4 py-2 bg-blue-900 text-white rounded-md text-sm hover:bg-blue-800">Refresh</a>
            </div>

            <c:if test="${not empty error}">
                <div class="mb-4 rounded-md bg-red-100 text-red-700 px-4 py-3">${error}</div>
            </c:if>
            <c:if test="${not empty sessionScope.error}">
                <div class="mb-4 rounded-md bg-red-100 text-red-700 px-4 py-3">${sessionScope.error}</div>
                <c:remove var="error" scope="session" />
            </c:if>
            <c:if test="${not empty sessionScope.success}">
                <div class="mb-4 rounded-md bg-green-100 text-green-700 px-4 py-3">${sessionScope.success}</div>
                <c:remove var="success" scope="session" />
            </c:if>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                <div class="bg-white rounded-md p-4 shadow">
                    <div class="text-sm text-gray-500">Total Users</div>
                    <div class="text-2xl font-bold">${users != null ? users.size() : 0}</div>
                </div>
                <div class="bg-white rounded-md p-4 shadow">
                    <div class="text-sm text-gray-500">Pending</div>
                    <div class="text-2xl font-bold">${pendingUsers}</div>
                </div>
                <div class="bg-white rounded-md p-4 shadow">
                    <div class="text-sm text-gray-500">Approved</div>
                    <div class="text-2xl font-bold">${approvedUsers}</div>
                </div>
            </div>

            <div class="bg-white rounded-md shadow overflow-x-auto">
                <table class="min-w-full text-sm">
                    <thead class="bg-gray-100 text-gray-700">
                        <tr>
                            <th class="px-4 py-3 text-left">Name</th>
                            <th class="px-4 py-3 text-left">Email</th>
                            <th class="px-4 py-3 text-left">Role</th>
                            <th class="px-4 py-3 text-left">Status</th>
                            <th class="px-4 py-3 text-left">Constituency</th>
                            <th class="px-4 py-3 text-left">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty users}">
                                <tr>
                                    <td colspan="6" class="px-4 py-6 text-center text-gray-500">No users found.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="user" items="${users}">
                                    <tr class="border-t">
                                        <td class="px-4 py-3">${user.fullName}</td>
                                        <td class="px-4 py-3">${user.email}</td>
                                        <td class="px-4 py-3">${user.role}</td>
                                        <td class="px-4 py-3 font-semibold">${user.status}</td>
                                        <td class="px-4 py-3">${user.constituency != null ? user.constituency.name :
                                            '-'}</td>
                                        <td class="px-4 py-3">
                                            <div class="flex gap-2">
                                                <c:if test="${user.status.name() != 'APPROVED'}">
                                                    <form method="post"
                                                        action="${pageContext.request.contextPath}/admin/users">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <input type="hidden" name="action" value="approve">
                                                        <button
                                                            class="px-2 py-1 bg-green-600 text-white rounded text-xs">Approve</button>
                                                    </form>
                                                </c:if>
                                                <form method="post"
                                                    action="${pageContext.request.contextPath}/admin/users">
                                                    <input type="hidden" name="userId" value="${user.id}">
                                                    <input type="hidden" name="action" value="reject">
                                                    <button
                                                        class="px-2 py-1 bg-red-600 text-white rounded text-xs">Reject</button>
                                                </form>
                                                <form method="post"
                                                    action="${pageContext.request.contextPath}/admin/users">
                                                    <input type="hidden" name="userId" value="${user.id}">
                                                    <input type="hidden" name="action" value="suspend">
                                                    <button
                                                        class="px-2 py-1 bg-yellow-600 text-white rounded text-xs">Suspend</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <%@ include file="/layout/admin-layout-close.jsp" %>