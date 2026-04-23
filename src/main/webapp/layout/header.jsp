<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="displayName" value="${not empty sessionScope.user.fullName ? sessionScope.user.fullName : 'Rajesh Kumar'}" />
<c:set var="roleLabel" value="${not empty sessionScope.user.role ? sessionScope.user.role : 'Candidate'}" />

<style>
  .ns-header-wrap {
    position: sticky;
    top: 0;
    z-index: 40;
    padding: 1rem;
    background: linear-gradient(180deg, rgba(248, 249, 251, 0.94) 0%, rgba(248, 249, 251, 0.88) 100%);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
  }

  .ns-header-inner {
    max-width: 1280px;
    margin: 0 auto;
    border: 1px solid #e1e2ec;
    border-radius: 1rem;
    background: #ffffff;
    box-shadow: 0 10px 15px -3px rgba(0, 35, 111, 0.08);
    padding: 0.9rem 1rem;
  }

  .ns-topbar {
    display: flex;
    align-items: center;
    gap: 0.9rem;
    flex-wrap: wrap;
  }

  .ns-search {
    position: relative;
    flex: 1;
    min-width: 220px;
    max-width: 560px;
  }

  .ns-search input {
    width: 100%;
    border: 1px solid #e1e2ec;
    border-radius: 9999px;
    padding: 0.65rem 0.95rem 0.65rem 2.5rem;
    font-size: 0.875rem;
    color: #191c1e;
    background: #f8f9fb;
    outline: none;
  }

  .ns-search input:focus {
    border-color: #00236f;
    box-shadow: 0 0 0 3px rgba(0, 35, 111, 0.12);
  }

  .ns-search-icon {
    position: absolute;
    left: 0.85rem;
    top: 50%;
    transform: translateY(-50%);
    color: #6b7280;
    width: 1rem;
    height: 1rem;
  }

  .ns-icon-btn {
    width: 2.5rem;
    height: 2.5rem;
    border: 1px solid #e1e2ec;
    border-radius: 9999px;
    background: #ffffff;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #5a5d69;
    cursor: pointer;
  }

  .ns-icon-btn:hover {
    background: #f3f4f6;
    color: #00236f;
  }

  .ns-user-card {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    border: 1px solid #e1e2ec;
    border-radius: 9999px;
    padding: 0.35rem 0.65rem 0.35rem 0.35rem;
    background: #ffffff;
    min-width: 190px;
  }

  .ns-avatar {
    width: 2rem;
    height: 2rem;
    border-radius: 9999px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    font-weight: 700;
    font-size: 0.75rem;
    text-transform: uppercase;
    background: linear-gradient(135deg, #00236f 0%, #1e40af 100%);
  }

  .ns-user-text {
    min-width: 0;
  }

  .ns-user-name {
    font-size: 0.83rem;
    line-height: 1.1;
    font-weight: 700;
    color: #191c1e;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 115px;
  }

  .ns-user-role {
    font-size: 0.7rem;
    line-height: 1.1;
    color: #6b7280;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 115px;
  }

  .ns-brand {
    min-width: 165px;
  }

  .ns-brand small {
    display: block;
    font-size: 0.63rem;
    letter-spacing: 0.09em;
    text-transform: uppercase;
    color: #64748b;
    font-weight: 600;
  }

  .ns-brand strong {
    display: block;
    color: #00236f;
    font-size: 1.02rem;
    font-weight: 800;
    line-height: 1.15;
  }

  @media (max-width: 900px) {
    .ns-search {
      order: 3;
      min-width: 100%;
      max-width: 100%;
    }

    .ns-user-card {
      min-width: 0;
    }
  }
</style>

<header class="ns-header-wrap font-inter">
  <div class="ns-header-inner">
    <div class="ns-topbar">
      <div class="ns-brand">
        <small>General Election 2026</small>
        <strong>NirvachanSetu Portal</strong>
      </div>

      <div class="ns-search">
        <svg class="ns-search-icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M21 21L15.8 15.8M17 10.5C17 14.09 14.09 17 10.5 17C6.91 17 4 14.09 4 10.5C4 6.91 6.91 4 10.5 4C14.09 4 17 6.91 17 10.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <input type="text" placeholder="Search analytics, voters, or news..." aria-label="Search" />
      </div>

      <button type="button" class="ns-icon-btn" aria-label="Notifications">
        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M14.8 18.5H9.2M18 9.3C18 6.37 15.31 4 12 4C8.69 4 6 6.37 6 9.3V12.05C6 12.83 5.71 13.58 5.18 14.16L4 15.5H20L18.82 14.16C18.29 13.58 18 12.83 18 12.05V9.3Z" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      </button>

      <button type="button" class="ns-icon-btn" aria-label="Settings">
        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M12 8.5C10.07 8.5 8.5 10.07 8.5 12C8.5 13.93 10.07 15.5 12 15.5C13.93 15.5 15.5 13.93 15.5 12C15.5 10.07 13.93 8.5 12 8.5Z" stroke="currentColor" stroke-width="1.8"/>
          <path d="M19.4 13.5C19.47 13.01 19.5 12.51 19.5 12C19.5 11.49 19.47 10.99 19.4 10.5L21 9.3L19.4 6.7L17.5 7.3C16.73 6.67 15.85 6.19 14.9 5.9L14.5 4H9.5L9.1 5.9C8.15 6.19 7.27 6.67 6.5 7.3L4.6 6.7L3 9.3L4.6 10.5C4.53 10.99 4.5 11.49 4.5 12C4.5 12.51 4.53 13.01 4.6 13.5L3 14.7L4.6 17.3L6.5 16.7C7.27 17.33 8.15 17.81 9.1 18.1L9.5 20H14.5L14.9 18.1C15.85 17.81 16.73 17.33 17.5 16.7L19.4 17.3L21 14.7L19.4 13.5Z" stroke="currentColor" stroke-width="1.5" stroke-linejoin="round"/>
        </svg>
      </button>

      <div class="ns-user-card ml-auto">
        <div class="ns-avatar">
          <c:out value="${fn:substring(displayName, 0, 1)}" />
        </div>
        <div class="ns-user-text">
          <div class="ns-user-name"><c:out value="${displayName}" /></div>
          <div class="ns-user-role"><c:out value="${roleLabel}" /></div>
        </div>
      </div>
    </div>
  </div>
</header>
