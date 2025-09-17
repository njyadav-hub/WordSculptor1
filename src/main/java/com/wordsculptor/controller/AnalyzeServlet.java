package com.wordsculptor.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wordsculptor.model.TextAnalyzer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/AnalyzeServlet")
public class AnalyzeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Uploaded text fetch
        String text = (String) request.getSession().getAttribute("uploadedText");
        if (text == null || text.isEmpty()) {
            request.setAttribute("error", "❌ No text found for analysis. Please upload a file first.");
            request.getRequestDispatcher("analyze.jsp").forward(request, response);
            return;
        }

        // User selected operations
        String[] operations = request.getParameterValues("operations");
        if (operations == null || operations.length == 0) {
            request.setAttribute("error", "⚠️ Please select at least one operation.");
            request.getRequestDispatcher("analyze.jsp").forward(request, response);
            return;
        }

        TextAnalyzer analyzer = new TextAnalyzer(text);
        Map<String, Object> results = new LinkedHashMap<>();
        List<String> opsList = Arrays.asList(operations);

        // ✅ Remove Stopwords
        if (opsList.contains("removeStopwords")) {
            String cleanedText = analyzer.removeStopwords();
            results.put("Text after removing stopwords", cleanedText);
            analyzer = new TextAnalyzer(cleanedText); // update analyzer with new text
        }

        // ✅ Remove Symbols
        if (opsList.contains("removeSymbols")) {
            String cleanedText = analyzer.removeSymbols();
            results.put("Text after removing symbols", cleanedText);
            analyzer = new TextAnalyzer(cleanedText);
        }

        // ✅ Unique Words
        if (opsList.contains("uniqueWords")) {
            Set<String> uniqueWords = analyzer.getUniqueWords();
            results.put("Unique Words", uniqueWords);
            results.put("Unique Word Count", uniqueWords.size());
        }

        // ✅ Word Count
        if (opsList.contains("wordCount")) {
            results.put("Word Count", analyzer.getWordCount());
        }

        // ✅ Alphabet Count
        if (opsList.contains("alphabetCount")) {
            results.put("Alphabet Count", analyzer.getAlphabetCount());
        }

        // ✅ Top & Bottom N items
        if (opsList.contains("topBottom")) {
            Map<String, List<Map.Entry<String, Integer>>> topBottomWords = analyzer.getTopBottomWords(10);
            Map<String, List<Map.Entry<Character, Integer>>> topBottomAlphabets = analyzer.getTopBottomAlphabets(10);

            results.put("Top 10 Words", topBottomWords.get("top"));
            results.put("Bottom 10 Words", topBottomWords.get("bottom"));
            results.put("Top 10 Alphabets", topBottomAlphabets.get("top"));
            results.put("Bottom 10 Alphabets", topBottomAlphabets.get("bottom"));
        }

        // ✅ Send results to JSP
        request.setAttribute("results", results);
        request.getRequestDispatcher("results.jsp").forward(request, response);
    }
}
