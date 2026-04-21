<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NirvachanSetu - Candidate Dashboard</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">

  <style>
    :root {
      --dash-bg: #f4f7fc;
      --dash-surface: #ffffff;
      --dash-border: #e7ebf3;
      --dash-text: #0f172a;
      --dash-muted: #64748b;
      --dash-primary: #0f3a97;
      --dash-primary-2: #1c4fd8;
    }

    body {
      background: radial-gradient(150% 150% at 0% 0%, #eef3ff 0%, #f6f8fc 40%, #f4f7fc 100%);
      color: var(--dash-text);
    }

    .candidate-shell {
      max-width: 1380px;
      margin: 0 auto;
      padding: 1.1rem;
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: 250px minmax(0, 1fr);
      gap: 1rem;
      align-items: start;
    }

    .panel {
      border: 1px solid var(--dash-border);
      border-radius: 1rem;
      background: var(--dash-surface);
      box-shadow: 0 10px 18px -14px rgba(15, 58, 151, 0.35);
    }

    .content-col {
      display: flex;
      flex-direction: column;
      gap: 0.95rem;
    }

    .top-row {
      display: grid;
      grid-template-columns: minmax(0, 2.2fr) minmax(0, 1fr);
      gap: 0.95rem;
    }

    .hero-card {
      border-radius: 1rem;
      color: white;
      min-height: 205px;
      background: radial-gradient(65% 130% at 105% 0%, rgba(255, 255, 255, 0.17) 0%, rgba(255, 255, 255, 0) 58%),
            linear-gradient(135deg, #0d3488 0%, #1a4bbd 56%, #2f63dc 100%);
      padding: 1.2rem;
      position: relative;
      overflow: hidden;
    }

    .hero-chip-wrap {
      display: flex;
      gap: 0.55rem;
      flex-wrap: wrap;
      margin-bottom: 0.85rem;
    }

    .hero-chip {
      border-radius: 9999px;
      font-size: 0.66rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      font-weight: 800;
      padding: 0.27rem 0.55rem;
    }

    .hero-chip.soft {
      background: rgba(255, 255, 255, 0.19);
      color: #dbe7ff;
    }

    .hero-chip.warn {
      color: #7c2d12;
      background: #fcd34d;
    }

    .hero-title {
      margin: 0;
      font-size: clamp(1.35rem, 2.1vw, 2rem);
      line-height: 1.16;
      max-width: 620px;
      font-weight: 800;
    }

    .hero-actions {
      margin-top: 1.2rem;
      display: flex;
      gap: 0.55rem;
      flex-wrap: wrap;
    }

    .hero-btn {
      border: 1px solid rgba(255, 255, 255, 0.35);
      background: rgba(255, 255, 255, 0.13);
      color: white;
      font-size: 0.78rem;
      font-weight: 700;
      border-radius: 0.65rem;
      padding: 0.48rem 0.7rem;
      text-decoration: none;
    }

    .hero-btn.primary {
      background: white;
      color: #12337f;
      border-color: white;
    }

    .hero-meta {
      position: absolute;
      right: 1rem;
      bottom: 1rem;
      text-align: right;
      font-size: 0.74rem;
      color: #d8e4ff;
    }

    .hero-meta strong {
      display: block;
      color: white;
      font-size: 0.85rem;
      margin-top: 0.18rem;
    }

    .countdown-card {
      padding: 1rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      min-height: 205px;
    }

    .countdown-card p {
      margin: 0;
      color: var(--dash-muted);
      font-size: 0.74rem;
      text-transform: uppercase;
      letter-spacing: 0.07em;
      font-weight: 700;
    }

    .count-circle {
      width: 108px;
      height: 108px;
      border-radius: 9999px;
      border: 7px solid #dbe6ff;
      color: #12337f;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      margin: 0.75rem 0;
      font-weight: 800;
    }

    .count-circle span {
      font-size: 2rem;
      line-height: 1;
    }

    .count-circle small {
      font-size: 0.62rem;
      color: var(--dash-muted);
      letter-spacing: 0.05em;
    }

    .stats-grid {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 0.75rem;
    }

    .stat-card {
      padding: 0.85rem;
    }

    .stat-meta {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 0.5rem;
    }

    .stat-dot {
      width: 1.65rem;
      height: 1.65rem;
      border-radius: 0.5rem;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 0.8rem;
      font-weight: 700;
    }

    .dot-blue { background: #e3ebff; color: #12337f; }
    .dot-green { background: #dcfce7; color: #166534; }
    .dot-amber { background: #fef3c7; color: #92400e; }
    .dot-purple { background: #ede9fe; color: #5b21b6; }

    .stat-label {
      color: #64748b;
      font-size: 0.73rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }

    .stat-value {
      margin-top: 0.25rem;
      font-size: 1.4rem;
      line-height: 1.1;
      font-weight: 800;
    }

    .stat-sub {
      margin-top: 0.2rem;
      color: #64748b;
      font-size: 0.72rem;
      font-weight: 600;
    }

    .bottom-row {
      display: grid;
      grid-template-columns: minmax(0, 1.45fr) minmax(0, 1fr);
      gap: 0.95rem;
    }

    .section-card {
      padding: 1rem;
    }

    .section-head {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0.9rem;
      gap: 0.7rem;
    }

    .section-head h3 {
      margin: 0;
      font-size: 1rem;
      font-weight: 800;
      color: #0f172a;
    }

    .section-head a {
      color: #1d4ed8;
      text-decoration: none;
      font-size: 0.78rem;
      font-weight: 700;
    }

    .timeline {
      display: flex;
      flex-direction: column;
      gap: 0.8rem;
    }

    .timeline-item {
      display: grid;
      grid-template-columns: 24px minmax(0, 1fr);
      gap: 0.65rem;
      align-items: start;
    }

    .timeline-badge {
      width: 24px;
      height: 24px;
      border-radius: 9999px;
      background: #ecf2ff;
      color: #1d4ed8;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 0.7rem;
      margin-top: 1px;
      font-weight: 700;
    }

    .timeline-item h4 {
      margin: 0;
      font-size: 0.86rem;
      font-weight: 700;
      color: #0f172a;
    }

    .timeline-item p {
      margin: 0.15rem 0 0;
      font-size: 0.75rem;
      color: #64748b;
      line-height: 1.45;
    }

    .heat-map {
      height: 186px;
      border: 1px dashed #d9e2fb;
      border-radius: 0.9rem;
      background: linear-gradient(180deg, #f7faff 0%, #eef4ff 100%);
      position: relative;
      overflow: hidden;
    }

    .map-shape {
      position: absolute;
      inset: 18px 18px 30px 18px;
      background: #dfe8fa;
      border-radius: 42% 58% 49% 51% / 40% 37% 63% 60%;
    }

    .pin {
      position: absolute;
      width: 11px;
      height: 11px;
      border-radius: 9999px;
      border: 2px solid white;
    }

    .pin.blue { background: #1d4ed8; left: 44%; top: 44%; }
    .pin.green { background: #16a34a; left: 62%; top: 34%; }
    .pin.amber { background: #f59e0b; left: 72%; top: 62%; }

    .competitor-list {
      margin-top: 0.8rem;
      display: flex;
      flex-direction: column;
      gap: 0.55rem;
      max-height: 172px;
      overflow: auto;
    }

    .competitor-item {
      display: flex;
      justify-content: space-between;
      gap: 0.5rem;
      border: 1px solid #e8edf9;
      border-radius: 0.65rem;
      background: #fbfdff;
      padding: 0.52rem 0.58rem;
      font-size: 0.78rem;
    }

    .alert-strip {
      padding: 0.72rem 0.85rem;
      border-radius: 0.72rem;
      font-size: 0.82rem;
      border: 1px solid;
      margin-bottom: 0.8rem;
    }

    .alert-error {
      background: #fef2f2;
      color: #b91c1c;
      border-color: #fecaca;
    }

    .alert-success {
      background: #f0fdf4;
      color: #166534;
      border-color: #bbf7d0;
    }

    @media (max-width: 1180px) {
      .stats-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }

      .top-row,
      .bottom-row {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 980px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body class="font-inter">

<%-- ===== SHARED HEADER INCLUDE: START ===== --%>
<jsp:include page="/layout/header.jsp" />
<%-- ===== SHARED HEADER INCLUDE: END ===== --%>

<main class="candidate-shell">
  <div class="dashboard-grid">
    <%-- ===== SIDEBAR MOVED TO LAYOUT INCLUDE: START ===== --%>
    <c:set var="activeCandidateNav" value="dashboard" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />
    <%-- ===== SIDEBAR MOVED TO LAYOUT INCLUDE: END ===== --%>

    <%-- ===== DASHBOARD CONTENT AREA: START ===== --%>
    <section class="content-col">
      <c:if test="${not empty error}">
        <div class="alert-strip alert-error"><c:out value="${error}" /></div>
      </c:if>
      <c:if test="${not empty sessionScope.success}">
        <div class="alert-strip alert-success"><c:out value="${sessionScope.success}" /></div>
        <% request.getSession().removeAttribute("success"); %>
      </c:if>

      <div class="top-row">
        <article class="hero-card panel">
          <div class="hero-chip-wrap">
            <span class="hero-chip soft">Application Status</span>
            <span class="hero-chip warn">
              <c:out value="${application != null ? application.status : 'VERIFICATION PENDING'}" />
            </span>
          </div>

          <h1 class="hero-title">
            Your nomination for the
            <c:out value="${constituency != null ? constituency.name : 'Selected Constituency'}" /> Constituency.
          </h1>

          <div class="hero-actions">
            <a href="${pageContext.request.contextPath}/candidate/application" class="hero-btn primary">Review Application</a>
            <a href="${pageContext.request.contextPath}/candidate/profile" class="hero-btn">Support Helpdesk</a>
          </div>

          <div class="hero-meta">
            Submission Date
            <strong><c:out value="${application != null ? application.appliedAtFormatted : 'Awaiting Submission'}" /></strong>
          </div>
        </article>

        <article class="panel countdown-card">
          <p>Election Countdown</p>
          <div class="count-circle">
            <span><c:out value="${votePercentage > 0 ? votePercentage : 42}" /></span>
            <small>days left</small>
          </div>
          <strong class="text-sm text-primary">
            <c:out value="${election != null ? election.startDateFull : 'Polling Date Pending'}" />
          </strong>
          <small class="text-xs text-on-surface-variant mt-1">
            <c:out value="${election != null ? election.name : 'Phase window unavailable'}" />
          </small>
        </article>
      </div>

      <div class="stats-grid">
        <article class="panel stat-card">
          <div class="stat-meta">
            <span class="stat-dot dot-blue">V</span>
            <small class="text-xs text-green-600 font-semibold">+2.4%</small>
          </div>
          <div class="stat-label">Total Votes Received</div>
          <div class="stat-value"><c:out value="${totalVotes}" /></div>
          <div class="stat-sub">Current counted ballots</div>
        </article>

        <article class="panel stat-card">
          <div class="stat-meta">
            <span class="stat-dot dot-amber">R</span>
            <small class="text-xs text-on-surface-variant font-semibold">Ranked</small>
          </div>
          <div class="stat-label">Predicted Reach Index</div>
          <div class="stat-value"><c:out value="${votePercentage}" />%</div>
          <div class="stat-sub">Projected influence score</div>
        </article>

        <article class="panel stat-card">
          <div class="stat-meta">
            <span class="stat-dot dot-purple">C</span>
            <small class="text-xs text-green-600 font-semibold">Active</small>
          </div>
          <div class="stat-label">Competing Candidates</div>
          <div class="stat-value"><c:out value="${fn:length(competingCandidates)}" /></div>
          <div class="stat-sub">In your constituency</div>
        </article>

        <article class="panel stat-card">
          <div class="stat-meta">
            <span class="stat-dot dot-green">S</span>
            <small class="text-xs text-on-surface-variant font-semibold">Details</small>
          </div>
          <div class="stat-label">Candidate Status</div>
          <div class="stat-value" style="font-size:1.1rem;">
            <c:out value="${candidate != null ? candidate.status : 'PENDING'}" />
          </div>
          <div class="stat-sub"><c:out value="${candidate != null ? candidate.partyName : 'Party pending'}" /></div>
        </article>
      </div>

      <div class="bottom-row">
        <article class="panel section-card">
          <div class="section-head">
            <h3>Election Milestones</h3>
            <a href="${pageContext.request.contextPath}/candidate/application">View Timeline</a>
          </div>

          <div class="timeline">
            <div class="timeline-item">
              <span class="timeline-badge">1</span>
              <div>
                <h4>Application Submitted</h4>
                <p>
                  Nomination request submitted for
                  <strong><c:out value="${election != null ? election.name : 'election selection'}" /></strong>
                  in <c:out value="${constituency != null ? constituency.name : 'your constituency'}" />.
                </p>
              </div>
            </div>

            <div class="timeline-item">
              <span class="timeline-badge">2</span>
              <div>
                <h4>Verification & Screening</h4>
                <p>
                  Current stage:
                  <strong><c:out value="${application != null ? application.status : 'PENDING'}" /></strong>.
                  Admin review includes profile checks and compliance validation.
                </p>
              </div>
            </div>

            <div class="timeline-item">
              <span class="timeline-badge">3</span>
              <div>
                <h4>Campaign Activation</h4>
                <p>
                  Once approved, publish manifesto updates and coordinate outreach before
                  <c:out value="${election != null ? election.startDateFormatted : 'polling day'}" />.
                </p>
              </div>
            </div>
          </div>
        </article>

        <article class="panel section-card" id="competitors">
          <div class="section-head">
            <h3>Constituency Hotspots</h3>
            <a href="${pageContext.request.contextPath}/candidate/manifesto">Create Campaign Post</a>
          </div>

          <div class="heat-map">
            <div class="map-shape"></div>
            <span class="pin blue"></span>
            <span class="pin green"></span>
            <span class="pin amber"></span>
          </div>

          <div class="competitor-list">
            <c:choose>
              <c:when test="${not empty competingCandidates}">
                <c:forEach var="rival" items="${competingCandidates}">
                  <div class="competitor-item">
                    <div>
                      <strong><c:out value="${rival.user.fullName}" /></strong>
                      <div class="text-xs text-on-surface-variant"><c:out value="${rival.partyName}" /></div>
                    </div>
                    <div class="text-right">
                      <strong><c:out value="${rival.totalVotes != null ? rival.totalVotes : 0}" /></strong>
                      <div class="text-xs text-on-surface-variant">votes</div>
                    </div>
                  </div>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <div class="competitor-item">
                  <div>
                    <strong>No competitors loaded</strong>
                    <div class="text-xs text-on-surface-variant">Contest data will appear once candidate list is published.</div>
                  </div>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </article>
      </div>
    </section>
    <%-- ===== DASHBOARD CONTENT AREA: END ===== --%>
  </div>
</main>

</body>
</html>
