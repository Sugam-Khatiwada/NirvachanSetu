<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NirvachanSetu - Candidate Nomination</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/output.css">

  <style>
    :root {
      --dash-bg: #f3f5fa;
      --dash-surface: #ffffff;
      --dash-border: #e6ebf3;
      --dash-text: #121827;
      --dash-muted: #6b7280;
      --dash-primary: #12337f;
      --dash-primary-2: #1a4bbd;
    }

    body {
      margin: 0;
      color: var(--dash-text);
      background:
        radial-gradient(90% 110% at 0% 0%, #eaf0ff 0%, rgba(234, 240, 255, 0) 56%),
        linear-gradient(180deg, #f5f7fb 0%, #eef2f8 100%);
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
      gap: 0.9rem;
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

    .nomination-wrap {
      padding: 1rem;
      display: grid;
      grid-template-columns: minmax(0, 0.82fr) minmax(0, 1.3fr);
      gap: 1rem;
      align-items: stretch;
      min-height: 690px;
    }

    .nomination-intro {
      border: 1px solid #dce5f9;
      border-radius: 1rem;
      padding: 1.1rem;
      background: linear-gradient(180deg, #f8fbff 0%, #f1f5ff 100%);
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    .brand-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.45rem;
      color: var(--dash-primary);
      font-weight: 800;
      font-size: 0.95rem;
    }

    .brand-mark {
      width: 1.65rem;
      height: 1.65rem;
      border-radius: 0.5rem;
      background: linear-gradient(135deg, #0f3a97 0%, #1f4fcc 100%);
      color: #ffffff;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 0.75rem;
      font-weight: 800;
    }

    .intro-head {
      margin-top: 0.5rem;
    }

    .intro-head h1 {
      margin: 0;
      font-size: 1.45rem;
      line-height: 1.18;
      font-weight: 800;
      color: #0f2f74;
    }

    .intro-head p {
      margin: 0.55rem 0 0;
      color: #475569;
      font-size: 0.84rem;
      line-height: 1.55;
      max-width: 36ch;
    }

    .verified-note {
      display: flex;
      align-items: center;
      gap: 0.45rem;
      font-size: 0.76rem;
      color: #556179;
      font-weight: 700;
    }

    .verified-dot {
      width: 0.58rem;
      height: 0.58rem;
      border-radius: 9999px;
      background: #16a34a;
      box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.14);
    }

    .required-box {
      margin-top: auto;
      border-radius: 0.9rem;
      background: linear-gradient(160deg, #12337f 0%, #1e4ec0 100%);
      color: #dce7ff;
      padding: 0.85rem 0.9rem;
      border: 1px solid rgba(255, 255, 255, 0.18);
    }

    .required-box strong {
      display: block;
      color: #ffffff;
      font-size: 0.82rem;
      margin-bottom: 0.45rem;
    }

    .required-box ul {
      margin: 0;
      padding-left: 1rem;
      font-size: 0.75rem;
      line-height: 1.6;
    }

    .nomination-card {
      border: 1px solid #dfe6f4;
      border-radius: 1rem;
      background: #ffffff;
      padding: 1.05rem;
      display: flex;
      flex-direction: column;
      gap: 0.9rem;
      box-shadow: 0 16px 30px -24px rgba(18, 51, 127, 0.5);
    }

    .card-toolbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 0.7rem;
      padding-bottom: 0.4rem;
      border-bottom: 1px solid #edf1f8;
    }

    .card-toolbar small {
      color: #64748b;
      font-size: 0.74rem;
      font-weight: 700;
      letter-spacing: 0.06em;
      text-transform: uppercase;
    }

    .cancel-link {
      text-decoration: none;
      font-size: 0.76rem;
      font-weight: 700;
      color: #1d4ed8;
    }

    .section-title {
      margin: 0;
      font-size: 0.92rem;
      color: #0f2f74;
      font-weight: 800;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .section-title::before {
      content: "";
      width: 4px;
      height: 1rem;
      border-radius: 9999px;
      background: #1e4ec0;
    }

    .field-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 0.7rem;
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
    .field select,
    .field textarea {
      width: 100%;
      border: 1px solid #dee6f3;
      border-radius: 0.62rem;
      background: #f8fafe;
      color: #111827;
      font-size: 0.84rem;
      padding: 0.65rem 0.7rem;
      outline: none;
      transition: border-color 0.15s ease, box-shadow 0.15s ease;
    }

    .field input:focus,
    .field select:focus,
    .field textarea:focus {
      border-color: #1d4ed8;
      box-shadow: 0 0 0 3px rgba(29, 78, 216, 0.12);
      background: #ffffff;
    }

    .field textarea {
      min-height: 88px;
      resize: vertical;
    }

    .doc-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 0.75rem;
    }

    .doc-box {
      border: 1px dashed #cbd8f0;
      border-radius: 0.8rem;
      background: #f9fbff;
      padding: 0.78rem;
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 126px;
    }

    .doc-icon {
      width: 2rem;
      height: 2rem;
      border-radius: 9999px;
      background: #e6eeff;
      color: #1e4ec0;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-weight: 800;
      margin-bottom: 0.45rem;
    }

    .doc-box h4 {
      margin: 0;
      font-size: 0.78rem;
      color: #0f2f74;
      font-weight: 800;
    }

    .doc-box p {
      margin: 0.2rem 0 0.52rem;
      font-size: 0.69rem;
      color: #7a869b;
    }

    .doc-box button {
      border: 0;
      border-radius: 0.5rem;
      background: #dce8ff;
      color: #12337f;
      font-size: 0.69rem;
      font-weight: 800;
      padding: 0.4rem 0.6rem;
      cursor: pointer;
    }

    .declaration {
      display: flex;
      align-items: flex-start;
      gap: 0.5rem;
      color: #667085;
      font-size: 0.72rem;
      line-height: 1.45;
    }

    .submit-btn {
      margin-top: 0.2rem;
      border: 0;
      border-radius: 0.72rem;
      background: linear-gradient(135deg, #0f3a97 0%, #1f4fcc 100%);
      color: #ffffff;
      font-size: 0.86rem;
      font-weight: 800;
      padding: 0.76rem 1rem;
      cursor: pointer;
      box-shadow: 0 9px 20px -15px rgba(15, 58, 151, 0.8);
      width: 100%;
    }

    .form-footnote {
      margin: 0.1rem 0 0;
      text-align: center;
      color: #8a94a7;
      font-size: 0.61rem;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      font-weight: 700;
    }

    @media (max-width: 1180px) {
      .nomination-wrap {
        grid-template-columns: 1fr;
        min-height: auto;
      }

      .required-box {
        margin-top: 0.3rem;
      }
    }

    @media (max-width: 980px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 720px) {
      .field-grid,
      .doc-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body class="font-inter">

<jsp:include page="/layout/header.jsp" />

<main class="candidate-shell">
  <div class="dashboard-grid">
    <c:set var="activeCandidateNav" value="application" />
    <jsp:include page="/layout/candidate-sidebar.jsp" />

    <section class="content-col">
      <c:if test="${not empty error}">
        <div class="alert-strip alert-error"><c:out value="${error}" /></div>
      </c:if>

      <div class="panel nomination-wrap">
        <aside class="nomination-intro">
          <div class="brand-badge">
            <span class="brand-mark">NS</span>
            <span>NirvachanSetu</span>
          </div>

          <div class="intro-head">
            <h1>Candidate Nomination</h1>
            <p>
              Please provide accurate information for your official candidacy.
              Your nomination will be reviewed by the Election Commission.
            </p>
          </div>

          <div class="verified-note">
            <span class="verified-dot"></span>
            Verified Portal Access
          </div>

          <div class="required-box">
            <strong>Required Files</strong>
            <ul>
              <li>Government issued identity proof (PDF)</li>
              <li>Signed nomination declaration</li>
              <li>Party affiliation evidence (if applicable)</li>
            </ul>
          </div>
        </aside>

        <div class="nomination-card">
          <div class="card-toolbar">
            <small>Nomination Form</small>
            <a class="cancel-link" href="${pageContext.request.contextPath}/candidate/dashboard">Cancel Application</a>
          </div>

          <form action="${pageContext.request.contextPath}/candidate/application" method="post">
            <h2 class="section-title">Identity Details</h2>

            <div class="field-grid" style="margin-top:0.62rem;">
              <div class="field">
                <label for="candidateName">Full Name</label>
                <input id="candidateName" type="text" value="${user.fullName}" placeholder="Enter as per official records" readonly>
              </div>
              <div class="field">
                <label for="partyName">Party Affiliation</label>
                <input id="partyName" name="partyName" type="text" placeholder="Independent or Party Name" required>
              </div>
            </div>

            <div class="field-grid" style="margin-top:0.62rem;">
              <div class="field">
                <label for="constituencyId">Constituency Selection</label>
                <select id="constituencyId" name="constituencyId" required>
                  <option value="" disabled selected>Choose your primary constituency</option>
                  <c:forEach var="constituency" items="${constituencies}">
                    <option value="${constituency.id}"><c:out value="${constituency.name}" /></option>
                  </c:forEach>
                </select>
              </div>
              <div class="field">
                <label for="electionId">Election Cycle</label>
                <select id="electionId" name="electionId" required>
                  <option value="" disabled selected>Choose election window</option>
                  <c:forEach var="election" items="${elections}">
                    <option value="${election.id}"><c:out value="${election.name}" /></option>
                  </c:forEach>
                </select>
              </div>
            </div>

            <div class="field-grid" style="margin-top:0.62rem;">
              <div class="field">
                <label for="partyType">Party Type</label>
                <select id="partyType" name="partyType" required>
                  <option value="" disabled selected>Select party type</option>
                  <option value="PARTY_MEMBER">Party Member</option>
                  <option value="INDEPENDENT">Independent</option>
                </select>
              </div>
              <div class="field">
                <label for="symbol">Election Symbol</label>
                <input id="symbol" name="symbol" type="text" placeholder="Enter symbol name" required>
              </div>
            </div>

            <div class="field-grid full" style="margin-top:0.62rem;">
              <div class="field">
                <label for="manifesto">Campaign Summary</label>
                <textarea id="manifesto" name="manifesto" placeholder="Write your campaign focus and key commitments" required></textarea>
              </div>
            </div>

            <h2 class="section-title" style="margin-top:0.95rem;">Document Verification</h2>

            <div class="doc-grid" style="margin-top:0.62rem;">
              <article class="doc-box">
                <div class="doc-icon">ID</div>
                <h4>ID Proof</h4>
                <p>Aadhaar, Voter ID, or Passport</p>
                <button type="button">Browse Files</button>
              </article>

              <article class="doc-box">
                <div class="doc-icon">NP</div>
                <h4>Nomination Paper</h4>
                <p>Signed Form 2A / 2B</p>
                <button type="button">Browse Files</button>
              </article>
            </div>

            <label class="declaration" style="margin-top:0.88rem;">
              <input type="checkbox" required>
              <span>
                I hereby declare that the information provided is true to the best of my knowledge,
                and I understand that discrepancies may lead to disqualification.
              </span>
            </label>

            <button class="submit-btn" type="submit">Submit Nomination</button>
            <p class="form-footnote">Secure Transmission Enabled - EC Protocol v1.2</p>
          </form>
        </div>
      </div>
    </section>
  </div>
</main>

</body>
</html>
