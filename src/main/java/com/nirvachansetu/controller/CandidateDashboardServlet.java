package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.CandidateApplication;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * CandidateDashboardServlet displays the candidate's personalized dashboard with:
 * - Their application status
 * - Election information
 * - Competing candidates
 * - Vote count received
 */
@WebServlet("/candidate/dashboard")
public class CandidateDashboardServlet extends HttpServlet {

    private CandidateService candidateService = new CandidateService();
    private ElectionService electionService = new ElectionService();

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

            CandidateApplication application = null;
            Election election = null;
            Constituency constituency = null;
            List<Candidate> competingCandidates = null;
            int totalVotes = 0;
            int votePercentage = 0;

            if (candidate != null) {
                application = candidate.getApplication();
                election = candidate.getElection();
                constituency = candidate.getConstituency();
                totalVotes = candidate.getTotalVotes() != null ? candidate.getTotalVotes() : 0;

                // Get competing candidates (other candidates in the same election and constituency)
                if (election != null && constituency != null) {
                    competingCandidates = candidateService.getCompetingCandidates(
                            election.getId(), constituency.getId());

                    // Calculate vote percentage for current candidate
                    if (competingCandidates != null && !competingCandidates.isEmpty()) {
                        long allVotes = 0;
                        for (Candidate c : competingCandidates) {
                            allVotes += (c.getTotalVotes() != null ? c.getTotalVotes() : 0);
                        }
                        // Include current candidate's votes in total
                        allVotes += totalVotes;
                        if (allVotes > 0) {
                            votePercentage = (int) Math.round((double) totalVotes / allVotes * 100);
                        }
                    }
                }
            }

            // Set request attributes
            request.setAttribute("user", user);
            request.setAttribute("candidate", candidate);
            request.setAttribute("application", application);
            request.setAttribute("election", election);
            request.setAttribute("constituency", constituency);
            request.setAttribute("competingCandidates", competingCandidates);
            request.setAttribute("totalVotes", totalVotes);
            request.setAttribute("votePercentage", votePercentage);

            request.getRequestDispatcher("/candidate/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard: " + e.getMessage());
            request.getRequestDispatcher("/candidate/dashboard.jsp").forward(request, response);
        }
    }
}
