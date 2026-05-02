<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Constituency Competitors - NirvachanSetu</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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
            --accent: #4f46e5;
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
            gap: 1.5rem;
            max-width: 1400px;
        }

        /* Top Bar */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 0.5rem;
        }

        .search-container {
            position: relative;
            width: 420px;
        }

        .search-container input {
            width: 100%;
            padding: 0.8rem 1.25rem 0.8rem 3rem;
            border-radius: 2rem;
            border: 1px solid var(--border);
            background-color: #f1f5f9;
            outline: none;
            font-size: 0.9rem;
        }

        .search-container svg {
            position: absolute;
            left: 1.1rem;
            top: 50%;
            transform: translateY(-50%);
            width: 1.15rem;
            height: 1.15rem;
            color: var(--text-secondary);
        }

        .top-bar-right {
            display: flex;
            align-items: center;
            gap: 1.25rem;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.85rem;
            padding-left: 1.25rem;
            border-left: 1.5px solid var(--border);
        }

        .user-avatar {
            width: 2.75rem;
            height: 2.75rem;
            border-radius: 50%;
            background-color: #f1f5f9;
            overflow: hidden;
        }

        /* Header Section */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 0.5rem;
        }

        .header-title h1 {
            font-size: 1.85rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }

        .header-title p {
            color: var(--text-secondary);
            font-weight: 600;
            font-size: 0.95rem;
        }

        .header-title p span {
            color: var(--primary);
            font-weight: 800;
        }

        .header-actions {
            display: flex;
            gap: 0.75rem;
        }

        .btn-filter {
            background: white;
            border: 1px solid var(--border);
            padding: 0.6rem 1rem;
            border-radius: 0.75rem;
            font-size: 0.85rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            color: var(--text-secondary);
        }

        /* Layout Grid */
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 320px;
            gap: 1.5rem;
        }

        .competitors-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        /* Featured Card */
        .featured-card {
            background: white;
            border-radius: 1.5rem;
            padding: 2rem;
            border: 1px solid var(--border);
            display: grid;
            grid-template-columns: 240px 1fr;
            gap: 2rem;
            position: relative;
            overflow: hidden;
        }

        .featured-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--accent);
        }

        .candidate-img-container {
            width: 240px;
            height: 240px;
            border-radius: 1rem;
            background: #1e1b4b;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .candidate-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 0.75rem;
        }

        .badge-leading {
            background: #fff7ed;
            color: #c2410c;
            padding: 0.25rem 0.75rem;
            border-radius: 2rem;
            font-size: 0.7rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.025em;
            width: fit-content;
        }

        .party-tag {
            font-size: 0.85rem;
            color: var(--text-secondary);
            font-weight: 600;
        }

        .candidate-name {
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--text-primary);
        }

        .candidate-bio {
            font-size: 0.9rem;
            line-height: 1.6;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
        }

        .featured-actions {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .party-alpha {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--primary);
        }

        .view-profile-link {
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--text-primary);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        /* Regular Cards Grid */
        .cards-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .competitor-card {
            background: white;
            border-radius: 1.5rem;
            padding: 1.5rem;
            border: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            gap: 1rem;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .competitor-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .mini-avatar {
            width: 4rem;
            height: 4rem;
            border-radius: 0.75rem;
            background: #1e1b4b;
            overflow: hidden;
        }

        .party-logo {
            width: 3.5rem;
            height: 3.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: 0.2rem;
            text-align: center;
        }

        .party-logo span {
            font-size: 0.55rem;
            font-weight: 800;
            color: var(--text-secondary);
            text-transform: uppercase;
            line-height: 1;
        }

        .card-body h3 {
            font-size: 1.1rem;
            font-weight: 800;
            margin-bottom: 0.25rem;
        }

        .card-body p {
            font-size: 0.8rem;
            color: var(--text-secondary);
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .reach-section {
            margin-top: auto;
        }

        .reach-label {
            display: flex;
            justify-content: space-between;
            font-size: 0.75rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .progress-bar {
            height: 6px;
            background: #f1f5f9;
            border-radius: 3px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: var(--primary);
            border-radius: 3px;
        }

        .btn-card-action {
            width: 100%;
            padding: 0.75rem;
            border-radius: 0.75rem;
            border: none;
            background: #f8fafc;
            color: var(--text-primary);
            font-weight: 700;
            font-size: 0.8rem;
            cursor: pointer;
            margin-top: 1rem;
            transition: background 0.2s;
        }

        .btn-card-action:hover {
            background: #f1f5f9;
        }

        /* Sidebar Widgets */
        .side-widgets {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .widget-pulse {
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 100%);
            border-radius: 1.5rem;
            padding: 1.75rem;
            color: white;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .pulse-header h2 {
            font-size: 1.25rem;
            font-weight: 800;
        }

        .pulse-item {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .pulse-icon {
            width: 2.5rem;
            height: 2.5rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .pulse-info small {
            font-size: 0.7rem;
            opacity: 0.7;
            font-weight: 600;
            text-transform: uppercase;
        }

        .pulse-info p {
            font-size: 1rem;
            font-weight: 800;
        }

        .btn-pulse {
            background: white;
            color: #1e1b4b;
            padding: 0.85rem;
            border-radius: 0.75rem;
            border: none;
            font-weight: 800;
            font-size: 0.9rem;
            cursor: pointer;
        }

        /* Bottom Note */
        .bottom-section {
            margin-top: 2rem;
            background: white;
            border: 1px solid var(--border);
            border-radius: 1.25rem;
            padding: 1.25rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .transparency-note {
            display: flex;
            align-items: center;
            gap: 1rem;
            max-width: 600px;
        }

        .info-circle {
            width: 2.5rem;
            height: 2.5rem;
            background: #f1f5f9;
            color: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-weight: 800;
        }

        .note-text h4 {
            font-size: 0.95rem;
            font-weight: 800;
            margin-bottom: 0.15rem;
        }

        .note-text p {
            font-size: 0.8rem;
            color: var(--text-secondary);
            line-height: 1.4;
        }

        .bottom-actions {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .link-download {
            font-size: 0.85rem;
            font-weight: 800;
            color: var(--primary);
            text-decoration: none;
        }

        .btn-compare {
            background: #1e1b4b;
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 0.75rem;
            border: none;
            font-weight: 800;
            font-size: 0.85rem;
            cursor: pointer;
        }

        @media (max-width: 1200px) {
            .main-content { margin-left: 0; }
            .content-grid { grid-template-columns: 1fr; }
            .side-widgets { display: none; }
        }
    </style>
</head>
<body>

    <c:set var="activeCandidateNav" value="competing" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <main class="main-content">
        <header class="top-bar">
            <div class="search-container">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <input type="text" id="competitorSearch" placeholder="Search competitors by name or party...">
            </div>
            <div class="top-bar-right">
                <div class="user-profile">
                    <div style="text-align: right;">
                        <h4 style="font-size: 0.9rem; font-weight: 800;"><c:out value="${sessionScope.user.fullName}" /></h4>
                        <p style="font-size: 0.75rem; color: var(--text-secondary);">#<c:out value="${sessionScope.user.id}" /></p>
                    </div>
                    <div class="user-avatar">
                        <img src="https://ui-avatars.com/api/?name=${fn:replace(sessionScope.user.fullName, ' ', '+')}&background=0f172a&color=fff" alt="Avatar" style="width:100%; height:100%; object-fit:cover;">
                    </div>
                </div>
            </div>
        </header>

        <section class="page-header">
            <div class="header-title">
                <h1>Constituency Competitors</h1>
                <p><c:out value="${constituency.name}" /> Constituency • <span><c:out value="${fn:length(competingCandidates)}" /> Registered Candidates</span></p>
            </div>
            <div class="header-actions">
                <button class="btn-filter" onclick="filterByParty()">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M22 3H2l8 9.46V19l4 2v-8.54L22 3z"></path></svg>
                    Filter by Party
                </button>
                <button class="btn-filter" onclick="sortByPopularity()">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M3 18h18M3 12h18M3 6h18"></path></svg>
                    Sort by Popularity
                </button>
            </div>
        </section>

        <div class="content-grid">
            <div class="competitors-list">
                <%-- Featured Card (Top Opponent) --%>
                <c:if test="${not empty competingCandidates}">
                    <c:set var="topOpponent" value="${null}" />
                    <c:forEach var="c" items="${competingCandidates}">
                        <c:if test="${c.user.id != sessionScope.user.id}">
                            <c:if test="${empty topOpponent || c.totalVotes > topOpponent.totalVotes}">
                                <c:set var="topOpponent" value="${c}" />
                            </c:if>
                        </c:if>
                    </c:forEach>

                    <c:if test="${not empty topOpponent}">
                        <div class="featured-card">
                            <div class="candidate-img-container">
                                <img src="https://ui-avatars.com/api/?name=${fn:replace(topOpponent.user.fullName, ' ', '+')}&background=1e1b4b&color=fff&size=240" alt="Top Opponent" style="width:100%; height:100%; object-fit:cover; opacity: 0.8;">
                            </div>
                            <div class="candidate-info">
                                <div class="badge-leading">Leading Opponent</div>
                                <div class="party-tag"><c:out value="${topOpponent.partyName}" /> • <c:out value="${topOpponent.partyType}" /> Party</div>
                                <h2 class="candidate-name"><c:out value="${topOpponent.user.fullName}" /></h2>
                                <p class="candidate-bio">
                                    <c:choose>
                                        <c:when test="${not empty topOpponent.manifesto}">
                                            ${fn:substring(topOpponent.manifesto, 0, 180)}${fn:length(topOpponent.manifesto) > 180 ? '...' : ''}
                                        </c:when>
                                        <c:otherwise>
                                            Official candidate representing the <c:out value="${topOpponent.partyName}" /> in the <c:out value="${constituency.name}" /> constituency. Focused on sustainable development and urban growth.
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <div class="featured-actions">
                                    <div class="party-alpha">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"></circle><path d="M12 8l4 4-4 4M8 12h8"></path></svg>
                                        Party <c:out value="${topOpponent.symbol}" />
                                    </div>
                                    <a href="${pageContext.request.contextPath}/candidate/profile" class="view-profile-link">View Profile →</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>

                <%-- Other Competitors Grid --%>
                <div class="cards-grid" id="competitorGrid">
                    <c:forEach var="comp" items="${competingCandidates}">
                        <%-- Skip the logged-in user if they are in the list --%>
                        <c:if test="${comp.user.id != sessionScope.user.id}">
                            <div class="competitor-card" data-name="${comp.user.fullName}" data-party="${comp.partyName}" data-votes="${comp.totalVotes}">
                                <div class="card-header">
                                    <div class="mini-avatar">
                                        <img src="https://ui-avatars.com/api/?name=${fn:replace(comp.user.fullName, ' ', '+')}&background=1e1b4b&color=fff&size=100" alt="Avatar" style="width:100%; height:100%; object-fit:cover;">
                                    </div>
                                    <div class="party-logo">
                                        <c:choose>
                                            <c:when test="${comp.partyType == 'INDEPENDENT'}">
                                                <span style="font-size: 1.5rem;">⚖️</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="font-size: 1.5rem;">🏛️</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span><c:out value="${comp.partyName}" /></span>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h3><c:out value="${comp.user.fullName}" /></h3>
                                    <p>
                                        <c:choose>
                                            <c:when test="${not empty comp.manifesto}">
                                                ${fn:substring(comp.manifesto, 0, 80)}${fn:length(comp.manifesto) > 80 ? '...' : ''}
                                            </c:when>
                                            <c:otherwise>
                                                Candidate representing <c:out value="${comp.partyName}" /> in the current election cycle.
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="reach-section">
                                    <c:set var="reach" value="${totalConstituencyVotes > 0 ? (comp.totalVotes * 100 / totalConstituencyVotes) : 0}" />
                                    <div class="reach-label">
                                        <span>Estimated Reach</span>
                                        <span><fmt:formatNumber value="${reach}" maxFractionDigits="1" />%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill" style="width: ${reach > 0 ? reach : 5}%"></div>
                                    </div>
                                </div>
                                <button class="btn-card-action" onclick="location.href='${pageContext.request.contextPath}/candidate/profile'">View Profile</button>
                            </div>
                        </c:if>
                    </c:forEach>
                    
                    <%-- Placeholder if no other competitors --%>
                    <c:if test="${fn:length(competingCandidates) <= 1}">
                        <div style="grid-column: span 2; padding: 3rem; text-align: center; background: white; border-radius: 1.5rem; border: 1px dashed var(--border);">
                            <p style="color: var(--text-secondary); font-weight: 600;">No other registered competitors in this constituency yet.</p>
                        </div>
                    </c:if>
                </div>
            </div>

            <%-- Right Sidebar Widgets --%>
            <aside class="side-widgets">
                <div class="widget-pulse">
                    <div class="pulse-header">
                        <h2>Constituency Pulse</h2>
                    </div>
                    <div class="pulse-item">
                        <div class="pulse-icon">📈</div>
                        <div class="pulse-info">
                            <small>Voter Turnout Trend</small>
                            <p>+12% increase</p>
                        </div>
                    </div>
                    <div class="pulse-item">
                        <div class="pulse-icon">🛡️</div>
                        <div class="pulse-info">
                            <small>Key Issue</small>
                            <p>Public Safety</p>
                        </div>
                    </div>
                    <button class="btn-pulse" onclick="location.href='${pageContext.request.contextPath}/candidate/dashboard'">Full Analytics</button>
                </div>

                <div style="background: white; border: 1px solid var(--border); border-radius: 1.5rem; padding: 1.5rem; text-align: center;">
                    <p style="font-size: 0.75rem; color: var(--text-secondary); font-weight: 700; margin-bottom: 1rem; text-transform: uppercase;">Voter Awareness</p>
                    <div style="font-size: 2.5rem; font-weight: 800; color: var(--accent);"><c:out value="${votePercentage}" />%</div>
                    <p style="font-size: 0.8rem; font-weight: 600; color: var(--text-primary);">Constituency Reach</p>
                </div>
            </aside>
        </div>

        <footer class="bottom-section">
            <div class="transparency-note">
                <div class="info-circle">i</div>
                <div class="note-text">
                    <h4>Transparency Note</h4>
                    <p>Candidate profiles and estimated reaches are based on publicly filed affidavits and recent survey data.</p>
                </div>
            </div>
            <div class="bottom-actions">
                <a href="#" class="link-download" onclick="window.print(); return false;">Download Report</a>
                <button class="btn-compare" onclick="alert('Metric comparison feature coming soon!')">Compare Metrics</button>
            </div>
        </footer>
    </main>

    <script>
        // Search Functionality
        document.getElementById('competitorSearch').addEventListener('input', function(e) {
            const term = e.target.value.toLowerCase();
            const cards = document.querySelectorAll('.competitor-card');
            
            cards.forEach(card => {
                const name = card.getAttribute('data-name').toLowerCase();
                const party = card.getAttribute('data-party').toLowerCase();
                if (name.includes(term) || party.includes(term)) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // Filter by Party (Toggle Unique Parties)
        function filterByParty() {
            const party = prompt("Enter party name to filter (leave empty to show all):");
            const cards = document.querySelectorAll('.competitor-card');
            
            cards.forEach(card => {
                if (!party || card.getAttribute('data-party').toLowerCase().includes(party.toLowerCase())) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        // Sort by Popularity (Votes)
        let sortAsc = false;
        function sortByPopularity() {
            const grid = document.getElementById('competitorGrid');
            const cards = Array.from(grid.querySelectorAll('.competitor-card'));
            
            cards.sort((a, b) => {
                const votesA = parseInt(a.getAttribute('data-votes'));
                const votesB = parseInt(b.getAttribute('data-votes'));
                return sortAsc ? votesA - votesB : votesB - votesA;
            });
            
            sortAsc = !sortAsc;
            cards.forEach(card => grid.appendChild(card));
        }
    </script>

</body>
</html>
