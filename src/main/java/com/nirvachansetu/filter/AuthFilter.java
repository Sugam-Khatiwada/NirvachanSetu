package com.nirvachansetu.filter;

import com.nirvachansetu.model.User;
import com.nirvachansetu.util.AppConstants;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Authentication and authorization filter.
 * Checks if users are logged in and have the correct role for the requested URL.
 */
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = requestURI.substring(contextPath.length());

        // Allow public paths without authentication
        if (isPublicPath(path)) {
            chain.doFilter(request, response);
            return;
        }

        // Check if user is logged in
        if (session == null || session.getAttribute(AppConstants.SESSION_USER) == null) {
            httpResponse.sendRedirect(contextPath + AppConstants.URL_LOGIN);
            return;
        }

        // Get the logged-in user
        User user = (User) session.getAttribute(AppConstants.SESSION_USER);

        // Role-based access control
        if (!hasRoleAccess(user.getRole().name(), path)) {
            // Redirect to the user's appropriate dashboard
            String redirectPath = getDashboardForRole(user.getRole().name());
            httpResponse.sendRedirect(contextPath + redirectPath);
            return;
        }

        // User is authenticated and authorized
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup logic if needed
    }

    /**
     * Checks if the given path is a public path that doesn't require authentication.
     *
     * @param path the request path (without context path)
     * @return true if the path is public, false otherwise
     */
    private boolean isPublicPath(String path) {
        for (String publicPath : AppConstants.PUBLIC_PATHS) {
            if (path.equals(publicPath) || path.startsWith(publicPath) || path.startsWith(publicPath + "/")) {
                return true;
            }
        }
        // Allow access to the root path and favicon
        if (path.equals("/") || path.equals("/favicon.ico")) {
            return true;
        }
        return false;
    }

    /**
     * Checks if a user with the given role can access the requested path.
     *
     * @param role the user's role
     * @param path the request path
     * @return true if access is allowed, false otherwise
     */
    private boolean hasRoleAccess(String role, String path) {
        // Admin can access /admin/* paths
        if (path.startsWith("/admin")) {
            return AppConstants.ROLE_ADMIN.equals(role);
        }

        // Candidate paths require CANDIDATE role
        if (path.startsWith("/candidate")) {
            return AppConstants.ROLE_CANDIDATE.equals(role);
        }

        // Voter paths can be accessed by VOTER or CANDIDATE (candidates can also vote)
        if (path.startsWith("/voter")) {
            return AppConstants.ROLE_VOTER.equals(role) || AppConstants.ROLE_CANDIDATE.equals(role);
        }

        // Common paths (like logout, profile) accessible to all authenticated users
        if (path.startsWith("/logout") || path.startsWith("/profile")) {
            return true;
        }

        // Default: allow access
        return true;
    }

    /**
     * Returns the dashboard URL for a given role.
     *
     * @param role the user's role
     * @return the dashboard path
     */
    private String getDashboardForRole(String role) {
        switch (role) {
            case AppConstants.ROLE_ADMIN:
                return AppConstants.URL_ADMIN_DASHBOARD;
            case AppConstants.ROLE_CANDIDATE:
                return AppConstants.URL_CANDIDATE_DASHBOARD;
            case AppConstants.ROLE_VOTER:
                return AppConstants.URL_VOTER_DASHBOARD;
            default:
                return AppConstants.URL_LOGIN;
        }
    }
}
