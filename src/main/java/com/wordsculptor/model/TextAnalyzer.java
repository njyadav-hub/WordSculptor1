package com.wordsculptor.model;

import java.util.*;
import java.util.stream.Collectors;

public class TextAnalyzer {
    private String text;

    public TextAnalyzer(String text) {
        this.text = text.toLowerCase();
    }

    // ✅ Remove stopwords
    public String removeStopwords() {
        List<String> stopwords = Arrays.asList("the", "is", "in", "at", "of", "on", "and", "a");
        return Arrays.stream(text.split("\\s+"))
                .filter(word -> !stopwords.contains(word))
                .collect(Collectors.joining(" "));
    }

    // ✅ Remove symbols
    public String removeSymbols() {
        return text.replaceAll("[^a-zA-Z0-9\\s]", "");
    }

    // ✅ Unique words
    public Set<String> getUniqueWords() {
        return new HashSet<>(Arrays.asList(text.split("\\s+")));
    }

    // ✅ Word count
    public Map<String, Integer> getWordCount() {
        Map<String, Integer> map = new HashMap<>();
        for (String word : text.split("\\s+")) {
            if (!word.isEmpty())
                map.put(word, map.getOrDefault(word, 0) + 1);
        }
        return map;
    }

    // ✅ Alphabet count
    public Map<Character, Integer> getAlphabetCount() {
        Map<Character, Integer> map = new HashMap<>();
        for (char c : text.toCharArray()) {
            if (Character.isLetter(c)) {
                map.put(c, map.getOrDefault(c, 0) + 1);
            }
        }
        return map;
    }

    // ✅ Top & Bottom words
    public Map<String, List<Map.Entry<String, Integer>>> getTopBottomWords(int n) {
        Map<String, Integer> wordCount = getWordCount();
        List<Map.Entry<String, Integer>> sorted = wordCount.entrySet().stream()
                .sorted((a, b) -> b.getValue().compareTo(a.getValue()))
                .toList();

        Map<String, List<Map.Entry<String, Integer>>> result = new HashMap<>();
        result.put("top", sorted.stream().limit(n).toList());
        result.put("bottom", sorted.stream().skip(Math.max(0, sorted.size() - n)).toList());
        return result;
    }

    // ✅ Top & Bottom alphabets
    public Map<String, List<Map.Entry<Character, Integer>>> getTopBottomAlphabets(int n) {
        Map<Character, Integer> alphaCount = getAlphabetCount();
        List<Map.Entry<Character, Integer>> sorted = alphaCount.entrySet().stream()
                .sorted((a, b) -> b.getValue().compareTo(a.getValue()))
                .toList();

        Map<String, List<Map.Entry<Character, Integer>>> result = new HashMap<>();
        result.put("top", sorted.stream().limit(n).toList());
        result.put("bottom", sorted.stream().skip(Math.max(0, sorted.size() - n)).toList());
        return result;
    }
}
