<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NirvachanSetu - Constituency Competitors</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">

  <style>
    :root {
      --dash-bg: #f3f6fc;
      --dash-surface: #ffffff;
      --dash-border: #e4eaf5;
      --dash-text: #0f172a;
      --dash-muted: #64748b;
      --dash-primary: #12337f;
      --dash-primary-2: #1f4fcc;
      --dash-soft: #eff4ff;
    }

    body {
      margin: 0;
      color: var(--dash-text);
      background:
        radial-gradient(120% 130% at 0% 0%, #e9f0ff 0%, rgba(233, 240, 255, 0) 54%),
        linear-gradient(180deg, #f6f8fd 0%, #eef2f8 100%);
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

    .alert-strip {
      padding: 0.72rem 0.85rem;
      border-radius: 0.72rem;
      font-size: 0.82rem;
      border: 1px solid;
    }

    .alert-error {
      background: #fef2f2;
      color: #b91c1c;
      border-color: #fecaca;
    }

    .hero-head {
      padding: 1rem 1.05rem;
      border: 1px solid #dce5f9;
      border-radius: 1rem;
      background: linear-gradient(180deg, #f9fbff 0%, #f2f6ff 100%);
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 1rem;
      flex-wrap: wrap;
    }

    .hero-title-wrap h1 {
      margin: 0;
      font-size: clamp(1.2rem, 2vw, 1.8rem);
      line-height: 1.18;
      font-weight: 800;
      color: #0f2f74;
    }

    .hero-title-wrap p {
      margin: 0.35rem 0 0;
      color: #556379;
      font-size: 0.83rem;
      font-weight: 600;
    }

    .hero-actions {
      display: flex;
      gap: 0.55rem;
      flex-wrap: wrap;
    }

    .filter-chip {
      border: 1px solid #d9e4fb;
      border-radius: 0.66rem;
      background: #ffffff;
      color: #1d4ed8;
      font-size: 0.74rem;
      font-weight: 700;
      padding: 0.5rem 0.62rem;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
    }

    .content-shell {
      display: grid;
      grid-template-columns: minmax(0, 1fr);
      gap: 0.9rem;
    }

    .lead-card {
      padding: 1rem;
      display: grid;
      grid-template-columns: 140px minmax(0, 1fr);
      gap: 1rem;
      align-items: center;
      background: linear-gradient(180deg, #ffffff 0%, #f9fbff 100%);
    }

    .lead-photo {
      border-radius: 0.8rem;
      height: 120px;
      background: radial-gradient(85% 120% at 50% 20%, #7cd4d8 0%, #0f3b72 68%, #0f2542 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #ffffff;
      font-size: 2.5rem;
      font-weight: 900;
      letter-spacing: 0.03em;
      box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.22);
    }

    .lead-meta small {
      display: inline-block;
      border-radius: 9999px;
      background: #ffe9cb;
      color: #7c2d12;
      font-size: 0.64rem;
      font-weight: 800;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      padding: 0.24rem 0.48rem;
      margin-bottom: 0.42rem;
    }

    .lead-meta h2 {
      margin: 0;
      font-size: 1.26rem;
      font-weight: 800;
      color: #0f172a;
    }

    .lead-party {
      margin-top: 0.3rem;
      font-size: 0.78rem;
      color: #556379;
      font-weight: 600;
    }

    .lead-summary {
      margin: 0.56rem 0 0;
      color: #64748b;
      font-size: 0.78rem;
      line-height: 1.46;
      max-width: 70ch;
    }

    .lead-footer {
      margin-top: 0.8rem;
      display: flex;
      gap: 0.6rem;
      align-items: center;
      flex-wrap: wrap;
    }

    .party-pill {
      border-radius: 9999px;
      background: #edf3ff;
      color: #12337f;
      font-size: 0.7rem;
      font-weight: 800;
      padding: 0.34rem 0.55rem;
    }

    .link-btn {
      text-decoration: none;
      border-radius: 0.55rem;
      padding: 0.36rem 0.56rem;
      font-size: 0.72rem;
      font-weight: 700;
      color: #1d4ed8;
      background: #eef4ff;
    }

    .competitor-grid {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 0.9rem;
    }

    .mini-card {
      padding: 0.82rem;
      border: 1px solid #e5ebf7;
      border-radius: 0.9rem;
      background: #ffffff;
      display: flex;
      flex-direction: column;
      gap: 0.45rem;
      min-height: 180px;
    }

    .mini-top {
      display: flex;
      align-items: center;
      gap: 0.55rem;
      justify-content: space-between;
    }

    .avatar {
      width: 2.1rem;
      height: 2.1rem;
      border-radius: 0.65rem;
      background: linear-gradient(160deg, #0f3a97 0%, #2d63d9 100%);
      color: #ffffff;
      font-size: 0.82rem;
      font-weight: 800;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .mini-party {
      font-size: 0.62rem;
      color: #64748b;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      font-weight: 800;
      text-align: right;
    }

    .mini-card h3 {
      margin: 0.1rem 0 0;
      font-size: 0.92rem;
      color: #0f172a;
      font-weight: 800;
      line-height: 1.2;
    }

    .mini-sub {
      color: #6b7280;
      font-size: 0.72rem;
      margin: 0;
      line-height: 1.35;
      min-height: 28px;
    }

    .metric-label {
      margin-top: auto;
      color: #64748b;
      font-size: 0.66rem;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      font-weight: 700;
    }

    .metric-value {
      font-size: 0.76rem;
      color: #12337f;
      font-weight: 800;
    }

    .meter {
      position: relative;
      height: 6px;
      border-radius: 9999px;
      background: #e7eefc;
      overflow: hidden;
      margin-top: 0.15rem;
    }

    .meter > span {
      position: absolute;
      inset: 0 auto 0 0;
      width: var(--meter-width, 0%);
      border-radius: 9999px;
      background: linear-gradient(90deg, #2f62db 0%, #113688 100%);
    }

    .mini-actions {
      margin-top: 0.5rem;
      border: 0;
      border-radius: 0.58rem;
      background: #f1f5ff;
      color: #1f3d8f;
      font-size: 0.71rem;
      font-weight: 800;
      padding: 0.46rem 0.58rem;
      cursor: pointer;
    }

    .insight-card {
      background: linear-gradient(165deg, #12337f 0%, #1d4ec3 100%);
      color: #dce7ff;
      padding: 0.95rem;
      border: 1px solid rgba(255, 255, 255, 0.12);
      border-radius: 0.95rem;
      box-shadow: 0 14px 24px -18px rgba(15, 58, 151, 0.9);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      min-height: 180px;
    }

    .insight-card h3 {
      margin: 0;
      font-size: 1rem;
      color: #ffffff;
      font-weight: 800;
    }

    .insight-stat {
      margin-top: 0.55rem;
      font-size: 0.74rem;
      color: #dbe7ff;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 0.4rem;
    }

    .insight-stat strong {
      color: #ffffff;
      font-size: 1rem;
    }

    .insight-btn {
      margin-top: 0.8rem;
      border: 0;
      border-radius: 0.66rem;
      background: #ffffff;
      color: #12337f;
      font-size: 0.74rem;
      font-weight: 800;
      padding: 0.5rem 0.65rem;
      cursor: pointer;
    }

    .note-strip {
      margin-top: 0.2rem;
      border: 1px solid #dce4f4;
      border-radius: 0.8rem;
      background: #f8fbff;
      padding: 0.8rem;
      display: flex;
      justify-content: space-between;
      gap: 0.85rem;
      flex-wrap: wrap;
      align-items: center;
    }

    .note-strip p {
      margin: 0;
      color: #64748b;
      font-size: 0.75rem;
      line-height: 1.4;
      max-width: 70ch;
    }

    .note-actions {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }

    .ghost-btn {
      text-decoration: none;
      border-radius: 0.62rem;
      border: 1px solid #d7e2f8;
      background: #ffffff;
      color: #1e40af;
      font-size: 0.72rem;
      font-weight: 800;
      padding: 0.46rem 0.62rem;
    }

    .empty-card {
      padding: 1rem;
      text-align: center;
    }

    .empty-card h2 {
      margin: 0;
      color: #0f2f74;
      font-size: 1.15rem;
      font-weight: 800;
    }

    .empty-card p {
      margin: 0.45rem auto 0;
      max-width: 55ch;
      color: #64748b;
      font-size: 0.8rem;
      line-height: 1.5;
    }

    .empty-actions {
      margin-top: 0.8rem;
      display: inline-flex;
      gap: 0.5rem;
      flex-wrap: wrap;
      justify-content: center;
    }

    @media (max-width: 1180px) {
      .competitor-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }
    }

    @media (max-width: 980px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }

      .lead-card {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 760px) {
      .competitor-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body class="font-inter">

<jsp:include page="/layout/header.jsp" />

<main class="candidate-shell">
  <div class="dashboard-grid">
    <c:set var="activeCandidateNav" value="competing" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <section class="content-col">
      <c:if test="${not empty error}">
        <div class="alert-strip alert-error"><c:out value="${error}" /></div>
      </c:if>

      <div class="hero-head panel">
        <div class="hero-title-wrap">
          <h1>Constituency Competitors</h1>
          <p>
            <c:out value="${constituency != null ? constituency.name : 'Constituency Not Assigned'}" />
            <span> - </span>
            <strong><c:out value="${fn:length(competingCandidates)}" /> Registered Candidates</strong>
          </p>
        </div>
        <div class="hero-actions">
          <a class="filter-chip" href="#">Filter by Party</a>
          <a class="filter-chip" href="#">Sort by Popularity</a>
        </div>
      </div>

      <c:choose>
        <c:when test="${candidate == null}">
          <article class="panel empty-card">
            <h2>No active candidate profile found</h2>
            <p>
              You need an approved nomination before the competitors list can be generated.
              Complete your application and return to this screen.
            </p>
            <div class="empty-actions">
              <a class="ghost-btn" href="${pageContext.request.contextPath}/candidate/application">Complete Application</a>
              <a class="ghost-btn" href="${pageContext.request.contextPath}/candidate/dashboard">Back to Dashboard</a>
            </div>
          </article>
        </c:when>
        <c:when test="${empty competingCandidates}">
          <article class="panel empty-card">
            <h2>No competitors available yet</h2>
            <p>
              There are currently no other approved candidates in your constituency for
              <c:out value="${election != null ? election.name : 'the selected election'}" />.
            </p>
            <div class="empty-actions">
              <a class="ghost-btn" href="${pageContext.request.contextPath}/candidate/dashboard">Back to Dashboard</a>
            </div>
          </article>
        </c:when>
        <c:otherwise>
          <c:set var="topCompetitor" value="${competingCandidates[0]}" />
          <c:set var="topVotes" value="${topCompetitor.totalVotes != null ? topCompetitor.totalVotes : 0}" />

          <article class="panel lead-card">
            <div class="lead-photo">
              <c:out value="${not empty topCompetitor.user.fullName ? fn:substring(topCompetitor.user.fullName, 0, 1) : 'C'}" />
            </div>

            <div class="lead-meta">
              <small>Leading Competitor</small>
              <h2><c:out value="${not empty topCompetitor.user.fullName ? topCompetitor.user.fullName : 'Unnamed Candidate'}" /></h2>
              <p class="lead-party">
                <c:out value="${not empty topCompetitor.partyName ? topCompetitor.partyName : 'Independent Candidate'}" />
                <span> | </span>
                <c:out value="${topCompetitor.partyType != null ? topCompetitor.partyType : 'INDEPENDENT'}" />
              </p>
              <p class="lead-summary">
                Candidate is currently leading by total constituency votes. Compare manifesto themes,
                local outreach, and issue priorities to sharpen campaign strategy.
              </p>
              <div class="lead-footer">
                <span class="party-pill">Votes: <c:out value="${topVotes}" /></span>
                <a class="link-btn" href="#">View Profile</a>
              </div>
            </div>
          </article>

          <div class="content-shell">
            <div class="competitor-grid">
              <c:forEach var="rival" items="${competingCandidates}" varStatus="status">
                <c:set var="rivalVotes" value="${rival.totalVotes != null ? rival.totalVotes : 0}" />
                <c:set var="reachPct" value="${topVotes > 0 ? (rivalVotes * 100) / topVotes : 0}" />

                <c:if test="${status.index > 0}">
                  <article class="mini-card">
                    <div class="mini-top">
                      <div class="avatar">
                        <c:out value="${not empty rival.user.fullName ? fn:substring(rival.user.fullName, 0, 1) : 'C'}" />
                      </div>
                      <div class="mini-party">
                        <c:out value="${not empty rival.partyName ? rival.partyName : 'Independent'}" />
                      </div>
                    </div>

                    <h3><c:out value="${not empty rival.user.fullName ? rival.user.fullName : 'Unnamed Candidate'}" /></h3>
                    <p class="mini-sub">
                      <c:out value="${not empty rival.symbol ? rival.symbol : 'Campaign symbol pending'}" />
                    </p>

                    <div class="metric-label">Estimated Reach</div>
                    <div class="metric-value"><c:out value="${reachPct}" />%</div>
                    <div class="meter" style="--meter-width:${reachPct}%">
                      <span></span>
                    </div>

                    <button type="button" class="mini-actions">View Profile</button>
                  </article>
                </c:if>

                <c:if test="${status.index == 1}">
                  <aside class="insight-card">
                    <h3>Constituency Pulse</h3>
                    <div class="insight-stat">
                      <span>Voter Turnout Trend</span>
                      <strong>+12%</strong>
                    </div>
                    <div class="insight-stat">
                      <span>Key Local Issue</span>
                      <strong>Public Safety</strong>
                    </div>
                    <button type="button" class="insight-btn">Full Analytics</button>
                  </aside>
                </c:if>
              </c:forEach>
            </div>

            <div class="note-strip">
              <p>
                Transparency note: Candidate metrics are based on approved profiles and current vote statistics
                available for <c:out value="${constituency != null ? constituency.name : 'your constituency'}" />.
              </p>
              <div class="note-actions">
                <a class="ghost-btn" href="#">Download Report</a>
                <a class="ghost-btn" href="#">Compare Metrics</a>
              </div>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </section>
  </div>
</main>

</body>
</html>
