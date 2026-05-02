<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile & Manifesto - NirvachanSetu</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --secondary: #1e1b4b;
            --bg-main: #f8fafc;
            --text-primary: #0f172a;
            --text-secondary: #64748b;
            --border: #e2e8f0;
            --card-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.05);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background-color: var(--bg-main); color: var(--text-primary); display: flex; min-height: 100vh; }

        .main-content { flex: 1; margin-left: 260px; padding: 0; display: flex; flex-direction: column; }

        /* Top Header */
        .header-nav { display: flex; justify-content: space-between; align-items: center; padding: 1rem 2.5rem; background: white; border-bottom: 1px solid var(--border); position: sticky; top: 0; z-index: 50; }
        .nav-left { display: flex; align-items: center; gap: 2rem; }
        .brand { font-weight: 800; color: var(--secondary); }
        .sub-nav { display: flex; gap: 1.5rem; }
        .sub-nav a { text-decoration: none; color: var(--text-secondary); font-size: 0.85rem; font-weight: 600; transition: color 0.2s; }
        .sub-nav a.active { color: var(--primary); }

        .nav-right { display: flex; align-items: center; gap: 1.5rem; }
        .user-top { display: flex; align-items: center; gap: 0.75rem; text-align: right; }
        .user-top h4 { font-size: 0.85rem; font-weight: 800; color: var(--secondary); }
        .user-top span { font-size: 0.7rem; color: var(--text-secondary); font-weight: 600; text-transform: uppercase; }

        /* Hero Section */
        .hero-banner { height: 180px; background: linear-gradient(135deg, #1e1b4b 0%, #312e81 100%); position: relative; margin-bottom: 4rem; }
        .profile-header-wrap { padding: 0 2.5rem; position: relative; top: -60px; display: flex; align-items: flex-end; gap: 2rem; }
        .profile-pic-large { width: 160px; height: 160px; border-radius: 1.5rem; background: white; padding: 4px; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1); position: relative; }
        .profile-pic-large img { width: 100%; height: 100%; border-radius: 1.25rem; object-fit: cover; }
        .pic-edit-btn { position: absolute; bottom: 12px; right: 12px; background: white; border: none; width: 32px; height: 32px; border-radius: 50%; box-shadow: 0 4px 6px rgba(0,0,0,0.1); cursor: pointer; display: flex; align-items: center; justify-content: center; color: var(--text-secondary); }

        .profile-meta { flex: 1; padding-bottom: 0.5rem; }
        .profile-meta h2 { font-size: 2rem; font-weight: 800; color: var(--secondary); display: flex; align-items: center; gap: 0.75rem; }
        .badge-verified { background: #dcfce7; color: #166534; font-size: 0.65rem; font-weight: 800; padding: 0.25rem 0.6rem; border-radius: 2rem; text-transform: uppercase; }
        .profile-subtext { color: var(--text-secondary); font-weight: 600; font-size: 0.95rem; margin-top: 0.25rem; }
        .profile-details-row { display: flex; gap: 1.5rem; margin-top: 1rem; color: var(--text-secondary); font-size: 0.85rem; font-weight: 500; }
        .detail-item { display: flex; align-items: center; gap: 0.4rem; }
        .detail-item svg { width: 1.1rem; height: 1.1rem; opacity: 0.7; }

        .profile-actions { display: flex; gap: 0.75rem; padding-bottom: 0.5rem; }
        .btn-edit { background: #dbeafe; color: #1e40af; border: none; padding: 0.75rem 1.5rem; border-radius: 0.75rem; font-weight: 700; font-size: 0.85rem; cursor: pointer; display: flex; align-items: center; gap: 0.5rem; }
        .btn-share { background: #f1f5f9; color: var(--text-secondary); border: none; width: 44px; height: 44px; border-radius: 0.75rem; cursor: pointer; display: flex; align-items: center; justify-content: center; }

        /* Content Layout */
        .content-grid { display: grid; grid-template-columns: 320px 1fr; gap: 2.5rem; padding: 0 2.5rem 4rem; }

        /* Left Column Cards */
        .sidebar-card { background: white; border: 1px solid var(--border); border-radius: 1.25rem; padding: 1.5rem; margin-bottom: 1.5rem; }
        .card-label { font-size: 0.65rem; font-weight: 800; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 1.25rem; display: block; }
        
        .affiliation-box { display: flex; align-items: center; gap: 1rem; background: #f8fafc; padding: 1rem; border-radius: 1rem; }
        .party-logo { width: 48px; height: 48px; background: white; border-radius: 0.75rem; display: flex; align-items: center; justify-content: center; }
        .affiliation-info h4 { font-size: 0.85rem; font-weight: 800; color: var(--secondary); }
        .affiliation-info p { font-size: 0.7rem; color: var(--text-secondary); margin-top: 0.1rem; }

        .metric-item { margin-bottom: 1.25rem; }
        .metric-header { display: flex; justify-content: space-between; font-size: 0.75rem; font-weight: 700; margin-bottom: 0.5rem; }
        .metric-bar { height: 6px; background: #f1f5f9; border-radius: 10px; overflow: hidden; }
        .metric-progress { height: 100%; background: var(--secondary); border-radius: 10px; }

        .contact-list { list-style: none; display: flex; flex-direction: column; gap: 1rem; }
        .contact-item { display: flex; align-items: center; gap: 0.75rem; font-size: 0.8rem; font-weight: 600; color: var(--text-primary); text-decoration: none; }
        .contact-item svg { width: 1.1rem; height: 1.1rem; color: var(--primary); }

        /* Right Column Manifesto */
        .manifesto-panel { background: white; border: 1px solid var(--border); border-radius: 1.5rem; padding: 2.5rem; }
        .manifesto-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; }
        .manifesto-title h3 { font-size: 1.25rem; font-weight: 800; color: var(--secondary); }
        .manifesto-title p { font-size: 0.75rem; color: var(--text-secondary); margin-top: 0.25rem; }
        .btn-update { background: #1e1b4b; color: white; border: none; padding: 0.75rem 1.25rem; border-radius: 0.75rem; font-weight: 800; font-size: 0.8rem; cursor: pointer; display: flex; align-items: center; gap: 0.5rem; }

        .editor-toolbar { display: flex; gap: 1rem; padding: 0.75rem 0; border-bottom: 1px solid var(--border); margin-bottom: 2rem; color: #94a3b8; }
        .toolbar-btn { cursor: pointer; transition: color 0.2s; }
        .toolbar-btn:hover { color: var(--primary); }

        .manifesto-content h2 { font-size: 1.75rem; font-weight: 800; color: var(--secondary); margin-bottom: 1.5rem; }
        .manifesto-content p { font-size: 0.95rem; color: var(--text-secondary); line-height: 1.7; margin-bottom: 2rem; }

        .vision-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; margin-bottom: 2.5rem; }
        .vision-card { padding: 1.5rem; border-radius: 1rem; border-left: 4px solid var(--primary); background: #f8fafc; }
        .vision-card h4 { font-size: 1rem; font-weight: 800; color: var(--secondary); margin-bottom: 0.5rem; }
        .vision-card p { font-size: 0.8rem; color: var(--text-secondary); margin: 0; line-height: 1.6; }
        .vision-card.green { border-left-color: #10b981; }

        .pillars-section h3 { font-size: 1.25rem; font-weight: 800; color: var(--secondary); margin-bottom: 1.25rem; }
        .pillars-list { list-style: none; display: flex; flex-direction: column; gap: 1rem; }
        .pillar-item { position: relative; padding-left: 1.5rem; font-size: 0.9rem; line-height: 1.6; color: var(--text-secondary); }
        .pillar-item::before { content: ""; position: absolute; left: 0; top: 10px; width: 6px; height: 6px; background: var(--primary); border-radius: 50%; }
        .pillar-item strong { color: var(--secondary); }

        /* Forms (Hidden by default) */
        .modal-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 1000; display: none; align-items: center; justify-content: center; padding: 2rem; }
        .modal-card { background: white; border-radius: 1.5rem; width: 100%; max-width: 600px; padding: 2.5rem; box-shadow: 0 25px 50px -12px rgba(0,0,0,0.25); }
        .modal-card h3 { margin-bottom: 1.5rem; font-weight: 800; }
        .form-group { margin-bottom: 1.25rem; }
        .form-group label { display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.5rem; color: var(--text-secondary); }
        .form-group input, .form-group textarea, .form-group select { width: 100%; padding: 0.75rem 1rem; border-radius: 0.75rem; border: 1px solid var(--border); font-size: 0.9rem; outline: none; }
        .btn-save { width: 100%; background: var(--primary); color: white; border: none; padding: 1rem; border-radius: 0.75rem; font-weight: 800; cursor: pointer; margin-top: 1rem; }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <c:set var="activeCandidateNav" value="profile" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <!-- Main Content -->
    <main class="main-content">
        <header class="header-nav">
            <div class="nav-left">
                <span class="brand">NirvachanSetu</span>
                <nav class="sub-nav">
                    <a href="#" class="active">Overview</a>
                    <a href="#">Campaign</a>
                    <a href="#">Analytics</a>
                </nav>
            </div>
            <div class="nav-right">
                <button class="icon-btn" style="background: none; border: none; cursor: pointer; color: var(--text-secondary);">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                </button>
                <div class="user-top">
                    <div>
                        <h4><c:out value="${user.fullName}" /></h4>
                        <span>Candidate</span>
                    </div>
                    <img src="https://ui-avatars.com/api/?name=${fn:replace(user.fullName, ' ', '+')}&background=0f172a&color=fff" alt="Avatar" style="width: 2.5rem; height: 2.5rem; border-radius: 50%;">
                </div>
            </div>
        </header>

        <div class="hero-banner"></div>

        <div class="profile-header-wrap">
            <div class="profile-pic-large">
                <img src="https://ui-avatars.com/api/?name=${fn:replace(user.fullName, ' ', '+')}&background=random&size=200" alt="Profile">
                <button class="pic-edit-btn">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
                </button>
            </div>
            <div class="profile-meta">
                <h2><c:out value="${user.fullName}" /> <span class="badge-verified">Verified</span></h2>
                <p class="profile-subtext">
                    <c:out value="${candidate.partyName != null ? candidate.partyName : 'Independent Candidate'}" /> | Constituency: <c:out value="${candidate.constituency != null ? candidate.constituency.name : 'Not Assigned'}" />
                </p>
                <div class="profile-details-row">
                    <div class="detail-item">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                        Joined April 2024
                    </div>
                    <div class="detail-item">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <c:out value="${user.address != null ? user.address : 'New Delhi, India'}" />
                    </div>
                </div>
            </div>
            <div class="profile-actions">
                <button class="btn-edit" onclick="document.getElementById('profileModal').style.display='flex'">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    Edit Profile
                </button>
                <button class="btn-share">
                    <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"></path><polyline points="16 6 12 2 8 6"></polyline><line x1="12" y1="2" x2="12" y2="15"></line></svg>
                </button>
            </div>
        </div>

        <div class="content-grid">
            <aside class="left-col">
                <div class="sidebar-card">
                    <span class="card-label">Affiliation</span>
                    <div class="affiliation-box">
                        <div class="party-logo">
                            <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path></svg>
                        </div>
                        <div class="affiliation-info">
                            <h4><c:out value="${candidate.partyName != null ? candidate.partyName : 'National Progress Front'}" /></h4>
                            <p>Member since 2018</p>
                        </div>
                    </div>
                </div>

                <div class="sidebar-card">
                    <span class="card-label">Quick Metrics</span>
                    <div class="metric-item">
                        <div class="metric-header">
                            <span>Constituency Size</span>
                            <span>1.2M Voters</span>
                        </div>
                        <div class="metric-bar"><span class="metric-progress" style="width: 85%;"></span></div>
                    </div>
                    <div class="metric-item">
                        <div class="metric-header">
                            <span>Campaign Progress</span>
                            <span>68%</span>
                        </div>
                        <div class="metric-bar"><span class="metric-progress" style="width: 68%;"></span></div>
                    </div>
                </div>

                <div class="sidebar-card">
                    <span class="card-label">Official Contact</span>
                    <ul class="contact-list">
                        <li><a href="#" class="contact-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> <c:out value="${user.email}" /></a></li>
                        <li><a href="#" class="contact-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg> <c:out value="${user.phone}" /></a></li>
                        <li><a href="#" class="contact-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg> www.vikramsingh.org</a></li>
                    </ul>
                </div>
            </aside>

            <jsp:include page="manifesto-component.jsp" />
        </div>
    </main>

    <!-- Modals -->
    <div id="profileModal" class="modal-overlay">
        <div class="modal-card">
            <h3>Edit Profile</h3>
            <form action="${pageContext.request.contextPath}/candidate/profile" method="POST">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="fullName" value="${user.fullName}" required>
                </div>
                <div class="form-row" style="display: flex; gap: 1rem;">
                    <div class="form-group" style="flex: 1;">
                        <label>Phone Number</label>
                        <input type="text" name="phone" value="${user.phone}">
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>Constituency</label>
                        <select name="constituencyId">
                            <c:forEach var="cons" items="${constituencies}">
                                <option value="${cons.id}" ${user.constituency.id == cons.id ? 'selected' : ''}>${cons.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Address / Bio</label>
                    <textarea name="address" rows="3"><c:out value="${user.address}" /></textarea>
                </div>
                <div style="display: flex; gap: 1rem;">
                    <button type="submit" class="btn-save">Save Changes</button>
                    <button type="button" class="btn-save" style="background: #f1f5f9; color: var(--text-secondary);" onclick="document.getElementById('profileModal').style.display='none'">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    </div>

</body>
</html>
