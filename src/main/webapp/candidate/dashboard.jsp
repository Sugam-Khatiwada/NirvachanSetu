<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Portal - NirvachanSetu</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --sidebar-bg: #1e1b4b; /* Dark Navy from mockup */
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

        /* Main Content Area */
        .main-content {
            flex: 1;
            margin-left: 260px;
            padding: 1.5rem 2.5rem;
            display: flex;
            flex-direction: column;
            gap: 1.75rem;
            max-width: 1600px;
        }


        /* Dashboard Content Layout */
        .dash-row-top {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 1.5rem;
        }

        /* Hero Card */
        .hero-card {
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 100%);
            border-radius: 1.5rem;
            padding: 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .hero-card::before {
            content: "";
            position: absolute;
            right: -10%;
            top: -10%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.08) 0%, transparent 70%);
            z-index: 1;
        }

        .status-chips {
            display: flex;
            gap: 0.75rem;
            z-index: 2;
        }

        .chip {
            padding: 0.4rem 0.8rem;
            border-radius: 2rem;
            font-size: 0.7rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .chip.light {
            background-color: rgba(255, 255, 255, 0.15);
            color: white;
        }

        .chip.warning {
            background-color: #fbbf24;
            color: #1e1b4b;
        }

        .hero-title {
            font-size: 2rem;
            font-weight: 800;
            max-width: 540px;
            line-height: 1.15;
            z-index: 2;
        }

        .hero-actions {
            display: flex;
            gap: 1rem;
            margin-top: 0.75rem;
            z-index: 2;
        }

        .btn {
            padding: 0.85rem 1.75rem;
            border-radius: 0.75rem;
            font-weight: 800;
            font-size: 0.9rem;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-white {
            background-color: white;
            color: #1e1b4b;
        }

        .btn-white:hover {
            background-color: #f1f5f9;
            transform: translateY(-1px);
        }

        .btn-outline {
            border: 1.5px solid rgba(255, 255, 255, 0.3);
            color: white;
        }

        .btn-outline:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .hero-submission {
            position: absolute;
            right: 2.5rem;
            bottom: 2.5rem;
            text-align: right;
            opacity: 0.9;
            z-index: 2;
        }

        .hero-submission label {
            display: block;
            font-size: 0.7rem;
            margin-bottom: 0.25rem;
            color: #94a3b8;
            font-weight: 600;
            text-transform: uppercase;
        }

        .hero-submission span {
            font-weight: 800;
            font-size: 1.1rem;
        }

        /* Countdown Card */
        .countdown-card {
            background-color: white;
            border-radius: 1.5rem;
            padding: 2.25rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            border: 1px solid var(--border);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        .countdown-card h3 {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--text-secondary);
            margin-bottom: 1.75rem;
            font-weight: 800;
        }

        .progress-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: conic-gradient(var(--primary) var(--ring-pct, 42%), #f1f5f9 0%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.75rem;
            position: relative;
            transition: background 0.6s ease;
        }

        .progress-circle::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            background-color: white;
            border-radius: 50%;
        }

        .progress-content {
            position: relative;
            z-index: 1;
        }

        .progress-content span {
            display: block;
            font-size: 2.75rem;
            font-weight: 800;
            color: var(--text-primary);
            line-height: 1;
        }

        .progress-content label {
            font-size: 0.65rem;
            text-transform: uppercase;
            color: var(--text-secondary);
            font-weight: 800;
            letter-spacing: 0.05em;
        }

        .election-date {
            font-weight: 800;
            font-size: 1.2rem;
            color: var(--text-primary);
            margin-bottom: 0.35rem;
        }

        .election-phase {
            font-size: 0.8rem;
            color: var(--text-secondary);
            font-weight: 500;
        }

        /* Statistics Cards Row */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.25rem;
        }

        .stat-card {
            background-color: white;
            border-radius: 1.5rem;
            padding: 1.75rem;
            border: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-2px);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .stat-icon {
            width: 2.75rem;
            height: 2.75rem;
            border-radius: 0.85rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stat-icon.blue { background-color: #eff6ff; color: #3b82f6; }
        .stat-icon.orange { background-color: #fff7ed; color: #f97316; }
        .stat-icon.purple { background-color: #faf5ff; color: #a855f7; }
        .stat-icon.green { background-color: #f0fdf4; color: #22c55e; }

        .stat-trend {
            font-size: 0.75rem;
            font-weight: 800;
        }

        .trend-up { color: var(--success); }
        .trend-neutral { color: var(--text-secondary); }

        .stat-body label {
            display: block;
            font-size: 0.75rem;
            color: var(--text-secondary);
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .stat-body h2 {
            font-size: 1.65rem;
            font-weight: 800;
            color: var(--text-primary);
        }

        .stat-footer {
            font-size: 0.75rem;
            color: var(--text-secondary);
            font-weight: 500;
        }

        /* Bottom Grid: Milestones & Map */
        .dash-row-bottom {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 1.5rem;
        }

        .section-card {
            background-color: white;
            border-radius: 1.5rem;
            padding: 2.25rem;
            border: 1px solid var(--border);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .section-header h3 {
            font-size: 1.15rem;
            font-weight: 800;
        }

        .section-header a {
            font-size: 0.85rem;
            color: var(--primary);
            font-weight: 800;
            text-decoration: none;
        }

        /* Timeline Styling */
        .timeline {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .timeline-item {
            display: flex;
            gap: 1.5rem;
            position: relative;
        }

        .timeline-marker {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .marker-dot {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            z-index: 2;
        }

        .marker-dot.completed { background-color: #d1fae5; color: #059669; }
        .marker-dot.active { background-color: #dbeafe; color: #2563eb; }
        .marker-dot.pending { background-color: #f1f5f9; color: #94a3b8; }

        .timeline-content {
            padding-top: 0.35rem;
        }

        .timeline-content h4 {
            font-size: 1rem;
            font-weight: 800;
            margin-bottom: 0.35rem;
            color: var(--text-primary);
        }

        .timeline-content p {
            font-size: 0.85rem;
            color: var(--text-secondary);
            line-height: 1.6;
            max-width: 600px;
        }

        .timeline-date {
            margin-left: auto;
            font-size: 0.75rem;
            color: var(--text-secondary);
            font-weight: 600;
            white-space: nowrap;
            padding-top: 0.5rem;
        }

        /* Map Mockup Styling */
        .map-container {
            width: 100%;
            height: 250px;
            background-color: #f1f5f9;
            border-radius: 1.25rem;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: radial-gradient(#cbd5e1 1.5px, transparent 1.5px);
            background-size: 24px 24px;
        }

        .map-dot {
            position: absolute;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: 2.5px solid white;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .map-dot.blue { background-color: #2563eb; top: 40%; left: 45%; }
        .map-dot.orange { background-color: #f97316; top: 65%; left: 78%; }
        .map-dot.gray { background-color: #64748b; top: 58%; left: 62%; }

        .map-action {
            margin-top: 1.75rem;
            display: flex;
            justify-content: flex-end;
        }

        .btn-create-post {
            background-color: var(--sidebar-bg);
            color: white;
            padding: 0.85rem 1.5rem;
            border-radius: 2rem;
            font-weight: 800;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.65rem;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .btn-create-post:hover {
            transform: translateY(-1px);
            background-color: #2e2a6e;
        }

        /* Custom Alert Styling */
        .alert {
            padding: 1.25rem;
            border-radius: 1rem;
            margin-bottom: 1.75rem;
            font-size: 0.9rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            border: 1.5px solid;
        }

        .alert-error {
            background-color: #fff1f2;
            color: #be123c;
            border-color: #fecdd3;
        }

        .alert-success {
            background-color: #f0fdf4;
            color: #15803d;
            border-color: #bbf7d0;
        }

        @media (max-width: 1300px) {
            .stats-row {
                grid-template-columns: repeat(2, 1fr);
            }
            .dash-row-top, .dash-row-bottom {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <c:set var="activeCandidateNav" value="dashboard" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <!-- MAIN CONTENT -->
    <main class="main-content">
        <jsp:include page="/layout/header.jsp" />

        <!-- Alerts -->
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-error">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
                <c:out value="${sessionScope.error}" />
            </div>
            <% request.getSession().removeAttribute("error"); %>
        </c:if>
        <c:if test="${not empty sessionScope.success}">
            <div class="alert alert-success">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                <c:out value="${sessionScope.success}" />
            </div>
            <% request.getSession().removeAttribute("success"); %>
        </c:if>

        <div class="dash-row-top">
            <!-- Hero Section -->
            <article class="hero-card">
                <div class="status-chips">
                    <span class="chip light">Application Status</span>
                    <span class="chip warning"><c:out value="${application != null ? application.status : 'VERIFICATION PENDING'}" /></span>
                </div>
                <h1 class="hero-title">
                    Your nomination for the <c:out value="${constituency != null ? constituency.name : 'South Delhi'}" /> Constituency.
                </h1>
                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/candidate/application" class="btn btn-white">Review Application</a>
                    <a href="#" class="btn btn-outline">Support Helpdesk</a>
                </div>
                <div class="hero-submission">
                    <label>Submission Date</label>
                    <span><c:out value="${application != null ? application.appliedAtFormatted : '14 OCT, 2023'}" /></span>
                </div>
            </article>

            <!-- Election Countdown -->
            <article class="countdown-card"
                id="countdownCard"
                data-election-date="${upcomingElection != null ? upcomingElection.startDateISO : ''}"
                data-election-name="${upcomingElection != null ? upcomingElection.name : ''}"
                data-election-display="${upcomingElection != null ? upcomingElection.startDateFull : ''}">
                <h3>Election Countdown</h3>
                <div class="progress-circle" id="countdownRing">
                    <div class="progress-content">
                        <span id="countdownDays">--</span>
                        <label id="countdownLabel">Days Left</label>
                    </div>
                </div>
                <div class="election-date" id="countdownDate">Loading...</div>
                <div class="election-phase" id="countdownPhase">Calculating...</div>
            </article>
        </div>

        <!-- Statistics Row -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon blue">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    </div>
                    <span class="stat-trend trend-up">+2.4%</span>
                </div>
                <div class="stat-body">
                    <label>Total Registered Voters</label>
                    <h2>1,248,302</h2>
                </div>
                <div class="stat-footer">Current counted ballots</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon orange">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    </div>
                    <span class="stat-trend trend-neutral">Ranked 3rd</span>
                </div>
                <div class="stat-body">
                    <label>Predicted Reach Index</label>
                    <h2><c:out value="${votePercentage > 0 ? votePercentage : 84.2}" />%</h2>
                </div>
                <div class="stat-footer">Projected influence score</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon purple">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                    </div>
                    <span class="stat-trend trend-up">All Active</span>
                </div>
                <div class="stat-body">
                    <label>Active Polling Stations</label>
                    <h2>1,402</h2>
                </div>
                <div class="stat-footer">In your constituency</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon green">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                    </div>
                    <a href="#" style="text-decoration:none; font-size:0.75rem; color:var(--primary); font-weight:800;">Details</a>
                </div>
                <div class="stat-body">
                    <label>Fund Utilization</label>
                    <h2>₹4.2M</h2>
                </div>
                <div class="stat-footer"><c:out value="${candidate != null ? candidate.partyName : 'National Peoples Party'}" /></div>
            </div>
        </div>

        <div class="dash-row-bottom">
            <!-- Election Milestones -->
            <section class="section-card">
                <div class="section-header">
                    <h3>Election Milestones</h3>
                    <a href="#">View Timeline</a>
                </div>
                <div class="timeline">
                    <div class="timeline-item">
                        <div class="timeline-marker">
                            <div class="marker-dot completed">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            </div>
                        </div>
                        <div class="timeline-content">
                            <h4>Document Upload Completed</h4>
                            <p>Identity proof, educational certificates, and residential proof have been successfully verified by the portal's OCR system.</p>
                        </div>
                        <div class="timeline-date">Oct 12, 11:40 AM</div>
                    </div>

                    <div class="timeline-item">
                        <div class="timeline-marker">
                            <div class="marker-dot active">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                            </div>
                        </div>
                        <div class="timeline-content">
                            <h4>Physical Verification Scheduled</h4>
                            <p>In-person meeting with the Returning Officer (RO) at the Zonal Election Office for oath taking and original document inspection.</p>
                        </div>
                        <div class="timeline-date">Oct 20, 09:00 AM</div>
                    </div>

                    <div class="timeline-item">
                        <div class="timeline-marker">
                            <div class="marker-dot pending"></div>
                        </div>
                        <div class="timeline-content">
                            <h4>Final Candidate List Publication</h4>
                            <p>Subject to successful clearance of all prior verification stages and absence of valid objections.</p>
                        </div>
                        <div class="timeline-date">Oct 28, 2023</div>
                    </div>
                </div>
            </section>

            <!-- Constituency Hotspots -->
            <section class="section-card">
                <div class="section-header">
                    <h3>Constituency Hotspots</h3>
                </div>
                <div class="map-container">
                    <div class="map-dot blue"></div>
                    <div class="map-dot orange"></div>
                    <div class="map-dot gray"></div>
                </div>
                <div class="map-action">
                    <button class="btn-create-post">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                        Create Campaign Post
                    </button>
                </div>
            </section>
        </div>

        <jsp:include page="/layout/footer.jsp" />
    </main>

<script>
(function () {
    var card       = document.getElementById('countdownCard');
    var daysEl     = document.getElementById('countdownDays');
    var labelEl    = document.getElementById('countdownLabel');
    var dateEl     = document.getElementById('countdownDate');
    var phaseEl    = document.getElementById('countdownPhase');
    var ringEl     = document.getElementById('countdownRing');

    if (!card) return;

    var isoDate     = card.getAttribute('data-election-date');   // e.g. "2026-08-15"
    var phaseName   = card.getAttribute('data-election-name')  || 'Upcoming Election';
    var displayDate = card.getAttribute('data-election-display') || '';

    // If the servlet didn't provide startDateISO, try to parse startDateFull as fallback
    if (!isoDate && displayDate) {
        var parsed = new Date(displayDate);
        if (!isNaN(parsed)) isoDate = parsed.toISOString().split('T')[0];
    }

    if (!isoDate) {
        daysEl.textContent   = 'N/A';
        labelEl.textContent  = '';
        dateEl.textContent   = 'No upcoming election';
        phaseEl.textContent  = 'Check back later';
        ringEl.style.setProperty('--ring-pct', '0%');
        return;
    }

    // Parse the election date at midnight local time
    var parts       = isoDate.split('-');
    var electionDay = new Date(+parts[0], +parts[1] - 1, +parts[2]);

    // Pretty-print the date
    var opts = { year: 'numeric', month: 'long', day: 'numeric' };
    dateEl.textContent  = electionDay.toLocaleDateString(undefined, opts);
    phaseEl.textContent = phaseName;

    function update() {
        var now      = new Date();
        var todayMid = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        var diffMs   = electionDay - todayMid;
        var daysLeft = Math.ceil(diffMs / 86400000);

        if (daysLeft < 0) {
            // Date has passed — treat as no upcoming election
            daysEl.textContent  = 'N/A';
            labelEl.textContent = '';
            dateEl.textContent  = 'No upcoming election';
            phaseEl.textContent = 'Check back later';
            ringEl.style.setProperty('--ring-pct', '0%');
        } else if (daysLeft === 0) {
            daysEl.textContent  = 'TODAY';
            labelEl.textContent = 'Election Day!';
            ringEl.style.setProperty('--ring-pct', '100%');
        } else {
            daysEl.textContent  = daysLeft;
            labelEl.textContent = 'Days Left';
            // Ring fill: cap at 100 days for a full circle visual
            var pct = Math.min(100, Math.max(1, Math.round((100 - daysLeft) / 100 * 100)));
            ringEl.style.setProperty('--ring-pct', pct + '%');
        }
    }

    update();
    setInterval(update, 1000);
})();
</script>

</body>
</html>
