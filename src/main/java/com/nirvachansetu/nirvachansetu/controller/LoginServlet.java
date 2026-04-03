package com.nirvachansetu.nirvachansetu.controller;

import com.nirvachansetu.nirvachansetu.dao.UserDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/api/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Basic validation
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"status\": \"error\", \"message\": \"Username and password are required\"}");
            out.flush();
            return;
        }

        UserDao userDao = new UserDao();
        boolean isValid = userDao.validateUser(username, password);

        if (isValid) {
            response.setStatus(HttpServletResponse.SC_OK);
            out.print("{\"status\": \"success\", \"message\": \"Login successful\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print("{\"status\": \"error\", \"message\": \"Invalid credentials\"}");
        }

        out.flush();
    }
}
