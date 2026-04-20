<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>National Results Dashboard - NirvachanSetu</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #0b1a40;
            --secondary-blue: #1d4ed8;
            --bg-color: #f4f6f8;
            --text-dark: #111827;
            --text-gray: #6b7280;
            --text-light: #9ca3af;
            --border-color: #e5e7eb;
            --card-bg: #ffffff;
            --font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: var(--font-family); background-color: var(--bg-color); color: var(--text-dark); line-height: 1.5; -webkit-font-smoothing: antialiased; }
        a { text-decoration: none; color: inherit; }
        
        .container { max-width: 1200px; margin: 0 auto; padding: 0 24px; }

        /* Main Content */
        .main-content { padding: 40px 0 60px; }
        
        /* Page Header */
        .page-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 32px; }
        .title-sub { font-size: 0.75rem; font-weight: 700; color: var(--text-gray); letter-spacing: 0.05em; text-transform: uppercase; margin-bottom: 8px; }
        .title-main { font-size: 2.25rem; font-weight: 800; color: var(--primary-blue); letter-spacing: -0.02em; }
        
        .header-actions { display: flex; gap: 16px; align-items: center; }
        .live-badge { background: white; padding: 10px 20px; border-radius: 24px; font-size: 0.875rem; font-weight: 600; display: flex; align-items: center; gap: 10px; color: var(--text-dark); border: 1px solid var(--border-color); }
        .live-dot { width: 8px; height: 8px; background: #ef4444; border-radius: 50%; display: inline-block; }
        @keyframes pulse { 0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.7); } 70% { transform: scale(1); box-shadow: 0 0 0 6px rgba(239, 68, 68, 0); } 100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(239, 68, 68, 0); } }
        .live-dot { animation: pulse 2s infinite; }
        .btn-export { background: var(--primary-blue); color: white; border: none; padding: 10px 20px; border-radius: 8px; font-weight: 600; font-size: 0.875rem; cursor: pointer; display: flex; align-items: center; gap: 8px; transition: background-color 0.2s; }
        .btn-export:hover { background: #07122b; }

        /* Stats Row */
        .stats-row { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 32px; }
        .stat-card { background: white; padding: 24px; border-radius: 12px; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .stat-label { font-size: 0.875rem; color: var(--text-gray); font-weight: 500; margin-bottom: 8px; }
        .stat-value { font-size: 2.25rem; font-weight: 700; color: var(--primary-blue); letter-spacing: -0.02em; }
        .stat-bar-wrapper { width: 100%; height: 4px; background: #f3f4f6; margin-top: 24px; border-radius: 2px; overflow: hidden; }
        .stat-bar { height: 100%; border-radius: 2px; }
        .bar-full { width: 100%; background: var(--primary-blue); }
        .bar-partial { background: var(--secondary-blue); }
        .bar-leading { background: #5c1814; }
        .bar-turnout { background: var(--secondary-blue); }

        /* Middle Row */
        .middle-row { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; margin-bottom: 40px; }
        .chart-card { background: white; padding: 32px; border-radius: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.02); display: flex; flex-direction: column; }
        .chart-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 32px; }
        .card-title { font-size: 1.125rem; font-weight: 700; color: var(--primary-blue); }
        
        /* Bar Chart Area */
        .legend { display: flex; gap: 20px; font-size: 0.75rem; font-weight: 600; color: var(--text-gray); }
        .legend-item { display: flex; align-items: center; gap: 8px; }
        .dot { width: 10px; height: 10px; border-radius: 50%; }
        .dot-a { background: var(--primary-blue); }
        .dot-b { background: var(--secondary-blue); }
        
        .chart-area { flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-end; min-height: 240px; position: relative; }
        .x-axis { display: flex; justify-content: space-between; padding-top: 16px; margin-top: 24px; color: var(--text-dark); font-size: 0.75rem; font-weight: 700; padding: 16px 24px 0; }
        .x-axis span { flex: 1; text-align: center; }

        /* Donut Chart */
        .donut-container { display: flex; flex-direction: column; align-items: center; padding-top: 16px; }
        .donut { position: relative; width: 200px; height: 200px; border-radius: 50%; margin-bottom: 40px; }
        .donut-inner { position: absolute; width: 150px; height: 150px; background: white; border-radius: 50%; top: 25px; left: 25px; display: flex; flex-direction: column; justify-content: center; align-items: center; box-shadow: inset 0 2px 4px rgba(0,0,0,0.02); }
        .donut-val { font-size: 2rem; font-weight: 800; color: var(--primary-blue); letter-spacing: -0.02em; line-height: 1; }
        .donut-lbl { font-size: 0.65rem; font-weight: 700; color: var(--text-dark); margin-top: 4px; letter-spacing: 0.05em; }

        .turnout-stats { width: 100%; display: flex; flex-direction: column; gap: 16px; }
        .t-stat { display: flex; justify-content: space-between; align-items: center; }
        .t-stat-label { font-size: 0.875rem; font-weight: 500; color: var(--text-gray); }
        .t-stat-val { font-size: 0.875rem; font-weight: 700; color: var(--primary-blue); }

        /* Bottom Row */
        .section-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 24px; }
        .section-title { font-size: 1.25rem; font-weight: 700; color: var(--primary-blue); }
        .view-all { font-size: 0.875rem; font-weight: 600; color: var(--secondary-blue); display: flex; align-items: center; gap: 4px; transition: color 0.15s; }
        .view-all:hover { color: var(--primary-blue); }

        .candidates-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
        .cand-card { background: #f9fafb; padding: 16px; border-radius: 12px; display: flex; align-items: center; gap: 16px; transition: transform 0.2s, box-shadow 0.2s; border: 1px solid transparent; }
        .cand-card:hover { transform: translateY(-2px); box-shadow: 0 4px 6px rgba(0,0,0,0.05); border-color: var(--border-color); background: white; }
        .cand-img-wrap { position: relative; width: 64px; height: 64px; border-radius: 8px; flex-shrink: 0; }
        .cand-img-wrap img { width: 100%; height: 100%; object-fit: cover; border-radius: 8px; background: #e5e7eb; }
        .badge-lead { position: absolute; bottom: -8px; left: 50%; transform: translateX(-50%); background: var(--primary-blue); color: white; font-size: 0.6rem; font-weight: 800; padding: 2px 8px; border-radius: 4px; box-shadow: 0 0 0 2px #f9fafb; letter-spacing: 0.05em; }
        .cand-card:hover .badge-lead { box-shadow: 0 0 0 2px white; }
        
        .cand-info { flex-grow: 1; }
        .cand-name { font-weight: 700; font-size: 1rem; color: var(--text-dark); margin-bottom: 2px; }
        .cand-party { font-size: 0.75rem; color: var(--text-gray); margin-bottom: 6px; font-weight: 500; }
        .cand-votes { font-size: 0.875rem; font-weight: 700; color: var(--primary-blue); }
        
        .margin-badge { background: #feeded; color: #9f4939; padding: 4px 10px; border-radius: 12px; font-size: 0.7rem; font-weight: 700; white-space: nowrap; align-self: flex-end; margin-bottom: 4px; }

        /* Empty State */
        .empty-state { text-align: center; padding: 60px 20px; background: white; border-radius: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .empty-state i { font-size: 3rem; color: var(--text-light); margin-bottom: 16px; }
        .empty-state h3 { font-size: 1.5rem; font-weight: 700; color: var(--primary-blue); margin-bottom: 8px; }
        .empty-state p { color: var(--text-gray); }

        @media (max-width: 1024px) {
            .stats-row { grid-template-columns: repeat(2, 1fr); }
            .middle-row { grid-template-columns: 1fr; }
            .candidates-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 768px) {
            .stats-row, .candidates-grid { grid-template-columns: 1fr; }
            .page-header { flex-direction: column; align-items: flex-start; gap: 16px; }
            .header-actions { width: 100%; justify-content: space-between; }
        }
    </style>
</head>
<body>

    <main class="main-content container">
        
        <c:choose>
            <c:when test="${not empty dashboardStats and dashboardStats.totalSeats > 0}">
                
                <!-- Page Header -->
                <div class="page-header">
                    <div>
                        <div class="title-sub">LIVE ELECTION FEED</div>
                        <h1 class="title-main">National Results Dashboard</h1>
                    </div>
                    <div class="header-actions">
                        <div class="live-badge">
                            <span class="live-dot"></span> Live Updates: <c:out value="${dashboardStats.lastUpdated}" default="--:--" />
                        </div>
                        <button class="btn-export">
                            <i class="fa-solid fa-download"></i> Export Report
                        </button>
                    </div>
                </div>

                <!-- 4 Stats Cards -->
                <div class="stats-row">
                    <div class="stat-card">
                        <div>
                            <div class="stat-label">Total Seats</div>
                            <div class="stat-value"><c:out value="${dashboardStats.totalSeats}" /></div>
                        </div>
                        <div class="stat-bar-wrapper">
                            <div class="stat-bar bar-full"></div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div>
                            <div class="stat-label">Declared</div>
                            <div class="stat-value"><c:out value="${dashboardStats.declared}" /></div>
                        </div>
                        <div class="stat-bar-wrapper">
                            <c:set var="declaredWidth" value="width: ${dashboardStats.declared * 100 / dashboardStats.totalSeats}%;" />
                            <div class="stat-bar bar-partial" style="${declaredWidth}"></div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div>
                            <div class="stat-label">Leading</div>
                            <div class="stat-value"><c:out value="${dashboardStats.leading}" /></div>
                        </div>
                        <div class="stat-bar-wrapper">
                            <c:set var="leadingWidth" value="width: ${dashboardStats.leading * 100 / dashboardStats.totalSeats}%;" />
                            <div class="stat-bar bar-leading" style="${leadingWidth}"></div>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div>
                            <div class="stat-label">Voter Turnout</div>
                            <div class="stat-value"><c:out value="${dashboardStats.voterTurnout}" />%</div>
                        </div>
                        <div class="stat-bar-wrapper">
                            <c:set var="turnoutWidth" value="width: ${dashboardStats.voterTurnout}%;" />
                            <div class="stat-bar bar-turnout" style="${turnoutWidth}"></div>
                        </div>
                    </div>
                </div>

                <!-- Middle Section: Charts -->
                <div class="middle-row">
                    <!-- Party Distribution -->
                    <div class="chart-card">
                        <div class="chart-header">
                            <h2 class="card-title">Party-wise Vote Distribution</h2>
                        </div>
                        <div class="chart-area">
                            <c:if test="${empty partyDistributions}">
                                <p style="text-align:center; color: var(--text-gray); margin:auto;">No party data available yet.</p>
                            </c:if>
                            <c:if test="${not empty partyDistributions}">
                                <div class="x-axis">
                                    <c:forEach var="party" items="${partyDistributions}">
                                        <span><c:out value="${party.name}" /></span>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Constituency Turnout -->
                    <div class="chart-card">
                        <h2 class="card-title">Constituency Turnout</h2>
                        <div class="donut-container">
                            <c:set var="donutBg" value="background: conic-gradient(var(--primary-blue) 0% ${dashboardStats.voterTurnout}%, #f3f4f6 ${dashboardStats.voterTurnout}% 100%);" />
                            <div class="donut" style="${donutBg}">
                                <div class="donut-inner">
                                    <span class="donut-val"><c:out value="${dashboardStats.voterTurnout}" />%</span>
                                    <span class="donut-lbl">OVERALL</span>
                                </div>
                            </div>
                            <div class="turnout-stats">
                                <div class="t-stat">
                                    <span class="t-stat-label">Rural Areas</span>
                                    <span class="t-stat-val"><c:out value="${dashboardStats.ruralTurnout}" />%</span>
                                </div>
                                <div class="t-stat">
                                    <span class="t-stat-label">Urban Centers</span>
                                    <span class="t-stat-val"><c:out value="${dashboardStats.urbanTurnout}" />%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Leading Candidates Section -->
                <div class="section-header">
                    <h2 class="section-title">Leading Candidates</h2>
                    <a href="#" class="view-all">View All Constituencies</a>
                </div>
                
                <div class="candidates-grid">
                    <c:choose>
                        <c:when test="${not empty leadingCandidates}">
                            <c:forEach var="candidate" items="${leadingCandidates}">
                                <div class="cand-card">
                                    <div class="cand-img-wrap">
                                        <img src="https://ui-avatars.com/api/?name=${candidate.name}&background=0D8ABC&color=fff" alt="Candidate">
                                        <span class="badge-lead">LEAD</span>
                                    </div>
                                    <div class="cand-info">
                                        <div class="cand-name"><c:out value="${candidate.name}" /></div>
                                        <div class="cand-party"><c:out value="${candidate.party}" /> &bull; <c:out value="${candidate.constituency}" /></div>
                                        <div class="cand-votes"><c:out value="${candidate.votes}" /> votes</div>
                                    </div>
                                    <div class="margin-badge">+<c:out value="${candidate.margin}" /> margin</div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p style="grid-column: 1 / -1; text-align: center; color: var(--text-gray);">No leading candidate data available at this time.</p>
                        </c:otherwise>
                    </c:choose>
                </div>

            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fa-solid fa-chart-bar"></i>
                    <h3>No Results Available</h3>
                    <p>The election counting has not started or data is temporarily unavailable. Please check back later.</p>
                </div>
            </c:otherwise>
        </c:choose>

    </main>

</body>
</html>
