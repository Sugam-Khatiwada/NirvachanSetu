# NirvachanSetu - Election Management System

NirvachanSetu is a comprehensive web-based Election Management System built with Java (Servlets/JSP), Maven, and an SQL database. The platform is designed to handle end-to-end election processes and supports three main roles: **Admin**, **Candidate**, and **Voter**.

## Features
- **Role-Based Access Control:** Distinct portals and dashboards for Admins, Candidates, and Voters.
- **Voter Registration & Voting:** Secure user registration, constituency assignment, and online vote casting during active elections.
- **Candidate Applications:** Voters can apply for candidacy, maintain their profile, and publish electoral manifestos.
- **Admin Management:** Comprehensive administrative tools to manage users, approve candidate applications, define constituencies, and oversee elections.
- **Real-time Results:** View historical and real-time election results efficiently.

## Technologies Used
- **Frontend:** HTML, CSS, JavaScript, JSP (JavaServer Pages)
- **Backend:** Java 11+, Servlets, JSP
- **Database & ORM:** Relational Database (MySQL/PostgreSQL), JPA (Java Persistence API) via `persistence.xml`
- **Build Tool:** Apache Maven
- **Web Server:** Apache Tomcat

## Prerequisites
- **Java Development Kit (JDK)** 11 or higher
- **Apache Maven** (or use the provided `mvnw` wrapper)
- **Apache Tomcat** (or any compatible Servlet container)
- **Relational Database** (MySQL/PostgreSQL, as specified in your setup)

## Installation & Setup

1. **Database Setup:**
   - Create a database in your SQL server for the project.
   - Run the provided `src/Database.sql` script to create the necessary tables and populate initial mock data if applicable.

2. **Database Configuration:**
   - Open `src/main/resources/META-INF/persistence.xml`.
   - Update the connection string, database driver, `javax.persistence.jdbc.user`, and `javax.persistence.jdbc.password` to match your local SQL server credentials.

3. **Build the Project:**
   - Open your terminal in the root directory (where `pom.xml` is located) and compile the project using Maven:
     ```bash
     mvn clean install
     ```
   - This command will compile the code and generate the final web app deployment folder/WAR file inside the `target/` directory.

4. **Deploy and Run:**
   - Deploy the web application using your IDE's built-in web server support (like IntelliJ/Eclipse Tomcat plugin) OR copy the built directory (`target/NirvachanSetu-X.X-SNAPSHOT`) into your standalone Tomcat `webapps` folder.
   - Start your Tomcat server.

## How to Operate the System

1. **Getting Started:**
   - Open a web browser and navigate to `http://localhost:8080/NirvachanSetu` (or the respective context path you configured).
   - You will land on the **Home / Login Page**.

2. **Authentication (`/auth/`):**
   - **Register (`register.jsp`):** New users can create an account. By default, users register as "Voters".
   - **Login (`login.jsp`):** Enter your credentials. The system will automatically route you to the correct dashboard based on your assigned role.
   
   **Mock Login Credentials (from `Database.sql`):**
   - **Admin:** Email: `admin@nirvachansetu.com` | Password: `admin123`
   - **Voter:** Email: `rajesh@email.com` | Password: `password123`
   - **Candidate:** Email: `anjali@email.com` | Password: `password123`

3. **Voter Operations (`/voter/`):**
   - **Dashboard:** View upcoming and active elections.
   - **Cast Vote:** Securely cast a vote for candidates from your registered constituency during active elections.
   - **Apply Candidacy:** If a voter wishes to run for office, they can submit a candidacy application for an upcoming election.
   - **View Candidates & Results:** Inspect the candidate lists and view the outcome of past elections.

4. **Candidate Operations (`/candidate/`):**
   - **Dashboard:** Track candidacy status and overall election details.
   - **Manifesto Management:** Create and update an election manifesto to communicate promises and goals to the voters.
   - **Competing Candidates:** View other candidates running in the same constituency.

5. **Admin Operations (`/admin/`):**
   - **Dashboard:** Get a bird's-eye view of the system statistics.
   - **Manage Users & Candidates:** Review candidate application requests, approve/reject them, and manage general user roles across the system.
   - **Manage Constituencies:** Create, update, or remove constituencies.
   - **Manage Elections:** Schedule new elections, define timelines, and start/close the voting process.
   - **Results:** Officially declare and publish election results.

## Troubleshooting

- **Database Connection Issues:** If you encounter `PersistenceException` or JDBC errors, double-check the credentials in `persistence.xml` and ensure your database server is actively running.
- **Missing Dependencies:** Ensure your Maven build completes successfully. If artifacts are missing, run `mvn clean install -U` to force update dependencies.
