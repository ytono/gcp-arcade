# Looker Functions and Operators
## Task 1. Pivot dimensions
Flights > Measures, click Count. Flights > Dimensions > Depart Date, click Week. Depart Date filter to: is in the year 2003
Run
Flights > Dimensions, click on the Pivot data button for Distance Tiered.
Run
Change the visualization type to Line Cart. Edit > Plot. Legend Align as Left.
# Save > As a Look.
Flight Count by Departure Week and Distance Tier

## Task 2. Reorder columns and remove fields
Flights > Measures, click Percent Cancelled. Flights > Dimensions > Depart Date, click Month Depart Date filter to: is in the year 2000.
Aircraft Origin > Dimensions, click State.
Run.
Percent Cancelled column header to reorder the percentage from high to low.
Depart Month Remove
Run.
# Save > As a Look.
Percent of Flights Cancelled by State in 2000

# Task 3. Use table calculations to calculate simple percentages
Flights Details > Measures, click Cancelled Count. Flights > Measures, click Count. Aircraft Origin > Dimensions, click State.
Flights, within the Depart Date Depart Date filter to: is in the year 2004.
Run.
click the Add Table Calculation
${flights.cancelled_count}/${flights.count}
Click Default Formatting to change the format to Percent (0).
Rename the Table Calculation to "Percent Cancelled"
Hide Cancelled Count from Visualization
hide the Count
Change visualization type to Map
# Save > As a Look.
Percent of Flights Cancelled by Aircraft Origin 2004

## Task 4. Use table calculations to calculate percentages of a total
Flights > Measures, click Total Distance Carriers > Dimensions, click Name
In the Data bar, click on the Totals checkbox next to Row Limit.
Run.
click the Add Table Calculation
${flights.total_distance}/${flights.total_distance:total}
Hide Total Distance from Visualization
Run
Change visualization type to Bar.
# Save > As a Look.
Percent of Total Distance Flown by Carrier

## Task 5. Use functions in table calculations
Flights > Measures, click Count. Flights > Dimensions, click Distance Tiered.
Under Flights, within the Depart Date dimension group, click on the Pivot data button next to the Year dimension.
Depart Date filter to: is on or after 01/01/2000. You can leave the default absolute.
Run.
Add. Select Table Calculation
(${flights.count}-pivot_offset(${flights.count}, -1))/pivot_offset(${flights.count}, -1)
Hide Count from Visualization
Run.
Change visualization type to Table.
Edit > Formatting.
Toggle the Enable Conditional Formatting to on. Accept the default options and click Add a Rule.
# Save > As a Look.
YoY Percent Change in Flights flown by Distance, 2000-Present







