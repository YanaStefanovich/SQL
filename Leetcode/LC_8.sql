-- Task: Capital Gain/Loss
-- Write a solution to report the Capital gain/loss for each stock. The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS (
    SELECT stock_name, operation, SUM(price)
    FROM Stocks
    GROUP BY 1,2
),
buy_tx AS
(
    SELECT stock_name, SUM(price) as bs
    FROM Stocks
    WHERE operation = 'Buy'
    GROUP BY 1
),
sell AS
(
    SELECT stock_name, SUM(price) as ss
    FROM Stocks
    WHERE operation = 'Sell'
    GROUP BY 1
)
SELECT DISTINCT stock_name, sell.ss - buy_tx.bs  as capital_gain_loss
FROM
    a
    LEFT JOIN sell USING(stock_name)
    JOIN buy_tx USING(stock_name)
