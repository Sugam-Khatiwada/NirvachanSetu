package com.nirvachansetu.controller;

import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.UserService;
import com.nirvachansetu.service.VoteService;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * AdminDashboardServlet handles the admin dashboard view,
 * displaying key statistics about the election system.
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private UserService userService = new UserService();
    private ElectionService electionService = new ElectionService();
    private CandidateService candidateService = new CandidateService();
    private VoteService voteService = new VoteService();

    /**
     * Handles GET requests to display the admin dashboard.
     * Loads statistics such as total users, active elections, and pending approvals.
     * 
     * @param request  the HTTP servlet request
     * @param response the HTTP servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Reload user from DB to avoid detached entity issues
            User sessionUser = (User) request.getSession().getAttribute("user");
            if (sessionUser != null) {
                User freshUser = userService.findById(sessionUser.getId());
                if (freshUser != null) {
                    request.getSession().setAttribute("user", freshUser);
                }
            }

            // Total registered users
            long totalUsers = userService.countAll();

            // Active elections
            List<Election> activeElections = electionService.getActiveElections();
            int activeElectionCount = activeElections != null ? activeElections.size() : 0;

            // All elections (for the table)
            List<Election> allElections = electionService.findAll();

            // Total candidates
            long totalCandidates = candidateService.countAllCandidates();

            // Total votes cast
            long totalVotes = 0;

            // Total elections
            long totalElections = electionService.countAll();

            // Pending user approvals
            long pendingApprovals = userService.countByStatus("PENDING");

            // Set request attributes for the dashboard
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("activeElections", activeElections);
            request.setAttribute("activeElectionCount", activeElectionCount);
            request.setAttribute("elections", allElections);
            request.setAttribute("totalElections", totalElections);
            request.setAttribute("totalCandidates", totalCandidates);
            request.setAttribute("totalVotes", totalVotes);
            request.setAttribute("pendingApprovals", pendingApprovals);

            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard: " + e.getMessage());
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        }
    }
}
