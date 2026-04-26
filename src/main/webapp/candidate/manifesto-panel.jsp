<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="manifestoMode" value="${param.mode}" />
<c:if test="${empty manifestoMode}">
  <c:set var="manifestoMode" value="preview" />
</c:if>

<style>
  .mf-card {
    padding: 0.95rem;
    display: flex;
    flex-direction: column;
    gap: 0.85rem;
  }

  .mf-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 0.65rem;
    flex-wrap: wrap;
  }

  .mf-head h3 {
    margin: 0;
    font-size: 1rem;
    color: #0f2f74;
    font-weight: 800;
  }

  .mf-chip {
    border-radius: 9999px;
    background: #eaf0ff;
    color: #1f3d8f;
    font-size: 0.66rem;
    font-weight: 800;
    letter-spacing: 0.05em;
    padding: 0.26rem 0.5rem;
    text-transform: uppercase;
  }

  .mf-actions {
    display: inline-flex;
    gap: 0.45rem;
    align-items: center;
    flex-wrap: wrap;
  }

  .mf-link,
  .mf-btn {
    border: 0;
    border-radius: 0.6rem;
    padding: 0.45rem 0.6rem;
    font-size: 0.73rem;
    font-weight: 800;
    text-decoration: none;
    cursor: pointer;
  }

  .mf-link {
    background: #edf3ff;
    color: #12337f;
  }

  .mf-btn {
    background: linear-gradient(135deg, #0f3a97 0%, #1f4fcc 100%);
    color: #ffffff;
  }

  .mf-meta {
    color: #64748b;
    font-size: 0.72rem;
    display: flex;
    flex-wrap: wrap;
    gap: 0.6rem;
  }

  .mf-body {
    border: 1px solid #e5ebf6;
    border-radius: 0.85rem;
    background: #fbfdff;
    padding: 0.85rem;
  }

  .mf-body h4 {
    margin: 0;
    color: #12337f;
    font-size: 0.88rem;
    font-weight: 800;
  }

  .mf-body p {
    margin: 0.55rem 0 0;
    color: #475569;
    font-size: 0.79rem;
    line-height: 1.56;
    white-space: pre-line;
  }

  .mf-textarea {
    width: 100%;
    min-height: 230px;
    border: 1px solid #dbe5f6;
    border-radius: 0.75rem;
    background: #ffffff;
    color: #0f172a;
    font-size: 0.82rem;
    line-height: 1.55;
    padding: 0.75rem;
    resize: vertical;
    outline: none;
  }

  .mf-textarea:focus {
    border-color: #1d4ed8;
    box-shadow: 0 0 0 3px rgba(29, 78, 216, 0.12);
  }

  .mf-empty {
    border: 1px dashed #ccdbf5;
    border-radius: 0.82rem;
    background: #f7faff;
    color: #64748b;
    font-size: 0.78rem;
    line-height: 1.45;
    padding: 0.82rem;
  }
</style>

<article class="panel mf-card">
  <div class="mf-head">
    <div>
      <h3>The People's Manifesto 2026</h3>
      <div class="mf-meta">
        <span>
          <c:out value="${not empty candidate.partyName ? candidate.partyName : 'Independent Campaign'}" />
        </span>
        <span>
          <c:out value="${candidate.partyType != null ? candidate.partyType : 'INDEPENDENT'}" />
        </span>
      </div>
    </div>
    <span class="mf-chip">Manifesto</span>
  </div>

  <c:choose>
    <c:when test="${manifestoMode == 'editor'}">
      <form action="${pageContext.request.contextPath}/candidate/manifesto" method="post">
        <textarea class="mf-textarea" name="manifesto" placeholder="Share your constituency vision, policy priorities, and measurable commitments."><c:out value="${currentManifesto}" /></textarea>
        <div class="mf-actions" style="margin-top:0.62rem;">
          <button type="submit" class="mf-btn">Update Manifesto</button>
          <a class="mf-link" href="${pageContext.request.contextPath}/candidate/profile">View In Profile</a>
        </div>
      </form>
    </c:when>
    <c:otherwise>
      <div class="mf-body">
        <h4>Our Vision for a Sustainable Tomorrow</h4>
        <c:choose>
          <c:when test="${not empty currentManifesto}">
            <p><c:out value="${currentManifesto}" /></p>
          </c:when>
          <c:otherwise>
            <div class="mf-empty">
              No manifesto has been published yet. Open the manifesto editor to publish your campaign vision.
            </div>
          </c:otherwise>
        </c:choose>
      </div>

      <div class="mf-actions">
        <a class="mf-link" href="${pageContext.request.contextPath}/candidate/manifesto">Edit Manifesto</a>
      </div>
    </c:otherwise>
  </c:choose>
</article>