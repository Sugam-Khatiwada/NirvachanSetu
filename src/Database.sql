-- =========================
-- CREATE DATABASE
-- =========================
CREATE DATABASE NirvachanSetu;
USE NirvachanSetu;

-- =========================
-- CONSTITUENCIES
-- =========================
CREATE TABLE constituencies (
    constituency_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    district VARCHAR(100),
    province VARCHAR(100)
);

-- =========================
-- USERS
-- =========================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('ADMIN','VOTER') DEFAULT 'VOTER',
    citizenship_no VARCHAR(50) UNIQUE,
    constituency_id INT,
    profile_image VARCHAR(255),
    document_image VARCHAR(255),
    is_approved BOOLEAN DEFAULT FALSE,
    token_version INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id)
);

-- =========================
-- ELECTIONS
-- =========================
CREATE TABLE elections (
    election_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    type ENUM('HOR') DEFAULT 'HOR',
    start_time DATETIME,
    end_time DATETIME,
    status ENUM('UPCOMING','ONGOING','COMPLETED') DEFAULT 'UPCOMING'
);

-- =========================
-- CANDIDATE APPLICATIONS
-- =========================
CREATE TABLE candidate_applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    constituency_id INT,
    manifesto TEXT,
    document_image VARCHAR(255),
    status ENUM('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id)
);

-- =========================
-- CANDIDATES
-- =========================
CREATE TABLE candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    election_id INT,
    constituency_id INT,
    manifesto TEXT,
    profile_image VARCHAR(255),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (election_id) REFERENCES elections(election_id),
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id)
);

-- =========================
-- VOTES (ANONYMOUS)
-- =========================
CREATE TABLE votes (
    vote_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    election_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
    FOREIGN KEY (election_id) REFERENCES elections(election_id)
);

-- =========================
-- VOTE TRACKING
-- =========================
CREATE TABLE vote_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    election_id INT,

    UNIQUE(user_id, election_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (election_id) REFERENCES elections(election_id)
);

-- =========================
-- INTERESTS
-- =========================
CREATE TABLE interests (
    interest_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    candidate_id INT,
    constituency_id INT,

    UNIQUE(user_id, candidate_id, constituency_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id)
);

-- =========================
-- REFRESH TOKENS
-- =========================
CREATE TABLE refresh_tokens (
    token_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    token VARCHAR(500) NOT NULL,
    expiry_date DATETIME NOT NULL,
    is_revoked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
