# Telemtry.list to MoveStack

MoveApps

Github repository: https://github.com/movestore/telemetry2moveStack

## Description
Transformation of data in class Telemetry.list to class MoveStack 

## Documentation
Most information contained in the telemetry objects will be lost during this transformation, only coordinates, time and individual ID will be maintained. The data can be translated keeping the current projection, or projecting it into a geographic coordinate system. For other projections the App "Change Projection" can be used subsequently.

### Input data
Telemetry.list

### Output data
MoveStack

### Artefacts
no artefacts

### Parameters 
`Projection`: options are the to keep the `current projection`, or to `project to geographic coordinate system`. Telemetry.list objects are mostly in a *Two-Point Equidistant* projection, whereas MoveStacks, specially those created from Movebank data are in a *geographic coordinate system* (longitude/latitude in decimal degrees).

### Null or error handling
**Data**: if the input data is empty, the output will also empty 
