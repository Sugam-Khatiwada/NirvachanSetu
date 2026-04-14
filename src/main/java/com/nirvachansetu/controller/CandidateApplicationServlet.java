package com.nirvachansetu.controller;

import com.nirvachansetu.model.CandidateApplication;
import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;
import com.nirvachansetu.service.CandidateService;
import com.nirvachansetu.service.ElectionService;
import com.nirvachansetu.service.UserService;
import com.nirvachansetu.dao.ConstituencyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * CandidateApplicationServlet handles the candidate application process:
 * - GET: Display the application form with available elections and constituencies
 * - POST: Submit a new candidate application
 */
@WebServlet("/candidate/application")
public class CandidateApplicationServlet extends HttpServlet {

    private CandidateService candidateService = new CandidateService();
    private ElectionService electionService = new ElectionService();
    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get available elections (those in REGISTRATION status)
            List<Election> elections = electionService.findByStatus("REGISTRATION");

            // Also include ACTIVE elections if registration is still open
            List<Election> activeElections = electionService.getActiveElections();
            if (activeElections != null) {
                elections.addAll(activeElections);
            }

            // Get all constituencies
            List<Constituency> constituencies = constituencyDAO.findAll();

            // Check if user already has an application
            List<CandidateApplication> existingApplications = candidateService.getApplicationsByUser(user.getId());

            request.setAttribute("elections", elections);
            request.setAttribute("constituencies", constituencies);
            request.setAttribute("existingApplications", existingApplications);
            request.setAttribute("user", user);

            request.getRequestDispatcher("/candidate/application.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading application form: " + e.getMessage());
            request.getRequestDispatcher("/candidate/application.jsp").forward(request, response);
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
                    "Your application has been submitted successfully! It is now pending admin approval.");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid election or constituency ID.");
        } catch (Exception e) {
            request.getSession().setAttribute("error",
                    "Error submitting application: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/candidate/dashboard");
    }
}
