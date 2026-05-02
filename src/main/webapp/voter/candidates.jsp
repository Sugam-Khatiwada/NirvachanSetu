<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NirvachanSetu - Candidates</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        :root {
            --primary-blue: #1a4093;
            --primary-hover: #0e3073;
            --bg-color: #f8fafc;
            --text-dark: #111827;
            --text-gray: #4b5563;
            --text-light: #9ca3af;
            --border-color: #e5e7eb;
            --card-bg: #ffffff;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', system-ui, sans-serif; line-height: 1.5; }
        a { text-decoration: none; color: inherit; }
        .container { max-width: 1280px; margin: 0 auto; padding: 0 24px; }
        
        /* Navbar */
        .navbar { background: var(--card-bg); border-bottom: 1px solid var(--border-color); }
        .navbar .container { display: flex; justify-content: space-between; align-items: center; height: 64px; }
        .nav-left, .nav-right { display: flex; align-items: center; gap: 32px; }
        .brand { font-weight: 700; font-size: 1.25rem; color: var(--primary-blue); }
        .nav-links { display: flex; gap: 24px; }
        .nav-links a { color: var(--text-gray); font-size: 0.875rem; font-weight: 500; }
        .nav-links a:hover { color: var(--text-dark); }
        .nav-links a.active { color: var(--primary-blue); font-weight: 600; border-bottom: 2px solid var(--primary-blue); padding-bottom: 21px; }
        
        .nav-actions { display: flex; align-items: center; gap: 16px; }
        .search-bar { position: relative; }
        .search-bar i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: var(--text-light); }
        .search-bar input { padding: 8px 12px 8px 36px; border: 1px solid transparent; border-radius: 20px; background: #f3f4f6; font-size: 0.875rem; width: 240px; outline: none; }
        .icon-btn { background: none; border: none; color: var(--text-gray); font-size: 1.2rem; cursor: pointer; display: flex; align-items: center; justify-content: center; }
        .icon-btn:hover { color: var(--text-dark); }
        .avatar { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; cursor: pointer; background: #000; }

        /* Main Section */
        .main-content { padding: 48px 0; }
        
        /* Page Header */
        .page-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 40px; flex-wrap: wrap; gap: 24px; }
        .header-content { max-width: 600px; }
        .header-content h1 { font-size: 2.5rem; font-weight: 800; color: var(--primary-blue); margin-bottom: 12px; }
        .header-content p { color: var(--text-gray); font-size: 1.125rem; line-height: 1.6; }
        
        .filters-container { display: flex; gap: 16px; }
        .filter-group { display: flex; flex-direction: column; gap: 6px; }
        .filter-group label { font-size: 0.75rem; font-weight: 700; color: var(--text-light); text-transform: uppercase; letter-spacing: 0.05em; }
        .filter-select { padding: 10px 16px; padding-right: 32px; background-color: #f1f5f9; border: 1px solid transparent; border-radius: 8px; color: var(--text-dark); font-size: 0.9rem; font-weight: 500; appearance: none; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%236b7280'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E"); background-repeat: no-repeat; background-position: right 12px center; background-size: 16px; outline: none; cursor: pointer; min-width: 180px; }
        .filter-select:focus { border-color: var(--primary-blue); }

        /* Grid Layout */
        .candidates-layout { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 48px; }
        
        /* Special Large Card */
        .card-large { grid-column: span 2; display: flex; background: var(--card-bg); border-radius: 20px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); }
        .card-large-img { width: 45%; position: relative; background: #e5e7eb; display: flex; }
        .card-large-img img { width: 100%; height: 100%; object-fit: cover; }
        .badge-incumbent { position: absolute; top: 16px; left: 16px; background: var(--primary-blue); color: white; padding: 6px 12px; border-radius: 20px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; z-index: 10; }
        
        .card-large-content { width: 55%; padding: 40px; display: flex; flex-direction: column; justify-content: center; position: relative; }
        .icon-top-right { position: absolute; top: 32px; right: 40px; width: 48px; height: 48px; background: #f1f5f9; border-radius: 12px; display: flex; align-items: center; justify-content: center; color: var(--primary-blue); font-size: 1.5rem; }
        .party-label-lg { color: var(--primary-blue); font-weight: 700; font-size: 0.875rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px; }
        .candidate-name-lg { font-size: 2.25rem; font-weight: 800; margin-bottom: 24px; color: var(--text-dark); }
        .quote-lg { color: var(--text-gray); font-size: 1rem; line-height: 1.6; margin-bottom: 24px; }
        .tags { display: flex; gap: 8px; margin-bottom: 32px; flex-wrap: wrap; }
        .tag { background: #f1f5f9; color: var(--text-gray); padding: 6px 12px; border-radius: 20px; font-size: 0.75rem; font-weight: 600; }
        
        .btn-manifesto { align-self: flex-start; background: var(--primary-blue); color: white; padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 0.9rem; display: flex; align-items: center; gap: 8px; transition: background 0.2s; border: none; cursor: pointer; }
        .btn-manifesto:hover { background: var(--primary-hover); }
        
        /* Standard Small Cards */
        .card { background: var(--card-bg); border-radius: 20px; overflow: hidden; display: flex; flex-direction: column; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); }
        .card-img-wrapper { height: 200px; position: relative; background: #f3f4f6; }
        .card-img-wrapper img { width: 100%; height: 100%; object-fit: cover; }
        .card-img-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(0,0,0,0.8) 0%, transparent 60%); display: flex; flex-direction: column; justify-content: flex-end; padding: 20px; }
        .card-party-overlay { color: rgba(255,255,255,0.8); font-size: 0.65rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 4px; }
        .card-name-overlay { color: white; font-size: 1.25rem; font-weight: 700; }
        
        .card-body { padding: 24px; display: flex; flex-direction: column; flex-grow: 1; }
        .card-location { display: flex; align-items: center; gap: 8px; color: var(--text-gray); font-size: 0.8rem; font-weight: 600; margin-bottom: 16px; }
        .card-location i { color: var(--primary-blue); }
        .card-desc { color: var(--text-gray); font-size: 0.9rem; line-height: 1.6; margin-bottom: 24px; }
        
        .btn-light { margin-top: auto; background: #eff6ff; color: var(--primary-blue); padding: 10px; border-radius: 8px; font-weight: 600; font-size: 0.875rem; display: flex; justify-content: center; align-items: center; gap: 8px; transition: background 0.2s; border: none; cursor: pointer; width: 100%; }
        .btn-light:hover { background: #dbeafe; }

        /* Pagination */
        .pagination { display: flex; justify-content: center; align-items: center; gap: 8px; margin-top: 16px; }
        .page-btn { width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; border-radius: 8px; background: #f1f5f9; color: var(--text-gray); font-weight: 600; font-size: 0.9rem; border: none; cursor: pointer; transition: all 0.2s; }
        .page-btn:hover:not(:disabled) { background: #e2e8f0; color: var(--text-dark); }
        .page-btn.active { background: var(--primary-blue); color: white; }
        .page-btn:disabled { opacity: 0.5; cursor: not-allowed; }
        .page-dots { color: var(--text-gray); padding: 0 4px; }

        /* Footer */
        .footer { background: #f1f5f9; padding: 48px 0; margin-top: 64px; }
        .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; }
        .footer-brand { font-size: 1.25rem; font-weight: 700; color: var(--text-dark); margin-bottom: 12px; }
        .footer-desc { color: var(--text-gray); font-size: 0.875rem; line-height: 1.6; max-width: 300px; }
        .footer-heading { font-size: 0.75rem; font-weight: 700; color: var(--text-dark); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 20px; }
        .footer-links { display: flex; flex-direction: column; gap: 12px; }
        .footer-links a { color: var(--text-gray); font-size: 0.875rem; transition: color 0.2s; }
        .footer-links a:hover { color: var(--primary-blue); }

        @media (max-width: 1024px) {
            .candidates-layout { grid-template-columns: repeat(2, 1fr); }
            .card-large { grid-column: span 2; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 768px) {
            .card-large { flex-direction: column; }
            .card-large-img, .card-large-content { width: 100%; }
            .card-large-img { height: 300px; }
            .nav-actions { display: none; }
        }
        @media (max-width: 640px) {
            .candidates-layout { grid-template-columns: 1fr; }
            .card-large { grid-column: auto; }
            .footer-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-800">

<c:set var="activePage" value="candidates" scope="request" />
<jsp:include page="../layout/header.jsp" />

<main class="main-content container">
    <!-- Header -->
    <div class="page-header">
        <div class="header-content">
            <h1>Electoral Candidates</h1>
            <p>Browse and evaluate candidates participating in the upcoming general assembly. Informed voting starts with understanding every manifesto.</p>
        </div>
        <div class="filters-container">
            <div class="filter-group">
                <label>Constituency</label>
                <select class="filter-select" onchange="window.location.href='?constituency=' + this.value + (new URLSearchParams(window.location.search).get('party') ? '&party=' + new URLSearchParams(window.location.search).get('party') : '')">
                    <option value="">All Constituencies</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Party</label>
                <select class="filter-select" onchange="window.location.href='?party=' + this.value + (new URLSearchParams(window.location.search).get('constituency') ? '&constituency=' + new URLSearchParams(window.location.search).get('constituency') : '')">
                    <option value="">All Parties</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Grid Layout -->
    <c:choose>
        <c:when test="${empty candidates}">
            <div style="text-align: center; padding: 64px 0; color: var(--text-light); background: var(--card-bg); border-radius: 20px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); margin-bottom: 48px;">
                <i class="fas fa-users-slash" style="font-size: 3rem; margin-bottom: 16px; color: var(--border-color);"></i>
                <h3 style="font-size: 1.25rem; font-weight: 700; color: var(--text-gray); margin-bottom: 8px;">No Candidates Found</h3>
                <p>There are no candidates registered matching your criteria.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="candidates-layout">
                <c:forEach items="${candidates}" var="candidate" varStatus="status">
                    <c:choose>
                        <c:when test="${status.first}">
                            <!-- Large Card (Incumbent or First Candidate) -->
                            <div class="card-large">
                                <div class="card-large-img">
                                    <div class="badge-incumbent">${candidate.partyName} Leader</div>
                                    <img src="https://ui-avatars.com/api/?name=${candidate.user.fullName}&background=f3f4f6&color=1a4093&size=400" alt="${candidate.user.fullName}">
                                </div>
                                <div class="card-large-content">
                                    <div class="icon-top-right">
                                        <i class="fas fa-university"></i>
                                    </div>
                                    <div class="party-label-lg">${candidate.partyName}</div>
                                    <h2 class="candidate-name-lg">${candidate.user.fullName}</h2>
                                    <div class="quote-lg">
                                        "${not empty candidate.manifesto ? candidate.manifesto : 'Committed to driving community growth and standing up for systemic policy reforms to improve the livelihoods of citizens.'}"
                                    </div>
                                    <div class="tags">
                                        <!-- You could dynamically load these from candidate properties if available -->
                                        <span class="tag">${candidate.constituency.name}</span>
                                        <span class="tag">Leadership</span>
                                        <span class="tag">Community</span>
                                    </div>
                                    <button class="btn-manifesto" onclick="window.location.href='${pageContext.request.contextPath}/voter/candidates'">
                                        Read Full Profile <i class="fas fa-arrow-right"></i>
                                    </button>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Small Card -->
                            <div class="card">
                                <div class="card-img-wrapper">
                                    <img src="https://ui-avatars.com/api/?name=${candidate.user.fullName}&background=f3f4f6&color=1a4093&size=400" alt="${candidate.user.fullName}">
                                    <div class="card-img-overlay">
                                        <div class="card-party-overlay">${candidate.partyName}</div>
                                        <div class="card-name-overlay">${candidate.user.fullName}</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="card-location">
                                        <i class="fas fa-map-marker-alt"></i> ${candidate.constituency.name}
                                    </div>
                                    <div class="card-desc">
                                        <c:choose>
                                            <c:when test="${not empty candidate.manifesto and candidate.manifesto.length() > 100}">
                                                ${candidate.manifesto.substring(0, 100)}...
                                            </c:when>
                                            <c:when test="${not empty candidate.manifesto}">
                                                ${candidate.manifesto}
                                            </c:when>
                                            <c:otherwise>
                                                Pledging transparency in public spending and advocating for the local district's immediate needs through proactive engagement.
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <button class="btn-light" onclick="window.location.href='${pageContext.request.contextPath}/voter/candidates'">
                                        View Profile <i class="fas fa-external-link-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

    <!-- Pagination -->
    <div class="pagination">
        <button class="page-btn" disabled><i class="fas fa-chevron-left"></i></button>
        <button class="page-btn active">1</button>
        <button class="page-btn">2</button>
        <button class="page-btn">3</button>
        <span class="page-dots">...</span>
        <button class="page-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
</main>

<jsp:include page="../layout/footer.jsp" />

</body>
</html>
