<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | NirvachanSetu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background-color: #f5f7fa; }
    </style>
</head>
<body class="bg-gray-50 text-gray-800">

    <!-- Navigation Bar -->
    <c:set var="activePage" value="profile" scope="request" />
    <jsp:include page="../layout/header.jsp" />

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-6 py-8">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

            <!-- Left Sidebar -->
            <div class="space-y-6">
                
                <!-- Profile Card -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 flex flex-col items-center">
                    <div class="relative mb-6">
                        <div class="w-24 h-24 rounded-full bg-blue-900 overflow-hidden border-4 border-white shadow-md flex items-center justify-center">
                            <span class="text-4xl font-bold text-blue-300">${fn:substring(user.fullName, 0, 1)}</span>
                        </div>
                        <div class="absolute bottom-0 right-0 w-7 h-7 bg-blue-600 rounded-full flex items-center justify-center border-3 border-white text-white text-xs">
                            <i class="fas fa-check"></i>
                        </div>
                    </div>

                    <h2 class="text-lg font-bold text-gray-900 text-center">${user.fullName}</h2>
                    <p class="text-xs font-bold text-gray-500 tracking-wide uppercase mt-2 mb-6">Voter ID: <c:out value="${user.voterId}" default="Not Found"/></p>

                    <div class="w-full border-t border-gray-100 pt-6 flex justify-between items-center">
                        <div class="text-center">
                            <p class="text-xs font-bold text-gray-400 uppercase tracking-wide mb-2">Status</p>
                            <span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-bold bg-green-100 text-green-700">
                                <span class="w-1.5 h-1.5 rounded-full bg-green-500"></span>Active
                            </span>
                        </div>
                        <div class="text-right">
                            <p class="text-xs font-bold text-gray-400 uppercase tracking-wide mb-2">Verified On</p>
                            <p class="text-sm font-bold text-gray-900"><c:out value="${user.verifiedOn}" default="12 Oct 2023"/></p>
                        </div>
                    </div>
                </div>

                <!-- Polling Information Card -->
                <div class="bg-blue-900 rounded-lg shadow-sm p-6 text-white">
                    <h3 class="text-sm font-bold text-blue-200 uppercase tracking-wide mb-6">Polling Information</h3>

                    <div class="mb-6">
                        <div class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-blue-300 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path></svg>
                            <div>
                                <p class="text-xs font-bold text-blue-200 uppercase tracking-wide mb-1">Constituency</p>
                                <p class="text-sm font-semibold text-white"><c:out value="${user.constituency.name}" default="Not Assigned"/></p>
                            </div>
                        </div>
                    </div>

                    <div class="mb-8">
                        <div class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-blue-300 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5.5m0 0H9m0 0h5.5M3 21h2m0 0v-2m0 2v-2"></path></svg>
                            <div>
                                <p class="text-xs font-bold text-blue-200 uppercase tracking-wide mb-1">Polling Station</p>
                                <p class="text-sm font-semibold text-white"><c:out value="${user.pollingStation}" default="Not Assigned"/></p>
                            </div>
                        </div>
                    </div>

                    <button class="w-full bg-blue-800 hover:bg-blue-700 transition-colors py-2.5 rounded-lg text-sm font-semibold text-white flex items-center justify-center gap-2">
                        View Route on Map <i class="fas fa-arrow-right text-xs"></i>
                    </button>
                </div>

            </div>

            <!-- Right Content -->
            <div class="lg:col-span-2">

                <!-- Personal Particulars Section -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-8">
                    <div class="flex justify-between items-start mb-8 pb-6 border-b border-gray-100">
                        <div>
                            <h2 class="text-lg font-bold text-gray-900 mb-1">Personal Particulars</h2>
                            <p class="text-xs text-gray-500">Details as recorded in the National Electoral Roll</p>
                        </div>
                        <button class="bg-blue-700 hover:bg-blue-800 transition-colors text-white px-4 py-2 rounded-lg text-sm font-semibold flex items-center gap-2">
                            <i class="fas fa-pen text-xs"></i> Edit Profile
                        </button>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <!-- Full Name -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Full Name</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.fullName}" default="Not Provided"/></p>
                        </div>

                        <!-- Date of Birth -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Date of Birth</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.dob}" default="Not Provided"/></p>
                        </div>

                        <!-- Gender -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Gender</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.gender}" default="Not Provided"/></p>
                        </div>

                        <!-- Mobile Number -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Mobile Number</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.phone}" default="Not Provided"/></p>
                        </div>

                        <!-- Address (Full Width) -->
                        <div class="md:col-span-2">
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Registered Residential Address</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.address}" default="Not Provided"/></p>
                        </div>

                        <!-- Relative's Name -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">Relative's Name</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.relativeName}" default="Not Provided"/></p>
                        </div>

                        <!-- Epic Card Type -->
                        <div>
                            <p class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-2">EPIC Card Type</p>
                            <p class="text-sm font-semibold text-gray-900"><c:out value="${user.epicCardType}" default="Not Provided"/></p>
                        </div>
                    </div>

                    <!-- Administrative Notice -->
                    <div class="mt-8 bg-blue-50 rounded-lg p-4 flex gap-4 border border-blue-200">
                        <div class="text-blue-600 text-xl flex-shrink-0">
                            <i class="fas fa-circle-info"></i>
                        </div>
                        <div>
                            <h4 class="text-sm font-bold text-blue-900 mb-1">Administrative Notice</h4>
                            <p class="text-xs text-blue-700 leading-relaxed">
                                To maintain the integrity of the electoral roll, any modifications to your profile details (except mobile/email) will undergo a verification process by the District Election Officer. Please ensure you have supporting documents ready for upload.
                            </p>
                        </div>
                    </div>

                    <!-- Recent Activity Section -->
                    <div class="mt-10">
                        <h3 class="text-base font-bold text-gray-900 mb-6 flex items-center gap-2">
                            <i class="fas fa-history text-gray-400"></i> Recent Activity
                        </h3>

                        <div class="space-y-4">
                            <!-- Activity Item 1 -->
                            <div class="flex items-center justify-between pb-4 border-b border-gray-100">
                                <div class="flex items-center gap-4">
                                    <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                                        <i class="fas fa-user-check text-sm"></i>
                                    </div>
                                    <div>
                                        <h4 class="text-sm font-bold text-gray-900 mb-0.5">Identity Re-verification</h4>
                                        <p class="text-xs text-gray-500">Completed via Aadhaar OTP</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="text-xs font-bold text-gray-900 mb-0.5">Oct 24, 2024</p>
                                    <p class="text-xs font-bold text-green-600 uppercase tracking-wide">SUCCESS</p>
                                </div>
                            </div>

                            <!-- Activity Item 2 -->
                            <div class="flex items-center justify-between pt-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                                        <i class="fas fa-download text-sm"></i>
                                    </div>
                                    <div>
                                        <h4 class="text-sm font-bold text-gray-900 mb-0.5">Voter Slip Download</h4>
                                        <p class="text-xs text-gray-500">Constituency: Bangalore South</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="text-xs font-bold text-gray-900 mb-0.5">Oct 12, 2024</p>
                                    <p class="text-xs font-bold text-gray-500 uppercase tracking-wide">1.2 MB</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />

</body>
</html>
