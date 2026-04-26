<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NirvachanSetu - Campaign Manifesto</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">

  <style>
    :root {
      --dash-bg: #f3f6fc;
      --dash-surface: #ffffff;
      --dash-border: #e4eaf5;
      --dash-text: #0f172a;
      --dash-muted: #64748b;
      --dash-primary: #12337f;
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

    .manifesto-hero {
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

    .manifesto-hero h1 {
      margin: 0;
      font-size: 1.35rem;
      color: #0f2f74;
      font-weight: 800;
    }

    .manifesto-hero p {
      margin: 0.35rem 0 0;
      color: #556379;
      font-size: 0.8rem;
      font-weight: 600;
      max-width: 64ch;
    }

    .hero-chip {
      border-radius: 9999px;
      background: #edf3ff;
      color: #12337f;
      font-size: 0.67rem;
      font-weight: 800;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      padding: 0.28rem 0.52rem;
    }

    @media (max-width: 980px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body class="font-inter">

<jsp:include page="/layout/header.jsp" />

<main class="candidate-shell">
  <div class="dashboard-grid">
    <c:set var="activeCandidateNav" value="manifesto" />
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

      <article class="manifesto-hero panel">
        <div>
          <h1>Campaign Manifesto Editor</h1>
          <p>
            Draft your agenda with clear priorities and commitments.
            This content is reused in your candidate profile for public visibility.
          </p>
        </div>
        <span class="hero-chip">Live Sync</span>
      </article>

      <jsp:include page="/candidate/manifesto-panel.jsp">
        <jsp:param name="mode" value="editor" />
      </jsp:include>
    </section>
  </div>
</main>

</body>
</html>
