package com.nirvachansetu.util;

/**
 * Application-wide constants used across the project.
 */
public final class AppConstants {

    private AppConstants() {
        // Prevent instantiation
    }

    // Session attribute names
    public static final String SESSION_USER = "user";
    public static final String SESSION_USER_ID = "userId";
    public static final String SESSION_ROLE = "role";
    public static final String SESSION_EMAIL = "email";

    // User role constants
    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_VOTER = "VOTER";
    public static final String ROLE_CANDIDATE = "CANDIDATE";

    // User status constants
    public static final String STATUS_PENDING = "PENDING";
    public static final String STATUS_APPROVED = "APPROVED";
    public static final String STATUS_REJECTED = "REJECTED";
    public static final String STATUS_SUSPENDED = "SUSPENDED";

    // Election status constants
    public static final String ELECTION_STATUS_DRAFT = "DRAFT";
    public static final String ELECTION_STATUS_REGISTRATION = "REGISTRATION";
    public static final String ELECTION_STATUS_ACTIVE = "ACTIVE";
    public static final String ELECTION_STATUS_COMPLETED = "COMPLETED";
    public static final String ELECTION_STATUS_CANCELLED = "CANCELLED";

    // Candidate status constants
    public static final String CANDIDATE_STATUS_ACTIVE = "ACTIVE";
    public static final String CANDIDATE_STATUS_DISQUALIFIED = "DISQUALIFIED";
    public static final String CANDIDATE_STATUS_WITHDRAWN = "WITHDRAWN";

    // Application status constants
    public static final String APPLICATION_STATUS_PENDING = "PENDING";
    public static final String APPLICATION_STATUS_APPROVED = "APPROVED";
    public static final String APPLICATION_STATUS_REJECTED = "REJECTED";
    public static final String APPLICATION_STATUS_WITHDRAWN = "WITHDRAWN";

    // Election type constants
    public static final String ELECTION_TYPE_HOR = "HOR";
    public static final String ELECTION_TYPE_PROVINCIAL = "PROVINCIAL";
    public static final String ELECTION_TYPE_LOCAL = "LOCAL";

    // Party type constants
    public static final String PARTY_TYPE_NATIONAL = "NATIONAL";
    public static final String PARTY_TYPE_REGIONAL = "REGIONAL";
    public static final String PARTY_TYPE_INDEPENDENT = "INDEPENDENT";

    // Pagination defaults
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 100;

    // Error / success messages
    public static final String MSG_REGISTRATION_SUCCESS = "Registration successful! Please wait for admin approval.";
    public static final String MSG_LOGIN_SUCCESS = "Login successful!";
    public static final String MSG_LOGIN_FAILED = "Invalid email or password.";
    public static final String MSG_VOTE_CAST = "Your vote has been cast successfully.";
    public static final String MSG_ALREADY_VOTED = "You have already voted in this election.";
    public static final String MSG_ACCESS_DENIED = "Access denied. You do not have permission to access this page.";
    public static final String MSG_SESSION_EXPIRED = "Your session has expired. Please login again.";
    public static final String MSG_APPLICATION_SUBMITTED = "Your application has been submitted successfully.";
    public static final String MSG_SERVER_ERROR = "An unexpected error occurred. Please try again later.";

    // URL paths
    public static final String URL_LOGIN = "/login";
    public static final String URL_REGISTER = "/register";
    public static final String URL_ADMIN_DASHBOARD = "/admin/dashboard";
    public static final String URL_VOTER_DASHBOARD = "/voter/dashboard";
    public static final String URL_CANDIDATE_DASHBOARD = "/candidate/dashboard";

    // Public resource prefixes (excluded from authentication)
    public static final String[] PUBLIC_PATHS = {
            "/login", "/register", "/css/", "/js/", "/images/", "/static/", "/assets/"
    };
}
