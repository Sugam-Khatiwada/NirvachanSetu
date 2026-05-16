<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Nomination - NirvachanSetu</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --sidebar-bg: #1e1b4b;
            --sidebar-hover: #312e81;
            --sidebar-active: #2563eb;
            --bg-main: #f8fafc;
            --text-primary: #0f172a;
            --text-secondary: #64748b;
            --card-bg: #ffffff;
            --primary: #2563eb;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --border: #e2e8f0;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--bg-main);
            color: var(--text-primary);
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 260px;
            padding: 1.5rem 2.5rem;
            display: flex;
            flex-direction: column;
            gap: 1.75rem;
            max-width: 1400px;
        }

        /* Nomination Form Styling */
        .panel {
            background-color: white;
            border-radius: 1.5rem;
            border: 1px solid var(--border);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            display: flex;
            overflow: hidden;
            min-height: 700px;
        }

        .nomination-intro {
            width: 340px;
            background: linear-gradient(180deg, #1e1b4b 0%, #312e81 100%);
            padding: 2.5rem;
            color: white;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .intro-head h1 {
            font-size: 1.75rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 1rem;
        }

        .intro-head p {
            font-size: 0.9rem;
            opacity: 0.8;
            line-height: 1.6;
        }

        .required-box {
            margin-top: auto;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .required-box strong {
            display: block;
            margin-bottom: 0.75rem;
            font-size: 0.85rem;
        }

        .required-box ul {
            list-style: none;
            font-size: 0.8rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            opacity: 0.9;
        }

        .required-box li::before {
            content: "•";
            margin-right: 0.5rem;
            color: #fbbf24;
        }

        .nomination-card {
            flex: 1;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .card-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-toolbar small {
            font-size: 0.75rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-secondary);
        }

        .cancel-link {
            font-size: 0.8rem;
            color: var(--danger);
            text-decoration: none;
            font-weight: 700;
        }

        .section-title {
            font-size: 1.1rem;
            font-weight: 800;
            color: var(--text-primary);
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--bg-main);
            margin-bottom: 1.5rem;
        }

        .field-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.25rem;
            margin-bottom: 1.5rem;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .field label {
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .field input, .field select, .field textarea {
            padding: 0.75rem 1rem;
            border-radius: 0.75rem;
            border: 1.5px solid var(--border);
            background-color: var(--bg-main);
            outline: none;
            font-size: 0.9rem;
            transition: all 0.2s;
        }

        .field input:focus, .field select:focus, .field textarea:focus {
            border-color: var(--primary);
            background-color: white;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .doc-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.25rem;
        }

        .doc-box {
            border: 2px dashed var(--border);
            border-radius: 1rem;
            padding: 1.5rem;
            text-align: center;
            background-color: var(--bg-main);
            transition: all 0.2s;
        }

        .doc-box:hover {
            border-color: var(--primary);
            background-color: #eff6ff;
        }

        .doc-box.has-file {
            border-color: var(--success);
            background-color: #ecfdf5;
            border-style: solid;
        }

        .doc-box.has-file .doc-icon {
            transform: scale(1.1);
            transition: transform 0.2s;
        }

        .doc-icon {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .doc-box h4 {
            font-size: 0.9rem;
            font-weight: 800;
            margin-bottom: 0.25rem;
        }

        .doc-box p {
            font-size: 0.75rem;
            color: var(--text-secondary);
            margin-bottom: 1rem;
        }

        .doc-box button {
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            border: none;
            background-color: white;
            font-weight: 700;
            font-size: 0.75rem;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
            cursor: pointer;
        }

        .submit-btn {
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 100%);
            color: white;
            padding: 1rem;
            border-radius: 0.75rem;
            border: none;
            font-weight: 800;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .submit-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .alert {
            padding: 1rem;
            border-radius: 1rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            font-size: 0.9rem;
            border: 1.5px solid;
        }

        .alert-error { background-color: #fff1f2; color: #be123c; border-color: #fecdd3; }

        @media (max-width: 1000px) {
            .panel { flex-direction: column; }
            .nomination-intro { width: 100%; }
        }
    </style>
</head>
<body>

    <c:set var="activeCandidateNav" value="application" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <!-- Main Content -->
    <main class="main-content">
        <jsp:include page="/layout/header.jsp" />

        <c:if test="${not empty error}">
            <div class="alert alert-error"><c:out value="${error}" /></div>
        </c:if>

        <div class="panel">
            <aside class="nomination-intro">
                <div class="intro-head">
                    <h1>Candidate Nomination</h1>
                    <p>Provide accurate information for your official candidacy. Your nomination will be reviewed by the Election Commission.</p>
                </div>
                <div class="required-box">
                    <strong>Required Files</strong>
                    <ul>
                        <li>Government issued ID (PDF)</li>
                        <li>Signed nomination paper</li>
                        <li>Party evidence</li>
                    </ul>
                </div>
            </aside>

            <div class="nomination-card">
                <div class="card-toolbar">
                    <small>Nomination Form</small>
                    <a class="cancel-link" href="${pageContext.request.contextPath}/candidate/dashboard">Cancel</a>
                </div>

                <form action="${pageContext.request.contextPath}/candidate/application" method="post" enctype="multipart/form-data">
                    <h2 class="section-title">Identity Details</h2>
                    <div class="field-grid">
                        <div class="field">
                            <label>Full Name</label>
                            <input type="text" value="${user.fullName}" readonly>
                        </div>
                        <div class="field">
                            <label>Party Affiliation</label>
                            <input name="partyName" type="text" placeholder="Independent or Party Name" required>
                        </div>
                    </div>

                    <div class="field-grid">
                        <div class="field">
                            <label>Constituency</label>
                            <select name="constituencyId" required>
                                <option value="" disabled selected>Choose constituency</option>
                                <c:forEach var="constituency" items="${constituencies}">
                                    <option value="${constituency.id}"><c:out value="${constituency.name}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label>Election Cycle</label>
                            <select name="electionId" required id="electionSelect" onchange="updateElectionDates()">
                                <option value="" disabled selected>Choose election</option>
                                <c:forEach var="election" items="${elections}">
                                    <option value="${election.id}" data-start="${election.startDateFormatted}" data-end="${election.endDateFormatted}" data-start-full="${election.startDateFull}" data-end-full="${election.endDateFormatted}">
                                        <c:out value="${election.name}" />
                                        <c:if test="${not empty election.startDate}">
                                            (${election.startDateFormatted} to ${election.endDateFormatted})
                                        </c:if>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>

                    <div class="field-grid">
                        <div class="field">
                            <label>Party Type</label>
                            <select name="partyType" required>
                                <option value="" disabled selected>Select type</option>
                                <option value="NATIONAL">National</option>
                                <option value="REGIONAL">Regional</option>
                                <option value="INDEPENDENT">Independent</option>
                            </select>
                        </div>
                        <div class="field">
                            <label>Symbol</label>
                            <input name="symbol" type="text" placeholder="Symbol name" required>
                        </div>
                    </div>

                    <div class="field" style="margin-bottom: 1.5rem;">
                        <label>Campaign Summary</label>
                        <textarea name="manifesto" placeholder="Campaign focus..." required></textarea>
                    </div>

                    <h2 class="section-title">Verification Documents</h2>
                    <div class="doc-grid" style="grid-template-columns: repeat(3, 1fr);">
                        <div class="doc-box" id="idProofBox">
                            <div class="doc-icon">📄</div>
                            <h4>ID Proof</h4>
                            <p id="idProofStatus">Govt ID (PDF)</p>
                            <input type="file" name="idProof" id="idProofInput" accept=".pdf,.jpg,.jpeg,.png" style="display: none;" onchange="updateFileName('idProofInput', 'idProofStatus', 'idProofBox')" required>
                            <button type="button" onclick="document.getElementById('idProofInput').click()">Upload</button>
                        </div>
                        <div class="doc-box" id="declarationBox">
                            <div class="doc-icon">🖋️</div>
                            <h4>Declaration</h4>
                            <p id="declarationStatus">Signed Paper</p>
                            <input type="file" name="declaration" id="declarationInput" accept=".pdf,.jpg,.jpeg,.png" style="display: none;" onchange="updateFileName('declarationInput', 'declarationStatus', 'declarationBox')" required>
                            <button type="button" onclick="document.getElementById('declarationInput').click()">Upload</button>
                        </div>
                        <div class="doc-box" id="partyEvidenceBox">
                            <div class="doc-icon">🏛️</div>
                            <h4>Party Evidence</h4>
                            <p id="partyEvidenceStatus">Affiliation Doc</p>
                            <input type="file" name="partyEvidence" id="partyEvidenceInput" accept=".pdf,.jpg,.jpeg,.png" style="display: none;" onchange="updateFileName('partyEvidenceInput', 'partyEvidenceStatus', 'partyEvidenceBox')">
                            <button type="button" onclick="document.getElementById('partyEvidenceInput').click()">Upload</button>
                        </div>
                    </div>

                    <label style="display: flex; gap: 0.5rem; margin-top: 1.5rem; font-size: 0.8rem; font-weight: 600; cursor: pointer;">
                        <input type="checkbox" required>
                        I declare that the information provided is true and I am eligible for nomination.
                    </label>

                    <button class="submit-btn" type="submit">Submit Nomination</button>
                </form>

                <script>
                    function updateFileName(inputId, statusId, boxId) {
                        const input = document.getElementById(inputId);
                        const status = document.getElementById(statusId);
                        const box = document.getElementById(boxId);
                        
                        if (input.files && input.files[0]) {
                            const fileName = input.files[0].name;
                            status.innerText = "Selected: " + (fileName.length > 20 ? fileName.substring(0, 17) + "..." : fileName);
                            status.style.color = "var(--success)";
                            status.style.fontWeight = "700";
                            box.classList.add('has-file');
                        } else {
                            box.classList.remove('has-file');
                        }
                    }
                </script>
            </div>
        </div>

        <jsp:include page="/layout/footer.jsp" />
    </main>
</body>
</html>
