<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style>
      /* Premium Sidebar Styling */
      .sidebar {
        width: 260px;
        background-color: #1e1b4b;
        /* Dark Navy from mockup */
        color: white;
        display: flex;
        flex-direction: column;
        padding: 2.5rem 1.5rem;
        position: fixed;
        height: 100vh;
        left: 0;
        top: 0;
        z-index: 100;
      }

      .sidebar-brand {
        margin-bottom: 3rem;
      }

      .sidebar-brand h2 {
        font-size: 1.35rem;
        font-weight: 800;
        color: #dbeafe;
        /* Light blue text for brand */
        letter-spacing: -0.01em;
      }

      .sidebar-brand p {
        font-size: 0.65rem;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        color: #94a3b8;
        margin-top: 0.35rem;
        font-weight: 700;
      }

      .nav-list {
        list-style: none;
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
        flex: 1;
      }

      .nav-item {
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 0.85rem 1rem;
        border-radius: 0.75rem;
        text-decoration: none;
        color: #94a3b8;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
      }

      .nav-item:hover {
        background-color: rgba(255, 255, 255, 0.05);
        color: white;
      }

      .nav-item.active {
        background-color: #dbeafe;
        /* Lighter active state background to match image contrast */
        color: #1e1b4b;
      }

      .nav-item svg {
        width: 1.15rem;
        height: 1.15rem;
      }

      .sidebar-footer {
        margin-top: auto;
        padding-top: 2rem;
      }

      .btn-declaration {
        width: 100%;
        background-color: #1e293b;
        color: white;
        padding: 0.9rem;
        border-radius: 0.6rem;
        border: 1px solid rgba(255, 255, 255, 0.1);
        font-weight: 700;
        font-size: 0.85rem;
        cursor: pointer;
        transition: all 0.2s;
        text-align: center;
        display: block;
        text-decoration: none;
      }

      .btn-declaration:hover {
        background-color: #334155;
        transform: translateY(-1px);
      }
    </style>

    <aside class="sidebar">
      <div class="sidebar-brand">
        <h2>Candidate Portal</h2>
        <p>GENERAL ELECTION 2024</p>
      </div>

      <nav class="nav-list">
        <a href="${pageContext.request.contextPath}/candidate/dashboard"
          class="nav-item ${activeCandidateNav == 'dashboard' ? 'active' : ''}">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
            stroke-linejoin="round">
            <rect x="3" y="3" width="7" height="7"></rect>
            <rect x="14" y="3" width="7" height="7"></rect>
            <rect x="14" y="14" width="7" height="7"></rect>
            <rect x="3" y="14" width="7" height="7"></rect>
          </svg>
          Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/candidate/application"
          class="nav-item ${activeCandidateNav == 'application' ? 'active' : ''}">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
            stroke-linejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
            <polyline points="14 2 14 8 20 8"></polyline>
            <line x1="16" y1="13" x2="8" y2="13"></line>
            <line x1="16" y1="17" x2="8" y2="17"></line>
          </svg>
          Application
        </a>
        <a href="${pageContext.request.contextPath}/candidate/profile"
          class="nav-item ${activeCandidateNav == 'profile' ? 'active' : ''}">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
            stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
          My Profile
        </a>
        <a href="${pageContext.request.contextPath}/candidate/competing"
          class="nav-item ${activeCandidateNav == 'competing' ? 'active' : ''}">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
            stroke-linejoin="round">
            <path d="M17 21v-2a4 4 0 0 0-3-3.87"></path>
            <path d="M7 21v-2a4 4 0 0 1 3-3.87"></path>
            <path d="M9 3.51a3.5 3.5 0 0 1 6 0"></path>
            <rect x="4" y="9" width="16" height="11" rx="2"></rect>
          </svg>
          Competitors
        </a>
        <a href="${pageContext.request.contextPath}/voter/cast-vote" class="nav-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
            stroke-linejoin="round">
            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
            <polyline points="22 4 12 14.01 9 11.01"></polyline>
          </svg>
          Vote Now
        </a>
      </nav>

      <div class="sidebar-footer">
        <a href="${pageContext.request.contextPath}/candidate/application" class="btn-declaration">Submit Declaration</a>
      </div>
    </aside>