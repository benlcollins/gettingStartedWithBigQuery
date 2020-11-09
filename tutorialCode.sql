/* 
 * Beyond Sheets: Getting Started With Google BigQuery
 * Tutorial by Ben Collins
 * November 2020
 * 
 * Read more: https://www.benlcollins.com/bigquery/getting-started-with-google-bigquery/
 *
 */

-- first query
SELECT
  *
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
LIMIT
  10;

-- select specific columns
SELECT
  hour_beginning,
  location,
  Pedestrians,
  weather_summary
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
LIMIT
  10;
  
-- math operations
-- calculates total number of pedestrian crossings in dataset
SELECT
  SUM(Pedestrians) AS total_pedestrians
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`;

  -- WHERE clause to filter rows
SELECT
  *
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
WHERE
  weather_summary = 'snow' OR weather_summary = 'sleet';
  
-- group by dates
SELECT
  EXTRACT(DATE FROM hour_beginning) AS bb_date,
  SUM(Pedestrians) AS bb_pedestrians
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
GROUP BY 
  bb_date;

--filtering aggregate data with HAVING clause
SELECT
  EXTRACT(DATE FROM hour_beginning) AS bb_date,
  SUM(Pedestrians) AS bb_pedestrians
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
GROUP BY 
  bb_date
HAVING 
  bb_date < '2017-11-01';

-- JOIN with bike data table
WITH pedestrian_table AS (
  SELECT
    EXTRACT(DATE FROM hour_beginning) AS bb_date,
    SUM(Pedestrians) AS bb_pedestrians
  FROM
    `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`
  GROUP BY 
    bb_date
  HAVING 
    bb_date < '2017-11-01'
)
SELECT 
  pedestrian_table.bb_date,
  pedestrian_table.bb_pedestrians,
  bike_table.Brooklyn_Bridge AS bb_bikes
FROM
  pedestrian_table
JOIN 
  `start-bigquery-294922.start_bigquery.nyc_bridges_bikes` AS bike_table
ON 
  pedestrian_table.bb_date = bike_table.Date; 