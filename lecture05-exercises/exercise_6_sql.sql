CREATE TABLE positive_words
AS SELECT word FROM (SELECT explode(split(line, ',')) AS word FROM positive_words_raw) w
GROUP BY word
ORDER BY word;

CREATE TABLE negative_words
AS SELECT word FROM (SELECT explode(split(line, ',')) AS word FROM negative_words_raw) w
GROUP BY word
ORDER BY word;

-- join positive_words and negative_words with word_counts

SELECT P.word, WC.count
FROM word_counts WC
JOIN positive_words P
ON (P.word = WC.word);

SELECT P.word, WC.count
FROM word_counts WC
JOIN negative_words P
ON (P.word = WC.word);