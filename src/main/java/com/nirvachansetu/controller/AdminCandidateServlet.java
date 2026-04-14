package com.nirvachansetu.controller;

import com.nirvachansetu.model.CandidateApplication;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.dao.CandidateApplicationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * AdminCandidateServlet handles admin operations on candidate applications:
 * - View all applications (GET)
 * - Approve/Reject applications (POST with action parameter)
 */
@WebServlet("/admin/candidates")
public class AdminCandidateServlet extends HttpServlet {

    private CandidateService candidateService = new CandidateService();
    private CandidateApplicationDAO candidateApplicationDAO = new CandidateApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<CandidateApplication> applications = candidateApplicationDAO.findAll();
            request.setAttribute("applications", applications);
            request.getRequestDispatcher("/admin/candidates.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading candidate applications: " + e.getMessage());
            request.getRequestDispatcher("/admin/candidates.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String applicationIdStr = request.getParameter("applicationId");

        try {
            if (action != null && applicationIdStr != null) {
                int applicationId = Integer.parseInt(applicationIdStr);

                switch (action) {
                    case "approve":
                        candidateService.approveApplication(applicationId);
                        request.getSession().setAttribute("success",
                                "Candidate application has been approved successfully.");
                        break;

                    case "reject":
                        candidateService.rejectApplication(applicationId);
                        request.getSession().setAttribute("success",
                                "Candidate application has been rejected.");
                        break;

                    default:
                        request.getSession().setAttribute("error", "Invalid action specified.");
                        break;
                }
            } else {
                request.getSession().setAttribute("error", "Missing action or application ID.");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid application ID format.");
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error performing action: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/admin/candidates");
    }
}
