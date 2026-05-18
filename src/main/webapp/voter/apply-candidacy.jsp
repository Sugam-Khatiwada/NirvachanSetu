<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Candidacy - NirvachanSetu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>
<body style="background-color: #F8FAFC; font-family: 'Inter', sans-serif; color: #1E293B; margin: 0; padding: 0;">

    <div style="min-height: 100vh; padding: 2rem 4rem; display: flex; flex-direction: column; items: center;">
        <!-- Top Header -->
        <div style="width: 100%; max-width: 1400px; display: flex; align-items: center; justify-content: space-between; margin-bottom: 2rem;">
            <div style="display: flex; align-items: center; gap: 0.75rem;">
                <div style="width: 2.5rem; height: 2.5rem; background-color: #1E3A8A; border-radius: 0.75rem; display: flex; align-items: center; justify-content: center;">
                    <svg style="width: 1.5rem; height: 1.5rem; color: white;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-7h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                    </svg>
                </div>
                <h1 style="font-size: 1.5rem; font-weight: 800; color: #1E3A8A; margin: 0;">NirvachanSetu</h1>
            </div>

            <c:if test="${not empty success}">
                <div style="flex-grow: 1; margin: 0 2rem; padding: 0.75rem 1.5rem; background-color: #DEF7EC; color: #03543F; border-radius: 0.75rem; border: 1px solid #BCF0DA; font-size: 0.875rem; font-weight: 600;">
                    ${success}
                </div>
                <c:remove var="success" scope="session" />
            </c:if>
            <c:if test="${not empty error}">
                <div style="flex-grow: 1; margin: 0 2rem; padding: 0.75rem 1.5rem; background-color: #FDE8E8; color: #9B1C1C; border-radius: 0.75rem; border: 1px solid #F8B4B4; font-size: 0.875rem; font-weight: 600;">
                    ${error}
                </div>
                <c:remove var="error" scope="session" />
            </c:if>

            <a href="${pageContext.request.contextPath}/voter/dashboard" style="display: flex; align-items: center; gap: 0.5rem; color: #475569; text-decoration: none; font-size: 0.75rem; font-weight: 600; text-transform: uppercase;">
                <svg style="width: 1rem; height: 1rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
                Cancel Application
            </a>
        </div>

        <div style="width: 100%; max-width: 1400px; display: flex; flex-direction: column; gap: 2rem;">
            <!-- Candidate Nomination Card -->
            <div style="background-color: white; border-radius: 2.5rem; padding: 3rem; border: 1px solid #E2E8F0; box-shadow: 0 1px 3px rgba(0,0,0,0.1); display: grid; grid-template-columns: 1fr 350px; gap: 3rem; align-items: start;">
                <div>
                    <h2 style="font-size: 2rem; font-weight: 800; color: #1E293B; margin: 0 0 1rem 0;">Candidate Nomination</h2>
                    <p style="color: #64748B; font-size: 1rem; line-height: 1.6; margin-bottom: 2.5rem;">
                        Please provide accurate information for your official candidacy. Your nomination will be reviewed by the Election Commission.
                    </p>

                    <!-- Large Illustration Placeholder -->
                    <div style="position: relative; width: 100%; aspect-ratio: 16/7; background-color: #F8FAFC; border-radius: 2rem; border: 1px solid #E2E8F0; display: flex; align-items: center; justify-content: center; overflow: hidden; margin-bottom: 2rem;">
                        <div style="width: 10rem; height: 10rem; background-color: #4F80FF; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 20px 50px rgba(79, 128, 255, 0.3);">
                            <svg style="width: 5rem; height: 5rem; color: white;" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="3">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                            </svg>
                        </div>
                        
                        <!-- Verified Badge Center-Bottom -->
                        <div style="position: absolute; left: 50%; transform: translateX(-50%); bottom: 2rem; display: flex; align-items: center; gap: 0.75rem; background: white; padding: 0.75rem 1.5rem; border-radius: 100px; border: 1px solid #E2E8F0; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
                            <div style="width: 2.5rem; height: 2.5rem; border-radius: 50%; background-color: #F1F5F9; border: 1px solid #E2E8F0; overflow: hidden; display: flex; align-items: center; justify-content: center;">
                                <c:choose>
                                    <c:when test="${not empty user.profileImage}">
                                        <img src="${pageContext.request.contextPath}/images/profiles/${user.profileImage}" style="width: 100%; height: 100%; object-fit: cover;" alt="P">
                                    </c:when>
                                    <c:otherwise>
                                        <span style="font-size: 0.875rem; font-weight: 800; color: #1E3A8A;">R</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div style="display: flex; flex-direction: column;">
                                <span style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.05em; line-height: 1;">Verified Portal</span>
                                <span style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.05em; line-height: 1;">Access</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Required Files Info Block -->
                <div style="background-color: rgba(239, 246, 255, 0.5); border-radius: 1.5rem; padding: 2rem; border: 1px solid rgba(191, 219, 254, 0.5); align-self: stretch;">
                    <h3 style="font-size: 0.875rem; font-weight: 800; color: #1E3A8A; margin: 0 0 1.5rem 0; text-transform: uppercase; letter-spacing: 0.05em;">Required Files</h3>
                    <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 1rem;">
                        <li style="display: flex; align-items: center; gap: 0.75rem; font-size: 0.75rem; color: #64748B; font-weight: 600;">
                            <div style="width: 6px; height: 6px; background-color: #1E3A8A; border-radius: 50%;"></div>
                            Government Issued ID (PDF)
                        </li>
                        <li style="display: flex; align-items: center; gap: 0.75rem; font-size: 0.75rem; color: #64748B; font-weight: 600;">
                            <div style="width: 6px; height: 6px; background-color: #1E3A8A; border-radius: 50%;"></div>
                            Nomination Certificate
                        </li>
                        <li style="display: flex; align-items: center; gap: 0.75rem; font-size: 0.75rem; color: #64748B; font-weight: 600;">
                            <div style="width: 6px; height: 6px; background-color: #1E3A8A; border-radius: 50%;"></div>
                            Proof of Party Affiliation
                        </li>
                    </ul>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/voter/apply-candidacy" method="post" enctype="multipart/form-data">
                <div style="display: flex; flex-direction: column; gap: 2rem;">
                    
                    <!-- Identity Details Card -->
                    <div style="background-color: white; border-radius: 2.5rem; padding: 3rem; border: 1px solid #E2E8F0; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 3rem;">
                            <div style="width: 6px; height: 1.5rem; background-color: #1E3A8A; border-radius: 100px;"></div>
                            <h3 style="font-size: 1.25rem; font-weight: 800; color: #1E293B; margin: 0;">Identity Details</h3>
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;">
                            <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                                <label style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.1em;">Full Name</label>
                                <input type="text" name="fullName" value="${user.fullName}" style="width: 100%; padding: 1.25rem 1.5rem; background-color: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 1rem; font-size: 0.875rem; color: #1E293B; outline: none;" placeholder="Full Name">
                            </div>
                            <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                                <label style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.1em;">Party Affiliation</label>
                                <input type="text" name="partyName" required style="width: 100%; padding: 1.25rem 1.5rem; background-color: white; border: 2px solid #1E293B; border-radius: 1rem; font-size: 0.875rem; color: #1E293B; outline: none;" placeholder="Independent or Party Name">
                            </div>
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
                            <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                                <label style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.1em;">Constituency Selection</label>
                                <div style="position: relative;">
                                    <select name="constituencyId" required style="width: 100%; padding: 1.25rem 1.5rem; background-color: white; border: 2px solid #1E293B; border-radius: 1rem; font-size: 0.875rem; color: #1E293B; outline: none; appearance: none; cursor: pointer;">
                                        <option value="" disabled selected>Choose your primary constituency</option>
                                        <c:forEach var="constituency" items="${constituencies}">
                                            <option value="${constituency.id}">${constituency.name} - ${constituency.district}</option>
                                        </c:forEach>
                                    </select>
                                    <div style="position: absolute; top: 50%; right: 1.5rem; transform: translateY(-50%); pointer-events: none; color: #1E293B;">
                                        <svg style="width: 1.25rem; height: 1.25rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>

                            <div style="display: flex; flex-direction: column; gap: 0.75rem;">
                                <label style="font-size: 0.65rem; font-weight: 800; color: #1E293B; text-transform: uppercase; letter-spacing: 0.1em;">Election Event</label>
                                <div style="position: relative;">
                                    <select name="electionId" required style="width: 100%; padding: 1.25rem 1.5rem; background-color: white; border: 2px solid #1E293B; border-radius: 1rem; font-size: 0.875rem; color: #1E293B; outline: none; appearance: none; cursor: pointer;">
                                        <option value="" disabled selected>Select active election event</option>
                                        <c:forEach var="election" items="${elections}">
                                            <option value="${election.id}">${election.name}</option>
                                        </c:forEach>
                                    </select>
                                    <div style="position: absolute; top: 50%; right: 1.5rem; transform: translateY(-50%); pointer-events: none; color: #1E293B;">
                                        <svg style="width: 1.25rem; height: 1.25rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Document Verification Card -->
                    <div style="background-color: white; border-radius: 2.5rem; padding: 3rem; border: 1px solid #E2E8F0; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 3rem;">
                            <div style="width: 6px; height: 1.5rem; background-color: #1E3A8A; border-radius: 100px;"></div>
                            <h3 style="font-size: 1.25rem; font-weight: 800; color: #1E293B; margin: 0;">Document Verification</h3>
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 3rem;">
                            <div style="background-color: #F8FAFC; border: 2px dashed #E2E8F0; border-radius: 2rem; padding: 3rem; display: flex; flex-direction: column; align-items: center; text-align: center;">
                                <div style="width: 3.5rem; height: 3.5rem; background-color: white; border-radius: 1rem; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05); margin-bottom: 1.5rem;">
                                    <svg style="width: 1.5rem; height: 1.5rem; color: #1E3A8A;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"/>
                                    </svg>
                                </div>
                                <h4 style="font-size: 0.875rem; font-weight: 800; color: #1E293B; margin: 0 0 0.5rem 0;">ID Proof</h4>
                                <p style="font-size: 0.65rem; color: #64748B; font-weight: 600; margin-bottom: 1.5rem;">Aadhaar, Voter ID, or Passport (PDF/JPG)</p>
                                <button type="button" onclick="document.getElementById('idProof').click()" style="padding: 0.75rem 2rem; border-radius: 100px; border: 2px solid #1E293B; background: transparent; color: #1E293B; font-size: 0.65rem; font-weight: 800; text-transform: uppercase; cursor: pointer;">Browse Files</button>
                                <input type="file" id="idProof" name="idProof" required style="display: none;" onchange="updateFileStatus(this, 'idStatus')">
                                <p id="idStatus" style="font-size: 0.65rem; color: #1E3A8A; font-weight: 600; margin-top: 0.5rem;"></p>
                            </div>

                            <div style="background-color: #F8FAFC; border: 2px dashed #E2E8F0; border-radius: 2rem; padding: 3rem; display: flex; flex-direction: column; align-items: center; text-align: center;">
                                <div style="width: 3.5rem; height: 3.5rem; background-color: white; border-radius: 1rem; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05); margin-bottom: 1.5rem;">
                                    <svg style="width: 1.5rem; height: 1.5rem; color: #1E3A8A;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                    </svg>
                                </div>
                                <h4 style="font-size: 0.875rem; font-weight: 800; color: #1E293B; margin: 0 0 0.5rem 0;">Nomination Paper</h4>
                                <p style="font-size: 0.65rem; color: #64748B; font-weight: 600; margin-bottom: 1.5rem;">Signed Form 2A / 2B (PDF)</p>
                                <button type="button" onclick="document.getElementById('nomination_paper').click()" style="padding: 0.75rem 2rem; border-radius: 100px; border: 2px solid #1E293B; background: transparent; color: #1E293B; font-size: 0.65rem; font-weight: 800; text-transform: uppercase; cursor: pointer;">Browse Files</button>
                                <input type="file" id="nomination_paper" name="nominationPaper" required style="display: none;" onchange="updateFileStatus(this, 'nominationStatus')">
                                <p id="nominationStatus" style="font-size: 0.65rem; color: #1E3A8A; font-weight: 600; margin-top: 0.5rem;"></p>
                            </div>
                        </div>
                    </div>

                    <!-- Campaign Manifesto Card -->
                    <div style="background-color: white; border-radius: 2.5rem; padding: 3rem; border: 1px solid #E2E8F0; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                            <div style="width: 6px; height: 1.5rem; background-color: #1E3A8A; border-radius: 100px;"></div>
                            <h3 style="font-size: 1.25rem; font-weight: 800; color: #1E293B; margin: 0; text-transform: uppercase; letter-spacing: 0.05em;">Campaign Manifesto</h3>
                        </div>
                        <textarea name="manifesto" required rows="6" style="width: 100%; padding: 1.5rem; background-color: white; border: 1px solid #E2E8F0; border-radius: 1.5rem; font-size: 0.875rem; color: #1E293B; outline: none; resize: none; line-height: 1.6;" placeholder="Briefly describe your vision and promises..."></textarea>
                    </div>

                    <!-- Submission Section -->
                    <div style="display: flex; flex-direction: column; gap: 2rem; padding: 1rem;">
                        <div style="display: flex; align-items: flex-start; gap: 1rem;">
                            <input type="checkbox" required style="width: 1.25rem; height: 1.25rem; margin-top: 0.25rem; cursor: pointer;">
                            <p style="font-size: 0.75rem; color: #64748B; font-weight: 600; line-height: 1.4; margin: 0;">
                                I hereby declare that the information provided is true to the best of my knowledge and I understand that any discrepancy may lead to immediate disqualification as per EC Protocol V4.2.
                            </p>
                        </div>

                        <button type="submit" style="width: 100%; padding: 1.5rem; background-color: #1E3A8A; border: 1px solid #1E3A8A; border-radius: 1.5rem; color: white; font-size: 1.125rem; font-weight: 800; display: flex; align-items: center; justify-content: center; gap: 1rem; cursor: pointer; transition: background-color 0.2s;">
                            <svg style="width: 1.5rem; height: 1.5rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2.5">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                            Submit Nomination Request
                        </button>

                        <div style="text-align: center;">
                            <p style="font-size: 0.65rem; color: #1E293B; font-weight: 800; letter-spacing: 0.2em; text-transform: uppercase; margin: 0;">
                                SECURE TRANSMISSION ENABLED &bull; EC PROTOCOL V4.2 &bull; END-TO-END ENCRYPTED
                            </p>
                        </div>
                    </div>

                </div>
            </form>

            <footer style="padding: 4rem 0; border-top: 1px solid #E2E8F0; text-align: center; display: flex; flex-direction: column; gap: 0.5rem;">
                <p style="font-size: 0.65rem; font-weight: 800; color: #94A3B8; text-transform: uppercase; letter-spacing: 0.15em; margin: 0;">&copy; 2026 NirvachanSetu</p>
                <p style="font-size: 0.65rem; font-weight: 800; color: #CBD5E1; text-transform: uppercase; letter-spacing: 0.15em; margin: 0;">Election Commission Digital Infrastructure</p>
            </footer>
        </div>
    </div>

    <!-- Success Modal -->
    <div id="nominationSuccessModal" style="display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.5); align-items: center; justify-content: center; z-index: 1000;">
        <div style="background: white; border-radius: 2rem; padding: 3rem; max-width: 400px; width: 90%; text-align: center; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1);">
            <div style="width: 5rem; height: 5rem; background: #DEF7EC; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.5rem;">
                <svg style="width: 2.5rem; height: 2.5rem; color: #057A55;" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            <h2 style="font-size: 1.5rem; font-weight: 800; color: #1E293B; margin-bottom: 0.5rem;">Nomination Submitted!</h2>
            <p style="font-size: 0.875rem; color: #64748B; line-height: 1.6; margin-bottom: 2rem;">
                Your candidacy request has been securely transmitted. You can track the status in your dashboard.
            </p>
            <button onclick="window.location.href='${pageContext.request.contextPath}/voter/dashboard'" style="width: 100%; padding: 1rem; background: #1E3A8A; color: white; border: none; border-radius: 1rem; font-weight: 800; cursor: pointer;">
                Go to Dashboard
            </button>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script>
        function updateFileStatus(input, statusId) {
            const statusElement = document.getElementById(statusId);
            if (input.files && input.files.length > 0) {
                statusElement.textContent = "Selected: " + input.files[0].name;
            } else {
                statusElement.textContent = "";
            }
        }

        // Handle Form Submission with Animation
        const form = document.querySelector('form');
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            const submitBtn = form.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            
            // Loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span style="display: flex; align-items: center; gap: 0.5rem;"><svg style="width: 1.25rem; height: 1.25rem; animation: spin 1s linear infinite;" fill="none" viewBox="0 0 24 24"><circle style="opacity: 0.25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path style="opacity: 0.75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg> Transmitting...</span>';

            const formData = new FormData(form);
            
            try {
                const response = await fetch(form.action, {
                    method: 'POST',
                    body: formData
                });

                if (response.ok) {
                    // Show success modal with tick
                    document.getElementById('nominationSuccessModal').style.display = 'flex';
                } else {
                    alert('Submission failed. Please check your data.');
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalText;
                }
            } catch (error) {
                alert('An error occurred during submission.');
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
            }
        });
    </script>
    <style>
        @keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
    </style>
</body>
</html>
