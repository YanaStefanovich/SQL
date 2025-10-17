-- Task: Tree Node
-- For each node in the tree, determine its type:Root – no parent, Leaf – no children, Inner – has both parent and child. Return a table with each node and its type (order doesn’t matter).
-- Source: Leetcode
-- Difficulty: Medium

SELECT id,
    CASE
        WHEN p_id IS NULL  THEN 'Root'
        WHEN p_id IS NOT NULL AND id IN (SELECT p_id FROM Tree) THEN 'Inner'
        ELSE 'Leaf'
        END AS type
FROM Tree