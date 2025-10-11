-- Task: DNA Pattern Recognition
-- Find each sample_id whose DNA sequence: starts with ATG, ends with TAA, TAG, or TGA, contains ATAT and has three+ consecutive Gs. Return results ordered by sample_id.
-- Source: Leetcode
-- Difficulty: Medium

SELECT sample_id,
   dna_sequence,
   species,
   IF(dna_sequence LIKE 'ATG%', 1, 0) AS has_start ,
   IF(dna_sequence LIKE '%TAA' OR dna_sequence LIKE '%TAG' OR dna_sequence LIKE '%TGA', 1, 0) AS has_stop,
   IF(dna_sequence LIKE '%ATAT%', 1, 0) AS has_atat,
   IF(dna_sequence LIKE '%GGG%', 1, 0) AS has_ggg
FROM Samples
ORDER BY 1