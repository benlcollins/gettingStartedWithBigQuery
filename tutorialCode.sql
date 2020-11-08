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
SELECT
  SUM(Pedestrians) AS total_pedestrians
FROM
  `start-bigquery-294922.start_bigquery.brooklyn_bridge_pedestrians`;
  

