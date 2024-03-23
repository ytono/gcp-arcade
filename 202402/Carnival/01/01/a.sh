#! /usr/bin/bash
# Predict Taxi Fare with a BigQuery ML Forecasting Model

read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth login ${ACCOUNT} --project ${PROJECT}
fi

## Task 1. Explore NYC taxi cab data

bq query --use_legacy_sql=false \
'#standardSQL
SELECT
  TIMESTAMP_TRUNC(pickup_datetime,
    MONTH) month,
  COUNT(*) trips
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2015`
GROUP BY
  1
ORDER BY
  1'

bq query --use_legacy_sql=false \
'#standardSQL
SELECT
  EXTRACT(HOUR
  FROM
    pickup_datetime) hour,
  ROUND(AVG(trip_distance / TIMESTAMP_DIFF(dropoff_datetime,
        pickup_datetime,
        SECOND))*3600, 1) speed
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE
  trip_distance > 0
  AND fare_amount/trip_distance BETWEEN 2
  AND 10
  AND dropoff_datetime > pickup_datetime
GROUP BY
  1
ORDER BY
  1'

## Task 2. Identify an objective

## Task 3. Select features and create your training dataset
bq query --use_legacy_sql=false \
'#standardSQL
WITH params AS (
    SELECT
    1 AS TRAIN,
    2 AS EVAL
    ),

  daynames AS
    (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

  taxitrips AS (
  SELECT
    (tolls_amount + fare_amount) AS total_fare,
    daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
    EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
    pickup_longitude AS pickuplon,
    pickup_latitude AS pickuplat,
    dropoff_longitude AS dropofflon,
    dropoff_latitude AS dropofflat,
    passenger_count AS passengers
  FROM
    `nyc-tlc.yellow.trips`, daynames, params
  WHERE
    trip_distance > 0 AND fare_amount > 0
    AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.TRAIN
  )

  SELECT *
  FROM taxitrips'

## Task 4. Create a BigQuery dataset to store models
bq mk --location=us --dataset taxi 

## Task 5. Select a BigQuery ML model type and specify options
### Which model type should you choose for predicting taxi cab fare (numeric value)?
### ***Linear Regression***
bq query --use_legacy_sql=false \
'CREATE or REPLACE MODEL taxi.taxifare_model
OPTIONS
  (model_type="linear_reg", labels=["total_fare"]) AS

WITH params AS (
    SELECT
    1 AS TRAIN,
    2 AS EVAL
    ),

  daynames AS
    (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

  taxitrips AS (
  SELECT
    (tolls_amount + fare_amount) AS total_fare,
    daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
    EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
    pickup_longitude AS pickuplon,
    pickup_latitude AS pickuplat,
    dropoff_longitude AS dropofflon,
    dropoff_latitude AS dropofflat,
    passenger_count AS passengers
  FROM
    `nyc-tlc.yellow.trips`, daynames, params
  WHERE
    trip_distance > 0 AND fare_amount > 0
    AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.TRAIN
  )

  SELECT *
  FROM taxitrips'


## Task 6. Evaluate classification model performance
bq query --use_legacy_sql=false \
'#standardSQL
SELECT
  SQRT(mean_squared_error) AS rmse
FROM
  ML.EVALUATE(MODEL taxi.taxifare_model,
  (

  WITH params AS (
    SELECT
    1 AS TRAIN,
    2 AS EVAL
    ),

  daynames AS
    (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

  taxitrips AS (
  SELECT
    (tolls_amount + fare_amount) AS total_fare,
    daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
    EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
    pickup_longitude AS pickuplon,
    pickup_latitude AS pickuplat,
    dropoff_longitude AS dropofflon,
    dropoff_latitude AS dropofflat,
    passenger_count AS passengers
  FROM
    `nyc-tlc.yellow.trips`, daynames, params
  WHERE
    trip_distance > 0 AND fare_amount > 0
    AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.EVAL
  )

  SELECT *
  FROM taxitrips

  ))'

## Task 7. Predict taxi fare amount
bq query --use_legacy_sql=false \
'#standardSQL
SELECT
*
FROM
  ml.PREDICT(MODEL `taxi.taxifare_model`,
   (

 WITH params AS (
    SELECT
    1 AS TRAIN,
    2 AS EVAL
    ),

  daynames AS
    (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

  taxitrips AS (
  SELECT
    (tolls_amount + fare_amount) AS total_fare,
    daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
    EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
    pickup_longitude AS pickuplon,
    pickup_latitude AS pickuplat,
    dropoff_longitude AS dropofflon,
    dropoff_latitude AS dropofflat,
    passenger_count AS passengers
  FROM
    `nyc-tlc.yellow.trips`, daynames, params
  WHERE
    trip_distance > 0 AND fare_amount > 0
    AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.EVAL
  )

  SELECT *
  FROM taxitrips

));'

## Task 8. Improving the model with Feature Engineering
# bq query --use_legacy_sql=false \
# 'SELECT
#   COUNT(fare_amount) AS num_fares,
#   MIN(fare_amount) AS low_fare,
#   MAX(fare_amount) AS high_fare,
#   AVG(fare_amount) AS avg_fare,
#   STDDEV(fare_amount) AS stddev
# FROM
# `nyc-tlc.yellow.trips`
# # 1,108,779,463 fares'

# bq query --use_legacy_sql=false \
# 'SELECT
#   COUNT(fare_amount) AS num_fares,
#   MIN(fare_amount) AS low_fare,
#   MAX(fare_amount) AS high_fare,
#   AVG(fare_amount) AS avg_fare,
#   STDDEV(fare_amount) AS stddev
# FROM
# `nyc-tlc.yellow.trips`
# WHERE trip_distance > 0 AND fare_amount BETWEEN 6 and 200
# # 843,834,902 fares'

# bq query --use_legacy_sql=false \
# 'SELECT
#   COUNT(fare_amount) AS num_fares,
#   MIN(fare_amount) AS low_fare,
#   MAX(fare_amount) AS high_fare,
#   AVG(fare_amount) AS avg_fare,
#   STDDEV(fare_amount) AS stddev
# FROM
# `nyc-tlc.yellow.trips`
# WHERE trip_distance > 0 AND fare_amount BETWEEN 6 and 200
#     AND pickup_longitude > -75 #limiting of the distance the taxis travel out
#     AND pickup_longitude < -73
#     AND dropoff_longitude > -75
#     AND dropoff_longitude < -73
#     AND pickup_latitude > 40
#     AND pickup_latitude < 42
#     AND dropoff_latitude > 40
#     AND dropoff_latitude < 42
#     # 827,365,869 fares'

# bq query --use_legacy_sql=false \
# 'CREATE OR REPLACE MODEL taxi.taxifare_model_2
# OPTIONS
#   (model_type="linear_reg", labels=["total_fare"]) AS


# WITH params AS (
#     SELECT
#     1 AS TRAIN,
#     2 AS EVAL
#     ),

#   daynames AS
#     (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

#   taxitrips AS (
#   SELECT
#     (tolls_amount + fare_amount) AS total_fare,
#     daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
#     EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
#     SQRT(POW((pickup_longitude - dropoff_longitude),2) + POW(( pickup_latitude - dropoff_latitude), 2)) as dist, #Euclidean distance between pickup and drop off
#     SQRT(POW((pickup_longitude - dropoff_longitude),2)) as longitude, #Euclidean distance between pickup and drop off in longitude
#     SQRT(POW((pickup_latitude - dropoff_latitude), 2)) as latitude, #Euclidean distance between pickup and drop off in latitude
#     passenger_count AS passengers
#   FROM
#     `nyc-tlc.yellow.trips`, daynames, params
# WHERE trip_distance > 0 AND fare_amount BETWEEN 6 and 200
#     AND pickup_longitude > -75 #limiting of the distance the taxis travel out
#     AND pickup_longitude < -73
#     AND dropoff_longitude > -75
#     AND dropoff_longitude < -73
#     AND pickup_latitude > 40
#     AND pickup_latitude < 42
#     AND dropoff_latitude > 40
#     AND dropoff_latitude < 42
#     AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.TRAIN
#   )

#   SELECT *
#   FROM taxitrips'

# bq query --use_legacy_sql=false \
# 'SELECT
#   SQRT(mean_squared_error) AS rmse
# FROM
#   ML.EVALUATE(MODEL taxi.taxifare_model_2,
#   (

#   WITH params AS (
#     SELECT
#     1 AS TRAIN,
#     2 AS EVAL
#     ),

#   daynames AS
#     (SELECT ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"] AS daysofweek),

#   taxitrips AS (
#   SELECT
#     (tolls_amount + fare_amount) AS total_fare,
#     daysofweek[ORDINAL(EXTRACT(DAYOFWEEK FROM pickup_datetime))] AS dayofweek,
#     EXTRACT(HOUR FROM pickup_datetime) AS hourofday,
#     SQRT(POW((pickup_longitude - dropoff_longitude),2) + POW(( pickup_latitude - dropoff_latitude), 2)) as dist, #Euclidean distance between pickup and drop off
#     SQRT(POW((pickup_longitude - dropoff_longitude),2)) as longitude, #Euclidean distance between pickup and drop off in longitude
#     SQRT(POW((pickup_latitude - dropoff_latitude), 2)) as latitude, #Euclidean distance between pickup and drop off in latitude
#     passenger_count AS passengers
#   FROM
#     `nyc-tlc.yellow.trips`, daynames, params
# WHERE trip_distance > 0 AND fare_amount BETWEEN 6 and 200
#     AND pickup_longitude > -75 #limiting of the distance the taxis travel out
#     AND pickup_longitude < -73
#     AND dropoff_longitude > -75
#     AND dropoff_longitude < -73
#     AND pickup_latitude > 40
#     AND pickup_latitude < 42
#     AND dropoff_latitude > 40
#     AND dropoff_latitude < 42
#     AND MOD(ABS(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING))),1000) = params.EVAL
#   )

#   SELECT *
#   FROM taxitrips

#   ))'

## Task 9. Test your understanding
### A lower RMSE value usually indicates a more accurate BQML model.
### *** True ***

## Task 10. Other datasets to explore

gcloud auth revoke $ACCOUNT