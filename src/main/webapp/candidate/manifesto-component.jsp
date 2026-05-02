<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<article class="manifesto-panel">
    <div class="manifesto-header">
        <div class="manifesto-title">
            <h3>The People's Manifesto 2024</h3>
            <p>Last updated: <c:out value="${candidate.application.appliedAtFormatted}" /></p>
        </div>
        <button class="btn-update" onclick="document.getElementById('manifestoModal').style.display='flex'">
            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
            Update Manifesto
        </button>
    </div>

    <div class="editor-toolbar">
        <span class="toolbar-btn">B</span>
        <span class="toolbar-btn"><i>I</i></span>
        <span class="toolbar-btn">List</span>
        <span class="toolbar-btn">Quote</span>
        <span class="toolbar-btn">Image</span>
        <span class="toolbar-btn">Link</span>
    </div>

    <div class="manifesto-content">
        <c:choose>
            <c:when test="${not empty currentManifesto}">
                <h2>Our Vision for a Sustainable Tomorrow</h2>
                <p><c:out value="${currentManifesto}" /></p>
            </c:when>
            <c:otherwise>
                <h2>Our Vision for a Sustainable Tomorrow</h2>
                <p>Dear citizens of <c:out value="${candidate.constituency.name}" />, our journey towards progress begins with a shared vision of equity, infrastructure, and empowerment. This manifesto outlines our commitment to transforming our constituency into a model of modern development while preserving our cultural heritage.</p>
                
                <div class="vision-grid">
                    <div class="vision-card">
                        <h4>Education First</h4>
                        <p>Implementing 24/7 digital libraries and upgrading 15 government schools with modern STEM labs by 2025.</p>
                    </div>
                    <div class="vision-card green">
                        <h4>Green Mobility</h4>
                        <p>Adding 200 EV charging stations and improving last-mile connectivity with dedicated bicycle lanes.</p>
                    </div>
                </div>

                <div class="pillars-section">
                    <h3>Core Pillars of Change</h3>
                    <ul class="pillars-list">
                        <li class="pillar-item"><strong>Universal Healthcare Access:</strong> Establishing neighborhood health clinics equipped with essential diagnostic facilities.</li>
                        <li class="pillar-item"><strong>Women Empowerment:</strong> Launching "Shakti" skill-centers providing vocational training for 5,000 women annually.</li>
                        <li class="pillar-item"><strong>Transparency in Governance:</strong> Bi-monthly town hall meetings and a digital grievance redressal portal.</li>
                        <li class="pillar-item"><strong>Water Security:</strong> Modernizing the drainage system to prevent seasonal flooding and implementing rainwater harvesting.</li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</article>

<!-- Manifesto Update Modal -->
<div id="manifestoModal" class="modal-overlay">
    <div class="modal-card">
        <h3>Update Manifesto</h3>
        <form action="${pageContext.request.contextPath}/candidate/manifesto" method="POST">
            <div class="form-group">
                <label>Manifesto Text</label>
                <textarea name="manifesto" rows="12" style="width:100%; padding:0.75rem; border-radius:0.75rem; border:1px solid var(--border);" placeholder="Describe your vision and promises..."><c:out value="${currentManifesto}" /></textarea>
            </div>
            <div style="display: flex; gap: 1rem;">
                <button type="submit" class="btn-save" style="flex:1;">Update Manifesto</button>
                <button type="button" class="btn-save" style="background: #f1f5f9; color: var(--text-secondary); flex:1;" onclick="document.getElementById('manifestoModal').style.display='none'">Cancel</button>
            </div>
        </form>
    </div>
</div>
