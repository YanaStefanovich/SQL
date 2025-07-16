-- Task: Number of Shipments Per Month
# Count unique shipments per month (shipment = shipment_id + sub_id).Output: year_month (format YYYY-MM) and shipment count.
-- Source: StrataScratch
-- Difficulty: Easy

select count(shipment_id),DATE_FORMAT(shipment_date, '%Y-%m') as date_ym
FROM amazon_shipment
GROUP BY date_ym