<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NirvachanSetu - Candidate Profile</title>
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
    }

    body {
      margin: 0;
      color: var(--dash-text);
      background:
        radial-gradient(110% 125% at 0% 0%, #e9f0ff 0%, rgba(233, 240, 255, 0) 54%),
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
      gap: 0.92rem;
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

    .alert-success {
      background: #f0fdf4;
      color: #166534;
      border-color: #bbf7d0;
    }

    .profile-hero {
      padding: 1rem;
      border: 1px solid #dbe5f8;
      border-radius: 1rem;
      background: linear-gradient(180deg, #f8fbff 0%, #f2f6ff 100%);
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 0.8rem;
      flex-wrap: wrap;
    }

    .profile-hero h1 {
      margin: 0;
      font-size: 1.35rem;
      color: #0f2f74;
      font-weight: 800;
    }

    .profile-hero p {
      margin: 0.35rem 0 0;
      color: #556379;
      font-size: 0.8rem;
      font-weight: 600;
    }

    .hero-badge {
      border-radius: 9999px;
      background: #edf3ff;
      color: #12337f;
      font-size: 0.68rem;
      font-weight: 800;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      padding: 0.3rem 0.52rem;
    }

    .profile-layout {
      display: grid;
      grid-template-columns: minmax(0, 0.9fr) minmax(0, 1.3fr);
      gap: 0.9rem;
    }

    .profile-card {
      padding: 0.95rem;
      display: flex;
      flex-direction: column;
      gap: 0.8rem;
    }

    .avatar-head {
      display: flex;
      align-items: center;
      gap: 0.7rem;
    }

    .avatar-box {
      width: 3rem;
      height: 3rem;
      border-radius: 0.85rem;
      background: linear-gradient(145deg, #12337f 0%, #1f4fcc 100%);
      color: #ffffff;
      font-size: 1rem;
      font-weight: 800;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .avatar-head h2 {
      margin: 0;
      font-size: 0.98rem;
      color: #0f172a;
      font-weight: 800;
    }

    .avatar-head p {
      margin: 0.2rem 0 0;
      color: #64748b;
      font-size: 0.74rem;
      line-height: 1.35;
    }

    .stats-box {
      border: 1px solid #e5ecfa;
      border-radius: 0.82rem;
      background: #fbfdff;
      padding: 0.75rem;
      display: grid;
      gap: 0.56rem;
    }

    .stat-line {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 0.6rem;
      font-size: 0.76rem;
      color: #475569;
    }

    .stat-line strong {
      color: #0f2f74;
      font-weight: 800;
      font-size: 0.78rem;
    }

    .form-card {
      padding: 0.95rem;
      display: flex;
      flex-direction: column;
      gap: 0.74rem;
    }

    .form-card h3 {
      margin: 0;
      font-size: 1rem;
      color: #0f2f74;
      font-weight: 800;
    }

    .field-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 0.72rem;
    }

    .field-grid.full {
      grid-template-columns: 1fr;
    }

    .field {
      display: flex;
      flex-direction: column;
      gap: 0.35rem;
    }

    .field label {
      font-size: 0.67rem;
      letter-spacing: 0.06em;
      text-transform: uppercase;
      font-weight: 800;
      color: #64748b;
    }

    .field input,
    .field textarea,
    .field select {
      width: 100%;
      border: 1px solid #dee6f3;
      border-radius: 0.62rem;
      background: #f8fafe;
      color: #111827;
      font-size: 0.84rem;
      padding: 0.64rem 0.7rem;
      outline: none;
    }

    .field input:focus,
    .field textarea:focus,
    .field select:focus {
      border-color: #1d4ed8;
      box-shadow: 0 0 0 3px rgba(29, 78, 216, 0.12);
      background: #ffffff;
    }

    .field textarea {
      min-height: 96px;
      resize: vertical;
    }

    .save-btn {
      border: 0;
      border-radius: 0.72rem;
      background: linear-gradient(135deg, #0f3a97 0%, #1f4fcc 100%);
      color: #ffffff;
      font-size: 0.84rem;
      font-weight: 800;
      padding: 0.72rem 0.92rem;
      cursor: pointer;
      width: fit-content;
    }

    @media (max-width: 1180px) {
      .profile-layout {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 980px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 720px) {
      .field-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body class="font-inter">

<jsp:include page="/layout/header.jsp" />

<main class="candidate-shell">
  <div class="dashboard-grid">
    <c:set var="activeCandidateNav" value="profile" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <section class="content-col">
      <c:if test="${not empty error}">
        <div class="alert-strip alert-error"><c:out value="${error}" /></div>
      </c:if>
      <c:if test="${not empty sessionScope.error}">
        <div class="alert-strip alert-error"><c:out value="${sessionScope.error}" /></div>
        <% request.getSession().removeAttribute("error"); %>
      </c:if>
      <c:if test="${not empty sessionScope.success}">
        <div class="alert-strip alert-success"><c:out value="${sessionScope.success}" /></div>
        <% request.getSession().removeAttribute("success"); %>
      </c:if>

      <article class="profile-hero panel">
        <div>
          <h1>Profile & Manifesto</h1>
          <p>Keep your public candidate profile accurate and your campaign message updated.</p>
        </div>
        <span class="hero-badge">
          <c:out value="${candidate != null ? candidate.status : 'PROFILE'}" />
        </span>
      </article>

      <div class="profile-layout">
        <article class="panel profile-card">
          <div class="avatar-head">
            <div class="avatar-box">
              <c:out value="${not empty user.fullName ? fn:substring(user.fullName, 0, 1) : 'C'}" />
            </div>
            <div>
              <h2><c:out value="${not empty user.fullName ? user.fullName : 'Candidate'}" /></h2>
              <p>
                <c:out value="${not empty candidate.partyName ? candidate.partyName : 'Independent Candidate'}" />
              </p>
            </div>
          </div>

          <div class="stats-box">
            <div class="stat-line">
              <span>Constituency</span>
              <strong><c:out value="${user.constituency != null ? user.constituency.name : 'Not Assigned'}" /></strong>
            </div>
            <div class="stat-line">
              <span>Total Votes</span>
              <strong><c:out value="${candidate != null && candidate.totalVotes != null ? candidate.totalVotes : 0}" /></strong>
            </div>
            <div class="stat-line">
              <span>Official Contact</span>
              <strong><c:out value="${not empty user.phone ? user.phone : 'Not Provided'}" /></strong>
            </div>
            <div class="stat-line">
              <span>Email</span>
              <strong><c:out value="${user.email}" /></strong>
            </div>
          </div>
        </article>

        <article class="panel form-card">
          <h3>Edit Candidate Profile</h3>

          <form action="${pageContext.request.contextPath}/candidate/profile" method="post">
            <div class="field-grid">
              <div class="field">
                <label for="fullName">Full Name</label>
                <input id="fullName" name="fullName" type="text" value="${user.fullName}" required>
              </div>
              <div class="field">
                <label for="phone">Phone Number</label>
                <input id="phone" name="phone" type="text" value="${user.phone}" placeholder="98XXXXXXXX">
              </div>
            </div>

            <div class="field-grid">
              <div class="field">
                <label for="email">Email</label>
                <input id="email" type="email" value="${user.email}" readonly>
              </div>
              <div class="field">
                <label for="constituencyId">Constituency</label>
                <select id="constituencyId" name="constituencyId">
                  <option value="">Select constituency</option>
                  <c:forEach var="constituency" items="${constituencies}">
                    <option value="${constituency.id}" ${user.constituency != null && user.constituency.id == constituency.id ? 'selected' : ''}>
                      <c:out value="${constituency.name}" />
                    </option>
                  </c:forEach>
                </select>
              </div>
            </div>

            <div class="field-grid full">
              <div class="field">
                <label for="address">Address</label>
                <textarea id="address" name="address" placeholder="Street, city, and additional address details"><c:out value="${user.address}" /></textarea>
              </div>
            </div>

            <button class="save-btn" type="submit">Save Profile</button>
          </form>
        </article>
      </div>

      <jsp:include page="/candidate/manifesto-panel.jsp">
        <jsp:param name="mode" value="preview" />
      </jsp:include>
    </section>
  </div>
</main>

</body>
</html>
