package com.nirvachansetu.controller;

import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

/**
 * AuthServlet handles authentication-related operations:
 * - Login (/login)
 * - Register (/register)
 * - Logout (/logout)
 */
@WebServlet({"/login", "/register", "/logout"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
public class AuthServlet extends HttpServlet {

    private UserService userService = new UserService();

    private static final String UPLOAD_DIR = "images" + File.separator + "profile";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getServletPath();

        switch (pathInfo) {
            case "/login":
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                break;

            case "/register":
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                break;

            case "/logout":
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect(request.getContextPath() + "/login");
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getServletPath();

        switch (pathInfo) {
            case "/login":
                handleLogin(request, response);
                break;

            case "/register":
                handleRegister(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    /**
     * Handles user login.
     */
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userService.login(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                // Store role as String (not enum) for safe EL comparisons like ${sessionScope.role == 'ADMIN'}
                session.setAttribute("role", user.getRole().name());

                // Redirect to role-based dashboard
                String dashboardPath;
                switch (user.getRole()) {
                    case ADMIN:
                        dashboardPath = "/admin/dashboard";
                        break;
                    case VOTER:
                        dashboardPath = "/voter/dashboard";
                        break;
                    case CANDIDATE:
                        dashboardPath = "/candidate/dashboard";
                        break;
                    default:
                        dashboardPath = "/login";
                        break;
                }

                response.sendRedirect(request.getContextPath() + dashboardPath);
            } else {
                request.setAttribute("error", "Invalid email or password. Please try again.");
                request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred during login: " + e.getMessage());
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
        }
    }

    /**
     * Handles user registration with file upload support.
     */
    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String citizenshipNumber = request.getParameter("citizenshipNumber");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String constituencyIdStr = request.getParameter("constituencyId");

        try {
            // Validate required fields
            if (fullName == null || fullName.trim().isEmpty()) {
                request.setAttribute("error", "Full name is required.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }
            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("error", "Email address is required.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }
            if (password == null || password.length() < 6) {
                request.setAttribute("error", "Password must be at least 6 characters.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }
            if (confirmPassword == null || !password.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }
            if (citizenshipNumber == null || citizenshipNumber.trim().isEmpty()) {
                request.setAttribute("error", "Citizenship number is required.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }

            // Check if email already exists
            if (userService.findByEmail(email) != null) {
                request.setAttribute("error", "An account with this email already exists.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }

            // Check if citizenship number already exists
            if (userService.isCitizenshipNumberExists(citizenshipNumber)) {
                request.setAttribute("error", "This citizenship number is already registered.");
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                return;
            }

            // Handle profile image upload (optional)
            String profileImagePath = null;
            try {
                Part filePart = request.getPart("profileImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String contentType = filePart.getContentType();
                    if (contentType != null && (contentType.equals("image/png") ||
                            contentType.equals("image/jpeg"))) {

                        // Create upload directory
                        String uploadPath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();
                        }

                        // Generate unique filename
                        String submittedName = filePart.getSubmittedFileName();
                        String extension = submittedName.substring(submittedName.lastIndexOf("."));
                        String uniqueName = UUID.randomUUID().toString() + extension;

                        // Save file
                        Path filePath = Paths.get(uploadPath + File.separator + uniqueName);
                        try (InputStream is = filePart.getInputStream()) {
                            Files.copy(is, filePath, StandardCopyOption.REPLACE_EXISTING);
                        }

                        profileImagePath = UPLOAD_DIR + File.separator + uniqueName;
                    }
                }
            } catch (Exception imgEx) {
                // Image upload is optional, log and continue
                System.out.println("Image upload skipped: " + imgEx.getMessage());
            }

            // Create new User - pass plain password, UserService will hash it
            User user = new User();
            user.setFullName(fullName.trim());
            user.setEmail(email.trim().toLowerCase());
            user.setPassword(password);
            user.setCitizenshipNumber(citizenshipNumber.trim());
            user.setPhone(phone != null ? phone.trim() : null);
            user.setAddress(address != null ? address.trim() : null);
            user.setRole(User.Role.VOTER);
            user.setStatus(User.UserStatus.PENDING);
            user.setProfileImage(profileImagePath);

            // Set constituency if provided
            if (constituencyIdStr != null && !constituencyIdStr.isEmpty()) {
                Constituency constituency = new Constituency();
                constituency.setId(Integer.parseInt(constituencyIdStr));
                user.setConstituency(constituency);
            }

            // Register the user (password gets hashed inside)
            userService.register(user);

            request.setAttribute("success",
                    "Registration successful! Your account is pending approval. Please login after it is approved.");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid constituency selection.");
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
    }
}
