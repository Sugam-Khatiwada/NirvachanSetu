package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.VoteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * VoterVoteServlet handles the vote casting process:
 * - GET: Display the voting page with candidates in voter's constituency
 * - POST: Process the vote submission
 */
@WebServlet("/voter/cast-vote")
public class VoterVoteServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
    private CandidateService candidateService = new CandidateService();
    private VoteService voteService = new VoteService();

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
                request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);
                return;
            }

            // Get active elections
            List<Election> activeElections = electionService.getActiveElections();

            if (activeElections == null || activeElections.isEmpty()) {
                request.setAttribute("error", "No active elections available for voting at this time.");
                request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);
                return;
            }

            // Use the first active election
            Election election = activeElections.get(0);

            // Check if the user has already voted in this election
            boolean hasVoted = voteService.hasVoted(election.getId(), user.getId());

            if (hasVoted) {
                request.setAttribute("message", "You have already cast your vote in this election.");
                request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);
                return;
            }

            // Get competing candidates in the voter's constituency
            List<Candidate> candidates = candidateService.getCompetingCandidates(
                    election.getId(), constituency.getId());

            request.setAttribute("election", election);
            request.setAttribute("candidates", candidates);
            request.setAttribute("constituency", constituency);

            request.getRequestDispatcher("/voter/cast-vote.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading voting page: " + e.getMessage());
            request.getRequestDispatcher("/voter/dashboard.jsp").forward(request, response);
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

            String candidateIdStr = request.getParameter("candidateId");
            String electionIdStr = request.getParameter("electionId");

            if (candidateIdStr == null || candidateIdStr.isEmpty()) {
                request.getSession().setAttribute("error", "Please select a candidate to vote for.");
                response.sendRedirect(request.getContextPath() + "/voter/cast-vote");
                return;
            }

            int candidateId = Integer.parseInt(candidateIdStr);
            int electionId = Integer.parseInt(electionIdStr);

            // Check if already voted
            if (voteService.hasVoted(electionId, user.getId())) {
                request.getSession().setAttribute("error",
                        "You have already cast your vote in this election.");
                response.sendRedirect(request.getContextPath() + "/voter/dashboard");
                return;
            }

            // Cast the vote using service method with individual IDs
            Constituency constituency = user.getConstituency();

            voteService.castVote(electionId, candidateId,
                    constituency.getId(), user.getId());

            request.getSession().setAttribute("success",
                    "Your vote has been cast successfully! Thank you for participating in the democratic process.");
            response.sendRedirect(request.getContextPath() + "/voter/dashboard");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid candidate or election ID.");
            response.sendRedirect(request.getContextPath() + "/voter/cast-vote");
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error casting vote: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/voter/cast-vote");
        }
    }
}
