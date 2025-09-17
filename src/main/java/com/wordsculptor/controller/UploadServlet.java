package com.wordsculptor.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.*;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("file");
        InputStream inputStream = filePart.getInputStream();
        String content = new String(inputStream.readAllBytes());

        // ✅ Save uploaded text in session
        HttpSession session = request.getSession();
        session.setAttribute("uploadedText", content);

        // Forward to analyze page
        request.setAttribute("msg", "✅ File uploaded successfully! Now choose operations.");
        request.getRequestDispatcher("analyze.jsp").forward(request, response);
    }
}
