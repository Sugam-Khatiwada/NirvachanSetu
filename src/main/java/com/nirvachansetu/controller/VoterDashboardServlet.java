package com.nirvachansetu.controller;

import java.io.IOException;
import java.util.List;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.CandidateApplication;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.UserService;
import com.nirvachansetu.service.VoteService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * VoterDashboardServlet displays the voter's personalized dashboard with:
 * - Active elections in their constituency
 * - Candidates contesting in their area
 * - Voting status
 */
@WebServlet("/voter/dashboard")
public class VoterDashboardServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
    private CandidateService candidateService = new CandidateService();
    private VoteService voteService = new VoteService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User sessionUser = (User) request.getSession().getAttribute("user");

            if (sessionUser == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Reload user from DB to get fresh data
            User user = userService.findById(sessionUser.getId());
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            request.getSession().setAttribute("user", user);

            Constituency constituency = user.getConstituency();

            // Get active elections from DB
            List<Election> activeElections = electionService.getActiveElections();
            Election currentElection = null;
            List<Candidate> candidates = new java.util.ArrayList<>();
            boolean hasVoted = false;
            int totalVotersInConstituency = 0;

            if (activeElections != null && !activeElections.isEmpty()) {
                currentElection = activeElections.get(0);
                if (constituency != null) {
                    candidates = candidateService.getCompetingCandidates(currentElection.getId(), constituency.getId());
                    hasVoted = voteService.hasVoted(currentElection.getId(), user.getId());
                }
            }

            if (constituency != null) {
                totalVotersInConstituency = constituency.getTotalVoters() != null ? constituency.getTotalVoters() : 0;
            }

            // Get elections in REGISTRATION status for candidacy application
            List<Election> registrationElections = electionService.findByStatus("REGISTRATION");

            // Get user's existing candidate applications
            List<CandidateApplication> userApplications = candidateService.getApplicationsByUser(user.getId());

            // Set request attributes
            request.setAttribute("user", user);
            request.setAttribute("constituency", constituency);
            request.setAttribute("activeElections", activeElections);
            request.setAttribute("currentElection", currentElection);
            request.setAttribute("candidates", candidates);
            request.setAttribute("hasVoted", hasVoted);
            request.setAttribute("totalVotersInConstituency", totalVotersInConstituency);
            request.setAttribute("registrationElections", registrationElections);
            request.setAttribute("userApplications", userApplications);

            request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard: " + e.getMessage());
            request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);
        }
    }
}
