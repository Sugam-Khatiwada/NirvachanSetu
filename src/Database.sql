-- =============================================
-- NirvachanSetu Database Schema
-- MySQL 8.0+ Compatible
-- =============================================

DROP DATABASE IF EXISTS nirvachansetu_db;
CREATE DATABASE nirvachansetu_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nirvachansetu_db;

-- =============================================
-- 1. Constituencies Table (no dependencies)
-- =============================================
CREATE TABLE constituencies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    total_voters INT DEFAULT 0,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- 2. Users Table
-- =============================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    citizenship_number VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('ADMIN', 'VOTER', 'CANDIDATE') NOT NULL DEFAULT 'VOTER',
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'SUSPENDED') NOT NULL DEFAULT 'PENDING',
    profile_image VARCHAR(500),
    address TEXT,
    constituency_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_constituency FOREIGN KEY (constituency_id) REFERENCES constituencies(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- 3. Elections Table
-- =============================================
CREATE TABLE elections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    election_type ENUM('HOR', 'PROVINCIAL', 'LOCAL') NOT NULL DEFAULT 'HOR',
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('DRAFT', 'REGISTRATION', 'ACTIVE', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'DRAFT',
    constituency_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- 4. Candidate Applications Table
--    One application per user per election
-- =============================================
CREATE TABLE candidate_applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    election_id INT NOT NULL,
    constituency_id INT NOT NULL,
    party_name VARCHAR(200),
    party_type ENUM('NATIONAL', 'REGIONAL', 'INDEPENDENT') DEFAULT 'INDEPENDENT',
    manifesto TEXT,
    symbol VARCHAR(100),
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'WITHDRAWN') NOT NULL DEFAULT 'PENDING',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (election_id) REFERENCES elections(id) ON DELETE CASCADE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(id) ON DELETE CASCADE,
    UNIQUE KEY unique_application (user_id, election_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- 5. Candidates Table (Approved Applications)
--    FIXED: user_id is no longer globally UNIQUE.
--    Changed to composite unique (user_id, election_id)
--    so a user can be candidate in MULTIPLE elections
--    after the previous election completes.
-- =============================================
CREATE TABLE candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    application_id INT NOT NULL UNIQUE,
    election_id INT NOT NULL,
    constituency_id INT NOT NULL,
    party_name VARCHAR(200),
    party_type ENUM('NATIONAL', 'REGIONAL', 'INDEPENDENT') DEFAULT 'INDEPENDENT',
    manifesto TEXT,
    symbol VARCHAR(100),
    total_votes INT DEFAULT 0,
    status ENUM('ACTIVE', 'DISQUALIFIED', 'WITHDRAWN') NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (application_id) REFERENCES candidate_applications(id) ON DELETE CASCADE,
    FOREIGN KEY (election_id) REFERENCES elections(id) ON DELETE CASCADE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(id) ON DELETE CASCADE,
    UNIQUE KEY unique_candidate_per_election (user_id, election_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- 6. Votes Table (One vote per voter per election)
-- =============================================
CREATE TABLE votes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    election_id INT NOT NULL,
    candidate_id INT NOT NULL,
    constituency_id INT NOT NULL,
    voter_id INT NOT NULL,
    voted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (election_id) REFERENCES elections(id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_id) REFERENCES candidates(id) ON DELETE CASCADE,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(id) ON DELETE CASCADE,
    FOREIGN KEY (voter_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_vote (election_id, voter_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- Indexes for performance
-- =============================================
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_status ON users(status);
CREATE INDEX idx_users_constituency ON users(constituency_id);
CREATE INDEX idx_elections_status ON elections(status);
CREATE INDEX idx_elections_type ON elections(election_type);
CREATE INDEX idx_applications_user ON candidate_applications(user_id);
CREATE INDEX idx_applications_election ON candidate_applications(election_id);
CREATE INDEX idx_applications_status ON candidate_applications(status);
CREATE INDEX idx_candidates_user ON candidates(user_id);
CREATE INDEX idx_candidates_election ON candidates(election_id);
CREATE INDEX idx_votes_election ON votes(election_id);
CREATE INDEX idx_votes_voter ON votes(voter_id);
CREATE INDEX idx_votes_candidate ON votes(candidate_id);

-- =============================================
-- Insert Sample Data
-- =============================================

-- Admin User (password: admin123)
INSERT INTO users (full_name, email, password, citizenship_number, phone, role, status, address) VALUES
('System Administrator', 'admin@nirvachansetu.com', '590b00d332fb0fd02f0e407b199167a52859008c8b9aeab0457105e7e0c68246', 'ADMIN-001', '9800000001', 'ADMIN', 'APPROVED', 'Kathmandu, Nepal');

-- Sample Constituencies (8 constituencies across Nepal)
INSERT INTO constituencies (name, district, province, total_voters, description) VALUES
('Kathmandu-1', 'Kathmandu', 'Bagmati Province', 125000, 'Constituency covering central Kathmandu'),
('Kathmandu-2', 'Kathmandu', 'Bagmati Province', 118000, 'Constituency covering eastern Kathmandu'),
('Kathmandu-3', 'Kathmandu', 'Bagmati Province', 132000, 'Constituency covering northern Kathmandu'),
('Lalitpur-1', 'Lalitpur', 'Bagmati Province', 95000, 'Constituency covering central Lalitpur'),
('Bhaktapur-1', 'Bhaktapur', 'Bagmati Province', 88000, 'Constituency covering Bhaktapur district'),
('Pokhara-1', 'Kaski', 'Gandaki Province', 110000, 'Constituency covering Pokhara metropolitan'),
('Biratnagar-1', 'Morang', 'Koshi Province', 105000, 'Constituency covering Biratnagar area'),
('Chitwan-1', 'Chitwan', 'Bagmati Province', 97000, 'Constituency covering Chitwan district');

-- Sample Election 1 (COMPLETED - for testing results)
INSERT INTO elections (name, description, election_type, start_date, end_date, status) VALUES
('House of Representatives Election 2024', 'General election for the House of Representatives', 'HOR', '2024-05-12 08:00:00', '2024-05-12 17:00:00', 'COMPLETED');

-- Sample Election 2 (ACTIVE - for testing voting)
INSERT INTO elections (name, description, election_type, start_date, end_date, status) VALUES
('Provincial Assembly Election 2025', 'Provincial assembly election for Bagmati Province', 'PROVINCIAL', '2025-06-15 08:00:00', '2025-06-15 17:00:00', 'ACTIVE');

-- Sample Voters (password: password123)
INSERT INTO users (full_name, email, password, citizenship_number, phone, role, status, constituency_id, address) VALUES
('Rajesh Sharma', 'rajesh@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-001-001', '9801000001', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 1'),
('Sita Kumari', 'sita@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-001-002', '9801000002', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 3'),
('Hari Bahadur', 'hari@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-001-003', '9801000003', 'VOTER', 'APPROVED', 2, 'Kathmandu, Ward 5'),
('Anita Devi', 'anita@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-001-004', '9801000004', 'VOTER', 'PENDING', 3, 'Lalitpur'),
('Ram Prasad', 'ram@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-001-005', '9801000005', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 7');

-- Sample Candidate Users (password: password123)
INSERT INTO users (full_name, email, password, citizenship_number, phone, role, status, constituency_id, address) VALUES
('Dr. Anjali Verma', 'anjali@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-002-001', '9802000001', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 2'),
('Prakash Hegde', 'prakash@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-002-002', '9802000002', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 4'),
('Vikram Aditya', 'vikram@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-002-003', '9802000003', 'VOTER', 'APPROVED', 1, 'Kathmandu, Ward 6'),
('Savitri Devi', 'savitri@email.com', '0704177628f388f34487a9256c3bcce8c9f7eb60f192de441c233fcfe0a26e58', 'CIT-002-004', '9802000004', 'VOTER', 'PENDING', 2, 'Lalitpur, Ward 1');

-- Candidate Applications for Election 1 (COMPLETED)
INSERT INTO candidate_applications (user_id, election_id, constituency_id, party_name, party_type, manifesto, symbol, status) VALUES
(6, 1, 1, 'Nepal Democratic Party', 'NATIONAL', 'I commit to improving education, healthcare, and infrastructure in our constituency. My vision is a prosperous and inclusive Nepal where every citizen has equal opportunities.', 'Elephant', 'APPROVED'),
(7, 1, 1, 'Progressive Alliance', 'REGIONAL', 'As your representative, I will focus on agricultural reform, women empowerment, and sustainable development. Together we can build a stronger community.', 'Lotus', 'APPROVED'),
(8, 1, 1, NULL, 'INDEPENDENT', 'I stand for transparency, accountability, and good governance. My agenda includes youth employment, digital literacy, and environmental conservation.', 'Lantern', 'APPROVED'),
(9, 1, 2, 'National Unity Forum', 'NATIONAL', 'Unity in diversity. I will work towards national integration, economic growth, and social justice for all citizens of our great nation.', 'Sun', 'PENDING');

-- Candidate Applications for Election 2 (ACTIVE - re-applying previous candidates)
INSERT INTO candidate_applications (user_id, election_id, constituency_id, party_name, party_type, manifesto, symbol, status) VALUES
(6, 2, 1, 'Nepal Democratic Party', 'NATIONAL', 'Building on my previous experience, I will further strengthen education and healthcare infrastructure while creating new employment opportunities.', 'Elephant', 'APPROVED'),
(7, 2, 1, 'Progressive Alliance', 'REGIONAL', 'With a proven track record, I will continue fighting for agricultural reform, women empowerment, and sustainable development in our community.', 'Lotus', 'APPROVED');

-- Candidates for Election 1 (COMPLETED election)
INSERT INTO candidates (user_id, application_id, election_id, constituency_id, party_name, party_type, manifesto, symbol, total_votes) VALUES
(6, 1, 1, 1, 'Nepal Democratic Party', 'NATIONAL', 'I commit to improving education, healthcare, and infrastructure in our constituency. My vision is a prosperous and inclusive Nepal where every citizen has equal opportunities.', 'Elephant', 3420),
(7, 2, 1, 1, 'Progressive Alliance', 'REGIONAL', 'As your representative, I will focus on agricultural reform, women empowerment, and sustainable development. Together we can build a stronger community.', 'Lotus', 2850),
(8, 3, 1, 1, NULL, 'INDEPENDENT', 'I stand for transparency, accountability, and good governance. My agenda includes youth employment, digital literacy, and environmental conservation.', 'Lantern', 1580);

-- Candidates for Election 2 (ACTIVE election - same users as new candidates)
INSERT INTO candidates (user_id, application_id, election_id, constituency_id, party_name, party_type, manifesto, symbol, total_votes) VALUES
(6, 5, 2, 1, 'Nepal Democratic Party', 'NATIONAL', 'Building on my previous experience, I will further strengthen education and healthcare infrastructure while creating new employment opportunities.', 'Elephant', 0),
(7, 6, 2, 1, 'Progressive Alliance', 'REGIONAL', 'With a proven track record, I will continue fighting for agricultural reform, women empowerment, and sustainable development in our community.', 'Lotus', 0);

-- Sample Votes for Election 1
INSERT INTO votes (election_id, candidate_id, constituency_id, voter_id) VALUES
(1, 1, 1, 2),
(1, 2, 1, 3),
(1, 1, 1, 5);
