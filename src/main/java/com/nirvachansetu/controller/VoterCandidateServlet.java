package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.ElectionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * VoterCandidateServlet displays the list of candidates
 * contesting in the voter's constituency for a specific election.
 */
@WebServlet("/voter/candidates")
public class VoterCandidateServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
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

            Constituency constituency = user.getConstituency();

            if (constituency == null) {
                request.setAttribute("error",
                        "You are not assigned to any constituency. Please contact the administrator.");
                request.getRequestDispatcher("/voter/candidates.jsp").forward(request, response);
                return;
            }

            // Get election ID from parameter, or fall back to first active election
            String electionIdParam = request.getParameter("electionId");
            int electionId;

            if (electionIdParam != null && !electionIdParam.isEmpty()) {
                electionId = Integer.parseInt(electionIdParam);
            } else {
                // Use the first active election
                List<Election> activeElections = electionService.getActiveElections();
                if (activeElections == null || activeElections.isEmpty()) {
                    request.setAttribute("error", "No active elections available at this time.");
                    request.getRequestDispatcher("/voter/candidates.jsp").forward(request, response);
                    return;
                }
                electionId = activeElections.get(0).getId();
            }

            // Get the election details
            Election election = electionService.findById(electionId);

            // Get competing candidates for this election and constituency
            List<Candidate> candidates = candidateService.getCompetingCandidates(electionId, constituency.getId());

            // Get all active elections for navigation
            List<Election> activeElections = electionService.getActiveElections();

            request.setAttribute("election", election);
            request.setAttribute("candidates", candidates);
            request.setAttribute("activeElections", activeElections);
            request.setAttribute("constituency", constituency);

            request.getRequestDispatcher("/voter/candidates.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid election ID.");
            request.getRequestDispatcher("/voter/candidates.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error loading candidates: " + e.getMessage());
            request.getRequestDispatcher("/voter/candidates.jsp").forward(request, response);
        }
    }
}
