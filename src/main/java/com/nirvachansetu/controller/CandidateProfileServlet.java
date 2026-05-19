package com.nirvachansetu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import com.nirvachansetu.dao.ConstituencyDAO;
import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
/**
 * CandidateProfileServlet handles the candidate's profile management:
 * - GET: Display the profile page
 * - POST: Update profile information
 * (Similar to VoterProfileServlet but for the candidate role)
 */
@WebServlet("/candidate/profile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 5,      // 5MB
    maxRequestSize = 1024 * 1024 * 10    // 10MB
)
public class CandidateProfileServlet extends HttpServlet {

    private UserService userService = new UserService();
    private CandidateService candidateService = new CandidateService();
    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get all constituencies for display
            List<Constituency> constituencies = constituencyDAO.findAll();
            Candidate candidate = candidateService.findByUser(user.getId());
            String currentManifesto = candidate != null ? candidate.getManifesto() : null;

            request.setAttribute("user", user);
            request.setAttribute("constituencies", constituencies);
            request.setAttribute("candidate", candidate);
            request.setAttribute("currentManifesto", currentManifesto);
            request.getRequestDispatcher("/candidate/profile.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading profile: " + e.getMessage());
            request.getRequestDispatcher("/candidate/profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Check if this is a profile picture update (multipart request)
            String contentType = request.getContentType();
            if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
                Part profileImagePart = request.getPart("profileImage");
                if (profileImagePart != null && profileImagePart.getSize() > 0) {
                    String uploadPath = getServletContext().getRealPath("/") + "uploads" + File.separator + "candidate" + File.separator + "profile";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();

                    String fileName = saveProfileImage(profileImagePart, uploadPath);
                    if (fileName != null) {
                        user.setProfileImage("uploads/candidate/profile/" + fileName);
                        userService.updateProfile(user);
                        request.getSession().setAttribute("user", user);
                        request.getSession().setAttribute("success", "Profile picture updated successfully.");
                        response.sendRedirect(request.getContextPath() + "/candidate/profile");
                        return;
                    }
                }
            }

            // Update user profile fields (from the modal form)
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String constituencyIdStr = request.getParameter("constituencyId");

            user.setFullName(fullName);
            user.setPhone(phone);
            user.setAddress(address);

            // Update constituency if provided
            if (constituencyIdStr != null && !constituencyIdStr.isEmpty()) {
                Constituency constituency = new Constituency();
                constituency.setId(Integer.parseInt(constituencyIdStr));
                user.setConstituency(constituency);
            }

            userService.updateProfile(user);

            // Update session with latest user data
            request.getSession().setAttribute("user", user);

            request.getSession().setAttribute("success", "Profile updated successfully.");

        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error updating profile: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/candidate/profile");
    }

    private String saveProfileImage(Part part, String uploadPath) throws IOException {
        if (part == null || part.getSize() == 0) return null;
        
        String originalFileName = part.getSubmittedFileName();
        String extension = "";
        int i = originalFileName.lastIndexOf('.');
        if (i > 0) {
            extension = originalFileName.substring(i);
        }
        
        // Ensure it's an image
        String contentType = part.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            return null;
        }

        String fileName = UUID.randomUUID().toString() + extension;
        File file = new File(uploadPath + File.separator + fileName);
        
        try (InputStream input = part.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        
        return fileName;
    }
}
