# Embedding Maps in Looker BI

## Task 1 - Create Looks with Map based visualizations
### Look #1- Choropleth Map: Plot carriers operating count by state on Maps
#### Looker Navigation menu, click Explore.
FAA > Flights

Carriers > Measures, click Count
Aircraft Origin > Dimensions, select State

Run

### Visualization 
Go to the value tab. Toggle the reverse color scale
### save as a new dashboard.
Carriers count against states

### Look #2 - Map with Lines: Count of Flights connecting a state
Main menu, enable Development Mode.
<!-- Go to LookML.

File Browser > qwiklabs-flights-maps.model.lkml -->


#### Looker Navigation menu, click Explore
FAA > Flights
Flights > Measures, click Count
Aircraft Origin > Dimensions, select Map Location
Aircraft Destination > Dimensions, select Map Location

Aircraft Origin > Dimensions > City   Filter by Field as is equal to
ATLANTA

Flights Details > Dimensions > Arrival Date > Year Filter by Field  in the year
2004

Aircraft Destination > Dimensions > State Filter by Field is equal to
CA,WA,CO,NV,UT,AK,HI,OR,LA,ID,WY

Run

Map option on the visualization
Click on the edit option. Go to the Plot tab. Check the connect with lines option.
Connect with Lines

go to the Points tab. Select Type as Icon 
Airplane

### save as a new dashboard.
Delayed flights count originating from Atlanta, GA

## Task 2 - Create Looks with Custom Map Layer based visualizations
### Looker Navigation menu, click Explore
FAA, click Flights
Go to LookML

Save qwiklabs-flights-maps.model

Save aircraft.view

###
FAA, click Flights
Aircraft > Dimensions, select Region

Aircraft > Measures, select Count

Run

### save as a new dashboard.
Airport counts for West and Midwest regions in US