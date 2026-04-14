package com.nirvachansetu.controller;

import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.VoteService;
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
 * VoterResultServlet displays election results for the voter:
 * - Shows completed elections with candidate vote counts
 */
@WebServlet("/voter/results")
public class VoterResultServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
    private VoteService voteService = new VoteService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get completed elections
            List<Election> completedElections = electionService.findByStatus("COMPLETED");

            // Build results map: election -> list of candidates with results
            Map<Election, List<Candidate>> electionResults = new LinkedHashMap<>();

            // Build vote count map: electionId -> total votes
            Map<Integer, Long> voteCounts = new LinkedHashMap<>();

            if (completedElections != null) {
                for (Election election : completedElections) {
                    try {
                        List<Candidate> results = voteService.getElectionResults(election.getId());
                        if (results == null) {
                            results = new ArrayList<>();
                        }
                        electionResults.put(election, results);

                        long count = voteService.getVoteCount(election.getId());
                        voteCounts.put(election.getId(), count);
                    } catch (Exception e) {
                        electionResults.put(election, new ArrayList<>());
                        voteCounts.put(election.getId(), 0L);
                    }
                }
            }

            request.setAttribute("completedElections", completedElections);
            request.setAttribute("electionResults", electionResults);
            request.setAttribute("voteCounts", voteCounts);
            request.getRequestDispatcher("/voter/results.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading results: " + e.getMessage());
            request.getRequestDispatcher("/voter/results.jsp").forward(request, response);
        }
    }
}
