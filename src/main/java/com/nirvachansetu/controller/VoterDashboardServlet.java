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
            // Reload user from DB to avoid detached entity issues
            User sessionUser = (User) request.getSession().getAttribute("user");

            if (sessionUser == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // ==============================================
            // BYPASS DB CHECK AND MOCK DATA FOR UI TESTING
            // ==============================================
            // Use the simulated user from session (injected by AuthFilter)
            User user = sessionUser; 
            request.getSession().setAttribute("user", user);

            Constituency constituency = user.getConstituency();

            // MOCK: Active elections
            List<Election> activeElections = new java.util.ArrayList<>();
            Election mockElection = new Election();
            mockElection.setId(1);
            mockElection.setName("2026 General Assembly Elections");
            mockElection.setStartDate(java.time.LocalDateTime.now().plusDays(14));
            activeElections.add(mockElection);

            Election currentElection = activeElections.get(0);
            boolean hasVoted = false;
            
            // MOCK: Candidates
            List<Candidate> candidates = new java.util.ArrayList<>();
            
            User candUser1 = new User();
            candUser1.setFullName("Vikram Aditya");
            Candidate cand1 = new Candidate();
            cand1.setId(101);
            cand1.setUser(candUser1);
            cand1.setPartyType(CandidateApplication.PartyType.NATIONAL);
            cand1.setPartyName("National Party");
            cand1.setSymbol("Sun");
            cand1.setManifesto("Infrastructure & Progress");
            candidates.add(cand1);

            User candUser2 = new User();
            candUser2.setFullName("Prakash Hegde");
            Candidate cand2 = new Candidate();
            cand2.setId(102);
            cand2.setUser(candUser2);
            cand2.setPartyType(CandidateApplication.PartyType.INDEPENDENT);
            cand2.setPartyName("Independent");
            cand2.setSymbol("Bicycle");
            cand2.setManifesto("Civic Activism");
            candidates.add(cand2);
            
            User candUser3 = new User();
            candUser3.setFullName("Savitri Devi");
            Candidate cand3 = new Candidate();
            cand3.setId(103);
            cand3.setUser(candUser3);
            cand3.setPartyType(CandidateApplication.PartyType.REGIONAL);
            cand3.setPartyName("Regional Alliance");
            cand3.setSymbol("Tree");
            cand3.setManifesto("Public Health & Education");
            candidates.add(cand3);

            int totalVotersInConstituency = constituency != null && constituency.getTotalVoters() != null ? constituency.getTotalVoters() : 1200000;

            // MOCK: empty registration
            List<Election> registrationElections = new java.util.ArrayList<>();
            List<CandidateApplication> userApplications = new java.util.ArrayList<>();

            /* // --> COMMENTED OUT ACTUAL DATABASE LOGIC <--
            User dbUser = userService.findById(sessionUser.getId());
            if (dbUser == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            activeElections = electionService.getActiveElections();
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
            registrationElections = electionService.findByStatus("REGISTRATION");
            userApplications = candidateService.getApplicationsByUser(user.getId());
            */
            // ==============================================

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
