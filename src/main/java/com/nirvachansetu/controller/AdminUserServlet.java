package com.nirvachansetu.controller;

import com.nirvachansetu.model.User;
import com.nirvachansetu.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * AdminUserServlet handles admin operations on users:
 * - View all users (GET)
 * - Approve/Reject/Suspend users (POST with action parameter)
 */
@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    private UserService userService = new UserService();

    /**
     * Handles GET requests to display the list of all users.
     *
     * @param request  the HTTP request object
     * @param response the HTTP response object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<User> users = userService.findAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading users: " + e.getMessage());
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
        }
    }

    /**
     * Handles POST requests for user-related actions (approve, reject, suspend).
     *
     * @param request  the HTTP request object
     * @param response the HTTP response object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String userIdStr = request.getParameter("userId");

        try {
            if (action != null && userIdStr != null) {
                int userId = Integer.parseInt(userIdStr);

                switch (action) {
                    case "approve":
                        userService.updateStatus(userId, "APPROVED");
                        request.getSession().setAttribute("success", "User has been approved successfully.");
                        break;

                    case "reject":
                        userService.updateStatus(userId, "REJECTED");
                        request.getSession().setAttribute("success", "User has been rejected.");
                        break;

                    case "suspend":
                        userService.updateStatus(userId, "SUSPENDED");
                        request.getSession().setAttribute("success", "User has been suspended.");
                        break;

                    default:
                        request.getSession().setAttribute("error", "Invalid action specified.");
                        break;
                }
            } else {
                request.getSession().setAttribute("error", "Missing action or user ID.");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid user ID format.");
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error performing action: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
