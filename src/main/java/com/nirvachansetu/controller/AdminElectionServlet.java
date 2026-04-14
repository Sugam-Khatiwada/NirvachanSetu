package com.nirvachansetu.controller;

import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.dao.ConstituencyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * AdminElectionServlet handles admin operations on elections:
 * - View all elections (GET)
 * - View edit form for a specific election (GET with id param)
 * - Create or update election (POST)
 */
@WebServlet("/admin/elections")
public class AdminElectionServlet extends HttpServlet {

    private ElectionService electionService = new ElectionService();
    private CandidateService candidateService = new CandidateService();
    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Check if this is an edit request (id parameter present)
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isEmpty()) {
                int electionId = Integer.parseInt(idParam);
                Election election = electionService.findById(electionId);
                List<Election> elections = electionService.findAll();
                List<Constituency> constituencies = constituencyDAO.findAll();

                request.setAttribute("election", election);
                request.setAttribute("elections", elections);
                request.setAttribute("constituencies", constituencies);
                request.setAttribute("isEdit", true);
                request.getRequestDispatcher("/admin/elections.jsp").forward(request, response);
            } else {
                // List all elections
                List<Election> elections = electionService.findAll();
                request.setAttribute("elections", elections);
                request.getRequestDispatcher("/admin/elections.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid election ID format.");
            List<Election> elections = electionService.findAll();
            request.setAttribute("elections", elections);
            request.getRequestDispatcher("/admin/elections.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error loading elections: " + e.getMessage());
            request.getRequestDispatcher("/admin/elections.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String electionIdStr = request.getParameter("electionId");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String electionType = request.getParameter("electionType");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String status = request.getParameter("status");
            String constituencyIdStr = request.getParameter("constituencyId");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            DateTimeFormatter formatterWithSec = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
            LocalDateTime startDate = parseDateTime(startDateStr, formatter, formatterWithSec);
            LocalDateTime endDate = parseDateTime(endDateStr, formatter, formatterWithSec);

            if (electionIdStr != null && !electionIdStr.isEmpty()) {
                // Update existing election
                int electionId = Integer.parseInt(electionIdStr);
                Election election = electionService.findById(electionId);

                if (election != null) {
                    String oldStatus = election.getStatus().name();
                    election.setName(name);
                    election.setDescription(description);
                    election.setElectionType(Election.ElectionType.valueOf(electionType));
                    election.setStartDate(startDate);
                    election.setEndDate(endDate);
                    election.setStatus(Election.ElectionStatus.valueOf(status));

                    if (constituencyIdStr != null && !constituencyIdStr.isEmpty()) {
                        Constituency constituency = new Constituency();
                        constituency.setId(Integer.parseInt(constituencyIdStr));
                        election.setConstituency(constituency);
                    }

                    electionService.updateElection(election);

                    // When election changes to ACTIVE, revert all candidates back to VOTER role
                    String newStatus = status.toUpperCase();
                    if ("ACTIVE".equals(newStatus) && !"ACTIVE".equals(oldStatus)) {
                        candidateService.revertCandidatesToVoters(electionId);
                    }

                    // When election changes to COMPLETED, also revert any remaining CANDIDATE users to VOTER
                    // (safety net in case admin skipped ACTIVE or for new elections)
                    if ("COMPLETED".equals(newStatus) && !"COMPLETED".equals(oldStatus)) {
                        candidateService.revertCandidatesToVoters(electionId);
                    }

                    request.getSession().setAttribute("success", "Election updated successfully.");
                }
            } else {
                // Create new election
                Election election = new Election();
                election.setName(name);
                election.setDescription(description);
                election.setElectionType(Election.ElectionType.valueOf(electionType));
                election.setStartDate(startDate);
                election.setEndDate(endDate);
                election.setStatus(status != null ? Election.ElectionStatus.valueOf(status) : Election.ElectionStatus.DRAFT);

                if (constituencyIdStr != null && !constituencyIdStr.isEmpty()) {
                    Constituency constituency = new Constituency();
                    constituency.setId(Integer.parseInt(constituencyIdStr));
                    election.setConstituency(constituency);
                }

                electionService.createElection(election);
                request.getSession().setAttribute("success", "Election created successfully.");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error saving election: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/admin/elections");
    }

    /**
     * Parses a datetime string trying multiple formats (with and without seconds).
     */
    private LocalDateTime parseDateTime(String dateTimeStr, DateTimeFormatter... formatters) {
        if (dateTimeStr == null || dateTimeStr.isEmpty()) {
            throw new IllegalArgumentException("Date/time value is required.");
        }
        for (DateTimeFormatter formatter : formatters) {
            try {
                return LocalDateTime.parse(dateTimeStr, formatter);
            } catch (Exception ignored) {
                // Try next formatter
            }
        }
        throw new IllegalArgumentException("Invalid date/time format: " + dateTimeStr);
    }
}