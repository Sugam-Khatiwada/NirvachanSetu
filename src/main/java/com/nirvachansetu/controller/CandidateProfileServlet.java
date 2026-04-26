package com.nirvachansetu.controller;

import java.io.IOException;
import java.util.List;

import com.nirvachansetu.dao.ConstituencyDAO;
import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * CandidateProfileServlet handles the candidate's profile management:
 * - GET: Display the profile page
 * - POST: Update profile information
 * (Similar to VoterProfileServlet but for the candidate role)
 */
@WebServlet("/candidate/profile")
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

            // Update user profile fields
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
}
