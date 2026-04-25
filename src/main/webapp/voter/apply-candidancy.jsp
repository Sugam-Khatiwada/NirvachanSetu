
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Nomination | NirvachanSetu</title>
    <link href="${pageContext.request.contextPath}/css/output.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 flex flex-col min-h-screen font-sans text-gray-800">

    <!-- Header -->
    <header class="bg-gray-50 py-6 px-10 flex justify-between items-center max-w-6xl mx-auto w-full">
        <div class="flex items-center gap-3">
            <div class="bg-[#1e3a8a] text-white p-2 rounded-lg">
                <i class="fa-solid fa-building-columns text-xl"></i>
            </div>
            <span class="text-[#1e3a8a] font-bold text-2xl tracking-tight">NirvachanSetu</span>
        </div>
        <a href="${pageContext.request.contextPath}/voter/dashboard.jsp" class="text-sm font-semibold text-[#1e3a8a] hover:underline flex items-center gap-2">
            <i class="fa-solid fa-arrow-left"></i> Cancel Application
        </a>
    </header>

    <!-- Main Content -->
    <main class="flex-grow flex flex-col md:flex-row gap-8 max-w-6xl mx-auto w-full px-10 pb-12">
        
        <!-- Left Sidebar -->
        <aside class="w-full md:w-1/3 flex flex-col gap-6">
            <!-- Candidate Nomination Card -->
            <div class="bg-gray-100 rounded-xl p-8">
                <h2 class="text-xl font-bold text-[#1e3a8a] mb-4">Candidate Nomination</h2>
                <p class="text-gray-600 text-sm mb-8 leading-relaxed">
                    Please provide accurate information for your official candidacy. Your nomination will be reviewed by the Election Commission.
                </p>
                <div class="flex items-center gap-3">
                    <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=Felix" alt="User" class="w-10 h-10 rounded-full bg-gray-300">
                    <div class="text-xs text-gray-500 font-medium flex items-center gap-1">
                        <i class="fa-solid fa-user-check"></i> Verified Portal Access
                    </div>
                </div>
            </div>

            <!-- Required Files Card -->
            <div class="bg-[#1e3a8a] text-white rounded-xl p-8">
                <h3 class="text-lg font-bold flex items-center gap-2 mb-4">
                    <i class="fa-solid fa-circle-info"></i> Required Files
                </h3>
                <ul class="text-sm space-y-3 opacity-90">
                    <li class="flex items-center gap-2"><i class="fa-solid fa-circle-check text-xs"></i> Government Issued ID (PDF)</li>
                    <li class="flex items-center gap-2"><i class="fa-solid fa-circle-check text-xs"></i> Nomination Certificate</li>
                    <li class="flex items-center gap-2"><i class="fa-solid fa-circle-check text-xs"></i> Proof of Party Affiliation</li>
                </ul>
            </div>
        </aside>

        <!-- Right Form Area -->
        <section class="w-full md:w-2/3 bg-white rounded-xl shadow-[0_4px_20px_-4px_rgba(0,0,0,0.05)] p-10">
            <form action="${pageContext.request.contextPath}/voter/apply-candidancy" method="POST" enctype="multipart/form-data">
                
                <!-- Identity Details -->
                <div class="mb-10">
                    <div class="flex items-center gap-3 mb-6">
                        <div class="w-1.5 h-6 bg-[#1e3a8a] rounded-full"></div>
                        <h3 class="text-lg font-bold text-gray-900">Identity Details</h3>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div>
                            <label class="block text-xs font-bold text-gray-500 tracking-wider mb-2 uppercase">Full Name</label>
                            <input type="text" name="fullName" placeholder="Enter as per Aadhaar/ID" class="w-full bg-gray-100 border-transparent rounded-lg px-4 py-3 text-sm focus:border-[#1e3a8a] focus:ring-1 focus:ring-[#1e3a8a] transition-colors outline-none placeholder-gray-400">
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-500 tracking-wider mb-2 uppercase">Party Affiliation</label>
                            <input type="text" name="partyAffiliation" placeholder="Independent or Party Name" class="w-full bg-gray-100 border-transparent rounded-lg px-4 py-3 text-sm focus:border-[#1e3a8a] focus:ring-1 focus:ring-[#1e3a8a] transition-colors outline-none placeholder-gray-400">
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-xs font-bold text-gray-500 tracking-wider mb-2 uppercase">Constituency Selection</label>
                        <div class="relative">
                            <select name="constituencyId" class="w-full bg-gray-100 border-transparent rounded-lg px-4 py-3 text-sm focus:border-[#1e3a8a] focus:ring-1 focus:ring-[#1e3a8a] transition-colors outline-none appearance-none cursor-pointer">
                                <option value="" disabled selected>Choose your primary constituency</option>
                                <option value="1">Constituency 1</option>
                                <option value="2">Constituency 2</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 flex items-center pr-4 pointer-events-none text-gray-500">
                                <i class="fa-solid fa-chevron-down text-xs"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Document Verification -->
                <div class="mb-10">
                    <div class="flex items-center gap-3 mb-6">
                        <div class="w-1.5 h-6 bg-[#1e3a8a] rounded-full"></div>
                        <h3 class="text-lg font-bold text-gray-900">Document Verification</h3>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- ID Proof -->
                        <div class="border-2 border-dashed border-gray-200 bg-gray-50 rounded-xl p-6 flex flex-col items-center justify-center text-center hover:bg-gray-100 hover:border-gray-300 transition-colors cursor-pointer group">
                            <div class="w-12 h-12 bg-white rounded-full flex items-center justify-center shadow-sm text-[#1e3a8a] mb-4 group-hover:-translate-y-1 transition-transform">
                                <i class="fa-solid fa-id-card text-lg"></i>
                            </div>
                            <h4 class="font-bold text-gray-900 text-sm mb-1">ID Proof</h4>
                            <p class="text-xs text-gray-400 mb-4">Aadhaar, Voter ID, or Passport</p>
                            <label class="bg-white border border-gray-200 text-[#1e3a8a] text-xs font-semibold px-4 py-2 rounded-full cursor-pointer hover:bg-gray-50 transition-colors">
                                Browse Files
                                <input type="file" name="idProof" class="hidden" accept=".pdf,.jpg,.jpeg,.png">
                            </label>
                        </div>
                        
                        <!-- Nomination Paper -->
                        <div class="border-2 border-dashed border-gray-200 bg-gray-50 rounded-xl p-6 flex flex-col items-center justify-center text-center hover:bg-gray-100 hover:border-gray-300 transition-colors cursor-pointer group">
                            <div class="w-12 h-12 bg-white rounded-full flex items-center justify-center shadow-sm text-[#1e3a8a] mb-4 group-hover:-translate-y-1 transition-transform">
                                <i class="fa-solid fa-file-contract text-lg"></i>
                            </div>
                            <h4 class="font-bold text-gray-900 text-sm mb-1">Nomination Paper</h4>
                            <p class="text-xs text-gray-400 mb-4">Signed Form 2A / 2B</p>
                            <label class="bg-white border border-gray-200 text-[#1e3a8a] text-xs font-semibold px-4 py-2 rounded-full cursor-pointer hover:bg-gray-50 transition-colors">
                                Browse Files
                                <input type="file" name="nominationPaper" class="hidden" accept=".pdf,.jpg,.jpeg,.png">
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Declaration -->
                <div class="mb-8 flex items-start gap-3">
                    <input type="checkbox" id="declaration" name="declaration" required class="mt-1 w-4 h-4 text-[#1e3a8a] border-gray-300 rounded focus:ring-[#1e3a8a] cursor-pointer">
                    <label for="declaration" class="text-xs text-gray-500 leading-relaxed cursor-pointer select-none">
                        I hereby declare that the information provided is true to the best of my knowledge and I understand that any discrepancy may lead to immediate disqualification.
                    </label>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="w-full bg-[#1e3a8a] hover:bg-[#152b66] text-white font-bold py-4 rounded-xl flex items-center justify-center gap-3 transition-colors mb-6 shadow-md">
                    <i class="fa-solid fa-paper-plane"></i> Submit Nomination
                </button>
                
                <div class="text-center">
                    <p class="text-[10px] text-gray-400 font-medium tracking-[0.2em] uppercase">
                        SECURE TRANSMISSION ENABLED &bull; EC PROTOCOL V4.2
                    </p>
                </div>

            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer class="py-6 text-center text-xs text-gray-500 mt-auto">
        &copy; 2024 NirvachanSetu &bull; Election Commission Digital Infrastructure
    </footer>

</body>
</html>
