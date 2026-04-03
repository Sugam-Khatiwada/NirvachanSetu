package com.nirvachansetu.nirvachansetu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.nirvachansetu.nirvachansetu.dao.UserDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/register")
public class RegisterServlet extends HttpServlet {

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
        boolean isCreated = userDao.createUser(username, password);

        if (isCreated) {
            response.setStatus(HttpServletResponse.SC_CREATED);
            out.print("{\"status\": \"success\", \"message\": \"User registered successfully\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            out.print("{\"status\": \"error\", \"message\": \"Username already exists\"}");
        }

        out.flush();
    }
}
