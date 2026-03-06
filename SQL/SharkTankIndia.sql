-- Create table

CREATE TABLE shark_tank_india (
    episode_number INT,
    pitch_number INT,
    brand_name VARCHAR(100),
    idea TEXT,
    deal INT,
    pitcher_ask_amount DECIMAL(10,2),
    ask_equity DECIMAL(10,2),
    ask_valuation DECIMAL(12,2),
    deal_amount DECIMAL(10,2),
    deal_equity DECIMAL(10,2),
    deal_valuation DECIMAL(12,2),

    ashneer_present INT,
    anupam_present INT,
    aman_present INT,
    namita_present INT,
    vineeta_present INT,
    peyush_present INT,
    ghazal_present INT,

    ashneer_deal INT,
    anupam_deal INT,
    aman_deal INT,
    namita_deal INT,
    vineeta_deal INT,
    peyush_deal INT,
    ghazal_deal INT,

    total_sharks_invested INT,
    amount_per_shark DECIMAL(10,2),
    equity_per_shark DECIMAL(10,2)
);


-- Total Pitches

SELECT COUNT(*) AS total_pitches
FROM shark_tank_india;


-- total deals

SELECT COUNT(*) AS total_deals
FROM shark_tank_india
WHERE deal = 1;

-- Deal Success Ratio

SELECT SUM(deal) * 100.0 / COUNT(*) AS deal_success_ratio
FROM shark_tank_india;



-- Total Investment

SELECT 
SUM(deal_amount) AS total_investment
FROM shark_tank_india
WHERE deal = 1;


-- Average Deal Amount

SELECT 
AVG(deal_amount) AS avg_deal_amount
FROM shark_tank_india
WHERE deal = 1;



-- Top Funded Startups


SELECT brand_name,
SUM(deal_amount) AS investment
FROM shark_tank_india
WHERE deal = 1
GROUP BY brand_name
ORDER BY investment DESC
LIMIT 15;


-- Sharks Deals

SELECT
SUM(ashneer_deal) AS ashneer,
SUM(anupam_deal) AS anupam,
SUM(aman_deal) AS aman,
SUM(namita_deal) AS namita,
SUM(vineeta_deal) AS vineeta,
SUM(peyush_deal) AS peyush,
SUM(ghazal_deal) AS ghazal
FROM shark_tank_india;



-- Ask vs Deal Comparison

SELECT
brand_name,
pitcher_ask_amount,
deal_amount,
ask_equity,
deal_equity
FROM shark_tank_india
WHERE deal = 1;


-- Negotation on Valuation

SELECT 
AVG(ask_valuation) as ask,
AVG(deal_valuation) as deal,
((AVG(ask_valuation)-AVG(deal_valuation))/ AVG(ask_valuation))*100 as negotation_in_per
FROM shark_tank_india
WHERE deal=1;

-- MariaDB does not support median so used AVG 

