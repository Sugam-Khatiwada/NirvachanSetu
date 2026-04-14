package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.VoteService;
import com.nirvachansetu.dao.CandidateDAO;
import com.nirvachansetu.dao.ConstituencyDAO;
import com.nirvachansetu.model.Constituency;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * AdminResultServlet handles viewing election results for the admin:
 * - Displays all completed elections with their vote counts and winner info
 */
@WebServlet("/admin/results")
public class AdminResultServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
    private VoteService voteService = new VoteService();
    private CandidateDAO candidateDAO = new CandidateDAO();
    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Check if a specific election is requested (from "Publish Result" link)
            String electionIdParam = request.getParameter("electionId");

            List<Election> completedElections;
            if (electionIdParam != null && !electionIdParam.isEmpty()) {
                // Show only the specific election
                int electionId = Integer.parseInt(electionIdParam);
                Election election = electionService.findById(electionId);
                completedElections = new ArrayList<>();
                if (election != null) {
                    completedElections.add(election);
                }
            } else {
                // Get all completed elections
                completedElections = electionService.findByStatus("COMPLETED");
            }

            // Build results map: election -> (list of candidates with vote info)
            Map<Election, List<Candidate>> electionResults = new LinkedHashMap<>();

            if (completedElections != null) {
                for (Election election : completedElections) {
                    // Get vote counts / results for this election
                    List<Candidate> results = voteService.getElectionResults(election.getId());
                    if (results == null) {
                        results = new ArrayList<>();
                    }
                    electionResults.put(election, results);
                }
            }

            // Get total vote counts per election
            Map<Integer, Long> voteCounts = new LinkedHashMap<>();
            if (completedElections != null) {
                for (Election election : completedElections) {
                    long count = voteService.getVoteCount(election.getId());
                    voteCounts.put(election.getId(), count);
                }
            }

            request.setAttribute("completedElections", completedElections);
            request.setAttribute("electionResults", electionResults);
            request.setAttribute("voteCounts", voteCounts);
            request.getRequestDispatcher("/admin/results.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading results: " + e.getMessage());
            request.getRequestDispatcher("/admin/results.jsp").forward(request, response);
        }
    }
}
