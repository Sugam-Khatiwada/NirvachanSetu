package com.nirvachansetu.controller;

import com.nirvachansetu.model.Constituency;
import com.nirvachansetu.dao.ConstituencyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * AdminConstituencyServlet handles admin operations on constituencies:
 * - View all constituencies (GET)
 * - Create a new constituency (POST)
 */
@WebServlet("/admin/constituencies")
public class AdminConstituencyServlet extends HttpServlet {

    private ConstituencyDAO constituencyDAO = new ConstituencyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Constituency> constituencies = constituencyDAO.findAll();
            request.setAttribute("constituencies", constituencies);
            request.getRequestDispatcher("/admin/constituencies.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading constituencies: " + e.getMessage());
            request.getRequestDispatcher("/admin/constituencies.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String district = request.getParameter("district");
            String province = request.getParameter("province");
            String totalVotersStr = request.getParameter("totalVoters");
            String description = request.getParameter("description");

            Constituency constituency = new Constituency();
            constituency.setName(name);
            constituency.setDistrict(district);
            constituency.setProvince(province);

            if (totalVotersStr != null && !totalVotersStr.isEmpty()) {
                constituency.setTotalVoters(Integer.parseInt(totalVotersStr));
            }

            constituency.setDescription(description);

            constituencyDAO.save(constituency);

            request.getSession().setAttribute("success", "Constituency created successfully.");

        } catch (Exception e) {
            request.getSession().setAttribute("error", "Error creating constituency: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/admin/constituencies");
    }
}
