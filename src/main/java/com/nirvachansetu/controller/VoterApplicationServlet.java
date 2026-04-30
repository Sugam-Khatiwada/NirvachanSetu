package com.nirvachansetu.controller;

import com.nirvachansetu.model.CandidateApplication;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.UserService;
import com.nirvachansetu.dao.ConstituencyDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * VoterApplicationServlet allows a VOTER to apply for candidacy.
 * - GET: Display the application form with available elections and constituencies
 * - POST: Submit a new candidate application
 *
 * This uses the same logic as CandidateApplicationServlet but is accessible
 * from the voter portal. Once approved, the user's role changes from VOTER to CANDIDATE.
 */
@WebServlet("/voter/apply-candidacy")
public class VoterApplicationServlet extends HttpServlet {

    private CandidateService candidateService = new CandidateService();
    private ElectionService electionService = new ElectionService();
    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();
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

            // Get available elections (those in REGISTRATION status)
            List<Election> elections = electionService.findByStatus("REGISTRATION");

            // Get all constituencies
            List<Constituency> constituencies = constituencyDAO.findAll();

            // Check if user already has applications
            List<CandidateApplication> existingApplications = candidateService.getApplicationsByUser(user.getId());

            // Filter to only "active" applications (for elections that are NOT completed)
            // This allows users who were candidates in past completed elections to apply again
            List<CandidateApplication> activeApplications = new ArrayList<>();
            if (existingApplications != null) {
                for (CandidateApplication app : existingApplications) {
                    if (app.getElection() != null
                            && app.getElection().getStatus() != com.nirvachansetu.model.Election.ElectionStatus.COMPLETED) {
                        activeApplications.add(app);
                    }
                }
            }

            request.setAttribute("elections", elections);
            request.setAttribute("constituencies", constituencies);
            request.setAttribute("existingApplications", existingApplications);
            request.setAttribute("activeApplications", activeApplications);
            request.setAttribute("user", user);

            request.getRequestDispatcher("/voter/apply-candidancy.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading application form: " + e.getMessage());
            request.getRequestDispatcher("/voter/apply-candidancy.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User sessionUser = (User) request.getSession().getAttribute("user");

            if (sessionUser == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            String electionIdStr = request.getParameter("electionId");
            String constituencyIdStr = request.getParameter("constituencyId");
            String partyName = request.getParameter("partyName");
            String partyType = request.getParameter("partyType");
            String manifesto = request.getParameter("manifesto");
            String symbol = request.getParameter("symbol");

            // Create the candidate application
            CandidateApplication application = new CandidateApplication();

            // Set user from DB (not session, to avoid detached entity)
            User user = userService.findById(sessionUser.getId());
            application.setUser(user);

            Election election = new Election();
            election.setId(Integer.parseInt(electionIdStr));
            application.setElection(election);

            Constituency constituency = new Constituency();
            constituency.setId(Integer.parseInt(constituencyIdStr));
            application.setConstituency(constituency);

            application.setPartyName(partyName);
            application.setPartyType(CandidateApplication.PartyType.valueOf(partyType));
            application.setManifesto(manifesto);
            application.setSymbol(symbol);
            application.setStatus(CandidateApplication.ApplicationStatus.PENDING);

            // Save the application
            candidateService.applyForElection(application);

            request.getSession().setAttribute("success",
                    "Your candidacy application has been submitted successfully! It is now pending admin approval.");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid election or constituency ID.");
        } catch (Exception e) {
            request.getSession().setAttribute("error",
                    "Error submitting application: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/voter/apply-candidacy");
    }
}
