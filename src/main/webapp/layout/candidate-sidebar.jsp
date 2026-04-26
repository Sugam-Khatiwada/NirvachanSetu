<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- ===== CANDIDATE SIDEBAR STYLES: START ===== --%>
<style>
  .sidebar {
    padding: 1rem;
    position: sticky;
    top: 100px;
  }

  .portal-title {
    margin-bottom: 1rem;
    padding-bottom: 0.9rem;
    border-bottom: 1px solid var(--dash-border);
  }

  .portal-title h2 {
    margin: 0;
    color: #12337f;
    font-size: 1rem;
    font-weight: 800;
  }

  .portal-title p {
    margin: 0.3rem 0 0;
    font-size: 0.72rem;
    color: var(--dash-muted);
    text-transform: uppercase;
    letter-spacing: 0.08em;
  }

  .side-nav {
    display: flex;
    flex-direction: column;
    gap: 0.35rem;
  }

  .side-link {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    padding: 0.65rem 0.75rem;
    border-radius: 0.7rem;
    color: #334155;
    font-weight: 600;
    font-size: 0.87rem;
    text-decoration: none;
  }

  .side-link:hover {
    background: #f1f5ff;
    color: #12337f;
  }

  .side-link.active {
    background: #e9efff;
    color: #0f3a97;
    border: 1px solid #dbe5ff;
  }

  .declaration-btn {
    margin-top: 1.25rem;
    border: 0;
    width: 100%;
    border-radius: 0.72rem;
    background: linear-gradient(135deg, #0f3a97 0%, #1f4fcc 100%);
    color: white;
    font-weight: 700;
    padding: 0.7rem 0.8rem;
    cursor: pointer;
  }

  @media (max-width: 980px) {
    .sidebar {
      position: static;
    }
  }
</style>
<%-- ===== CANDIDATE SIDEBAR STYLES: END ===== --%>

<%-- ===== CANDIDATE SIDEBAR MARKUP: START ===== --%>
<aside class="panel sidebar">
  <div class="portal-title">
    <h2>Candidate Portal</h2>
    <p>General Election 2026</p>
  </div>

  <nav class="side-nav">
    <a href="${pageContext.request.contextPath}/candidate/dashboard" class="side-link ${activeCandidateNav == 'dashboard' ? 'active' : ''}">
      <span>[D]</span> Dashboard
    </a>
    <a href="${pageContext.request.contextPath}/candidate/application" class="side-link ${activeCandidateNav == 'application' ? 'active' : ''}">
      <span>[A]</span> Application
    </a>
    <a href="${pageContext.request.contextPath}/candidate/profile" class="side-link ${activeCandidateNav == 'profile' ? 'active' : ''}">
      <span>[P]</span> My Profile
    </a>
    <a href="${pageContext.request.contextPath}/candidate/competing" class="side-link ${activeCandidateNav == 'competing' ? 'active' : ''}">
      <span>[C]</span> Competitors
    </a>
    <a href="${pageContext.request.contextPath}/candidate/manifesto" class="side-link ${activeCandidateNav == 'manifesto' ? 'active' : ''}">
      <span>[M]</span> Campaign Plan
    </a>
  </nav>

  <button type="button" class="declaration-btn">Submit Declaration</button>
</aside>
<%-- ===== CANDIDATE SIDEBAR MARKUP: END ===== --%>
