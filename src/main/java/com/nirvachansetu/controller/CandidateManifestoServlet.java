package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * CandidateManifestoServlet handles the candidate's manifesto management:
 * - GET: Display the current manifesto
 * - POST: Update the manifesto text
 */
@WebServlet("/candidate/manifesto")
public class CandidateManifestoServlet extends HttpServlet {

    private CandidateService candidateService = new CandidateService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Find the candidate record for this user
            Candidate candidate = candidateService.findByUser(user.getId());

            String currentManifesto = null;

            if (candidate != null) {
                currentManifesto = candidate.getManifesto();
            }

            request.setAttribute("candidate", candidate);
            request.setAttribute("currentManifesto", currentManifesto);

            request.getRequestDispatcher("/candidate/manifesto.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading manifesto: " + e.getMessage());
            request.getRequestDispatcher("/candidate/manifesto.jsp").forward(request, response);
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

            String manifesto = request.getParameter("manifesto");

            if (manifesto == null || manifesto.trim().isEmpty()) {
                request.getSession().setAttribute("error", "Manifesto cannot be empty.");
                response.sendRedirect(request.getContextPath() + "/candidate/manifesto");
                return;
            }

            // Find the candidate ID
            Candidate candidate = candidateService.findByUser(user.getId());

            if (candidate != null) {
                int candidateId = candidate.getId();
                candidateService.updateManifesto(candidateId, manifesto);
                request.getSession().setAttribute("success", "Manifesto updated successfully.");
            } else {
                request.getSession().setAttribute("error",
                        "No candidate record found. Please ensure your application has been approved.");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error updating manifesto: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/candidate/manifesto");
    }
}
