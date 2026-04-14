package com.nirvachansetu.controller;

import com.nirvachansetu.model.User;
import com.nirvachansetu.service.UserService;
import com.nirvachansetu.dao.ConstituencyDAO;
import com.nirvachansetu.model.Constituency;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * VoterProfileServlet handles the voter's profile management:
 * - GET: Display the profile page
 * - POST: Update profile information
 */
@WebServlet("/voter/profile")
public class VoterProfileServlet extends HttpServlet {

    private UserService userService = new UserService();
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

            // Get all constituencies for potential assignment
            List<Constituency> constituencies = constituencyDAO.findAll();

            request.setAttribute("user", user);
            request.setAttribute("constituencies", constituencies);
            request.getRequestDispatcher("/voter/profile.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading profile: " + e.getMessage());
            request.getRequestDispatcher("/voter/profile.jsp").forward(request, response);
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

        response.sendRedirect(request.getContextPath() + "/voter/profile");
    }
}
