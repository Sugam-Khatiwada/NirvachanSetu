<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NirvachanSetu - Voter Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #1a4093;
            --primary-hover: #0e3073;
            --bg-color: #f4f7f6;
            --text-dark: #111827;
            --text-gray: #6b7280;
            --text-light: #9ca3af;
            --border-color: #e5e7eb;
            --card-bg: #ffffff;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', system-ui, sans-serif; background-color: var(--bg-color); color: var(--text-dark); line-height: 1.5; }
        a { text-decoration: none; color: inherit; }
        .container { max-width: 1280px; margin: 0 auto; padding: 0 24px; }
        
        /* Navbar */
        .navbar { background: var(--card-bg); border-bottom: 1px solid var(--border-color); }
        .navbar .container { display: flex; justify-content: space-between; align-items: center; height: 64px; }
        .nav-left, .nav-right { display: flex; align-items: center; gap: 32px; }
        .brand { font-weight: 700; font-size: 1.25rem; color: var(--primary-blue); }
        .nav-links { display: flex; gap: 32px; }
        .nav-links a { color: var(--text-gray); font-size: 0.875rem; font-weight: 500; padding: 22px 0; border-bottom: 2px solid transparent; }
        .nav-links a:hover { color: var(--text-dark); border-bottom-color: var(--border-color); }
        .nav-links a.active { color: var(--text-dark); border-bottom-color: var(--primary-blue); }
        
        .nav-actions { display: flex; align-items: center; gap: 16px; }
        .search-bar { position: relative; }
        .search-bar i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: var(--text-light); }
        .search-bar input { padding: 6px 12px 6px 36px; border: 1px solid var(--border-color); border-radius: 6px; background: #f3f4f6; font-size: 0.875rem; width: 200px; }
        .icon-btn { background: none; border: none; color: var(--text-light); font-size: 1.1rem; cursor: pointer; }
        .icon-btn:hover { color: var(--text-gray); }
        .avatar { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; cursor: pointer; }

        /* Main Section */
        .main-content { padding: 32px 0; }
        .top-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; margin-bottom: 48px; }
        @media (max-width: 992px) { .top-grid { grid-template-columns: 1fr; } }
        
        /* Welcome Card */
        .welcome-card { background: var(--primary-blue); color: white; border-radius: 16px; padding: 32px; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .welcome-card h1 { font-size: 2.25rem; font-weight: 700; margin-bottom: 12px; }
        .welcome-card p { color: #bfdbfe; font-size: 1.125rem; max-width: 600px; line-height: 1.6; }
        .status-badges { display: flex; gap: 16px; margin-top: 32px; flex-wrap: wrap; }
        .badge-box { background: rgba(255,255,255,0.1); border-radius: 12px; padding: 12px 16px; }
        .badge-box .label { font-size: 0.75rem; text-transform: uppercase; color: #bfdbfe; font-weight: 600; }
        .badge-box .value { font-weight: 600; margin-top: 4px; display: flex; align-items: center; gap: 8px; }
        .dot { width: 8px; height: 8px; border-radius: 50%; }
        .dot.green { background: #4ade80; }
        .dot.yellow { background: #facc15; }

        /* Info Card */
        .info-card { background: var(--card-bg); border-radius: 16px; padding: 24px; border: 1px solid var(--border-color); display: flex; flex-direction: column; }
        .info-card h2 { font-size: 1.125rem; font-weight: 700; margin-bottom: 24px; }
        .info-row { display: flex; gap: 16px; margin-bottom: 24px; align-items: flex-start; }
        .info-icon { width: 40px; height: 40px; border-radius: 8px; background: #eff6ff; color: var(--primary-blue); display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .info-text .label { font-size: 0.75rem; color: var(--text-gray); font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; }
        .info-text .value { font-weight: 600; margin-top: 2px; color: var(--text-dark); }
        .btn-outline { margin-top: auto; border: 1px solid var(--border-color); background: transparent; padding: 10px; border-radius: 8px; color: var(--primary-blue); font-weight: 600; cursor: pointer; display: flex; justify-content: center; align-items: center; gap: 8px; font-size: 0.875rem; transition: background 0.2s; }
        .btn-outline:hover { background: #f9fafb; }

        /* Candidates Section */
        .section-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 24px; flex-wrap: wrap; gap: 16px; }
        .section-title h2 { font-size: 1.5rem; font-weight: 700; }
        .section-title p { color: var(--text-gray); font-size: 0.875rem; margin-top: 4px; }
        .filters { display: flex; gap: 12px; }
        .filter-input { padding: 8px 12px; border: 1px solid var(--border-color); border-radius: 8px; font-size: 0.875rem; background: var(--card-bg); outline: none; }
        .filters .search-wrap { position: relative; }
        .filters .search-wrap i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: var(--text-light); }
        .filters .search-wrap input { padding-left: 36px; width: 240px; border-radius: 8px; border: 1px solid var(--border-color); padding-top: 8px; padding-bottom: 8px; outline: none; }
        .btn-filter { background: var(--card-bg); border: 1px solid var(--border-color); color: var(--text-gray); padding: 8px 12px; border-radius: 8px; cursor: pointer; }

        .candidates-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 24px; }
        .candidate-card { background: var(--card-bg); border-radius: 16px; overflow: hidden; border: 1px solid var(--border-color); display: flex; flex-direction: column; }
        .card-img { height: 220px; background: #e5e7eb; position: relative; }
        .card-img img { width: 100%; height: 100%; object-fit: cover; }
        .party-badge { position: absolute; top: 12px; left: 12px; background: var(--primary-blue); color: white; font-size: 0.65rem; font-weight: 700; padding: 4px 8px; border-radius: 4px; text-transform: uppercase; letter-spacing: 0.05em; }
        .card-body { padding: 20px; display: flex; flex-direction: column; flex-grow: 1; }
        .candidate-name { font-size: 1.25rem; font-weight: 700; margin-bottom: 4px; }
        .party-name { font-size: 0.875rem; color: var(--text-gray); display: flex; align-items: center; gap: 6px; font-weight: 500; }
        .card-details { display: flex; justify-content: space-between; margin-top: 20px; padding-top: 16px; border-top: 1px solid var(--border-color); }
        .detail .label { font-size: 0.65rem; font-weight: 700; color: var(--text-light); text-transform: uppercase; letter-spacing: 0.05em; }
        .detail .value { font-size: 0.875rem; font-weight: 600; margin-top: 4px; max-width: 100px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .detail.right { text-align: right; }
        .btn-primary { margin-top: 20px; background: #0052cc; color: white; border: none; padding: 10px; border-radius: 8px; display: flex; justify-content: center; align-items: center; gap: 8px; font-size: 0.875rem; font-weight: 600; transition: background 0.2s; cursor: pointer; }
        .btn-primary:hover { background: #0042a3; }
        
        /* Stats Grid */
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 24px; margin-top: 40px; }
        .stat-card { background: var(--card-bg); padding: 20px; border-radius: 16px; border: 1px solid var(--border-color); display: flex; align-items: center; gap: 20px; }
        .stat-icon { width: 56px; height: 56px; border-radius: 12px; display: flex; items: center; justify-content: center; align-items: center; font-size: 1.25rem; }
        .stat-icon.blue { background: #eff6ff; color: #1d4ed8; }
        .stat-icon.orange { background: #fff7ed; color: #c2410c; }
        .stat-icon.indigo { background: #eef2ff; color: #4338ca; }
        .stat-text .label { font-size: 0.75rem; font-weight: 600; color: var(--text-gray); text-transform: uppercase; letter-spacing: 0.05em; }
        .stat-text .value { font-size: 1.5rem; font-weight: 700; margin-top: 4px; }

        /* Footer */
        .footer { background: var(--card-bg); border-top: 1px solid var(--border-color); padding: 32px 0; margin-top: 48px; color: var(--text-gray); font-size: 0.875rem; }
        .footer .container { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px; }
        .footer-brand { font-weight: 700; color: var(--text-dark); }
        .footer-links { display: flex; gap: 24px; }
        .footer-links a:hover { color: var(--text-dark); }
    </style>
</head>
<body>


<main class="main-content container">
    <div class="top-grid">
        
        <!-- Welcome Banner -->
        <div class="welcome-card">
            <div>
                <h1>Welcome back, <c:out value="${fn:split(user.fullName, ' ')[0]}"/>.</h1>
                <p>Your democratic participation ensures a stronger future. Review your local candidates and prepare for the upcoming polling day.</p>
            </div>
            <div class="status-badges">
                <div class="badge-box">
                    <div class="label">Status</div>
                    <div class="value">
                        <div class="dot ${user.status == 'APPROVED' ? 'green' : 'yellow'}"></div>
                        <c:out value="${user.status == 'APPROVED' ? 'Verified Voter' : 'Pending Verification'}"/>
                    </div>
                </div>
                <div class="badge-box">
                    <div class="label">Polling Date</div>
                    <div class="value">
                        <c:choose>
                            <c:when test="${not empty currentElection}">
                                <c:out value="${currentElection.startDateFull}"/>
                            </c:when>
                            <c:otherwise>
                                To Be Announced
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <!-- Constituency Info -->
        <div class="info-card">
            <h2>Constituency Info</h2>
            
            <div class="info-row">
                <div class="info-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="info-text">
                    <div class="label">District</div>
                    <div class="value"><c:out value="${constituency != null ? constituency.name : 'Unknown'}"/></div>
                </div>
            </div>
            
            <div class="info-row">
                <div class="info-icon">
                    <i class="fas fa-person-booth"></i>
                </div>
                <div class="info-text">
                    <div class="label">Polling Booth</div>
                    <div class="value">Govt. Arts College, Hall A</div>
                </div>
            </div>
            
            <button class="btn-outline">
                <i class="fas fa-map"></i> View on Map
            </button>
        </div>
    </div>

    <!-- Constituency Candidates Section -->
    <div class="section-header">
        <div class="section-title">
            <h2>Constituency Candidates</h2>
            <p><c:out value="${fn:length(candidates)}"/> candidates contesting in <strong><c:out value="${constituency.name}"/></strong></p>
        </div>
        <div class="filters">
            <div class="search-wrap">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search by name...">
            </div>
            <select class="filter-input">
                <option>All Parties</option>
                <option>National Party</option>
                <option>Regional Alliance</option>
                <option>Independent</option>
            </select>
            <button class="btn-filter"><i class="fas fa-sliders-h"></i></button>
        </div>
    </div>

    <!-- Candidate Grid -->
    <div class="candidates-grid">
        <c:forEach var="candidate" items="${candidates}">
            <div class="candidate-card">
                <div class="card-img">
                    <c:choose>
                        <c:when test="${not empty candidate.user.profileImage}">
                            <img src="${candidate.user.profileImage}" alt="${candidate.user.fullName}">
                        </c:when>
                        <c:otherwise>
                            <img src="https://ui-avatars.com/api/?name=${candidate.user.fullName}&size=256&background=random" alt="${candidate.user.fullName}">
                        </c:otherwise>
                    </c:choose>
                    <div class="party-badge"><c:out value="${candidate.partyType}"/></div>
                </div>
                <div class="card-body">
                    <h3 class="candidate-name"><c:out value="${candidate.user.fullName}"/></h3>
                    <div class="party-name">
                        <i class="fas fa-user-tie"></i> <c:out value="${candidate.partyName}"/>
                    </div>
                    
                    <div class="card-details">
                        <div class="detail">
                            <div class="label">Symbol</div>
                            <div class="value"><c:out value="${not empty candidate.symbol ? candidate.symbol : 'TBD'}"/></div>
                        </div>
                        <div class="detail right">
                            <div class="label">Agenda</div>
                            <div class="value"><c:out value="${not empty candidate.manifesto ? candidate.manifesto : 'General'}"/></div>
                        </div>
                    </div>
                    
                    <a href="${pageContext.request.contextPath}/voter/candidate?id=${candidate.id}" class="btn-primary">
                        View Details <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty candidates}">
            <div style="grid-column: 1 / -1; text-align: center; padding: 48px 0; color: var(--text-light);">
                <i class="fas fa-users-slash" style="font-size: 2.5rem; margin-bottom: 12px; color: var(--border-color);"></i>
                <p>No candidates found for your constituency.</p>
            </div>
        </c:if>
    </div>

    <!-- Quick Stats -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon blue">
                <i class="fas fa-users"></i>
            </div>
            <div class="stat-text">
                <div class="label">Registered Voters</div>
                <div class="value"><c:out value="${totalVotersInConstituency > 0 ? totalVotersInConstituency : '1.2M+'}"/></div>
            </div>
        </div>
        
        <div class="stat-card">
            <div class="stat-icon orange">
                <i class="fas fa-stopwatch"></i>
            </div>
            <div class="stat-text">
                <div class="label">Days to Polling</div>
                <div class="value">
                    <c:choose>
                        <c:when test="${not empty currentElection}">
                            14 Days
                        </c:when>
                        <c:otherwise>
                            N/A
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        
        <div class="stat-card">
            <div class="stat-icon indigo">
                <i class="fas fa-shield-alt"></i>
            </div>
            <div class="stat-text">
                <div class="label">Constituencies</div>
                <div class="value">224</div>
            </div>
        </div>
    </div>

</main>

<footer class="footer">
    <div class="container">
        <div>
            <span class="footer-brand">NirvachanSetu</span>
            <span>&copy; 2026 Election Commission. All rights reserved.</span>
        </div>
        <div class="footer-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Accessibility</a>
            <a href="#">Contact Support</a>
        </div>
    </div>
</footer>

</body>
</html>
