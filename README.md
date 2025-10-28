# EcoFuel
301399-a251-STTGK3013-lab1
EcoFuel- Trip fuel cost estimator
Description:
A simple Flutter-based app designed to estimate the fuel cost for a trip. Users can input the distance of the trip, vehicle fuel efficiency, and fuel price to find the cost of trip fuel. The apps show features like splash scree and user-friendly interface and real-time result because of setState().

INPUT-PROCESS-OUTPUT
Input:

1.Distance(km):total trip distance entered by user

2.Fuel efficiency (km/L): Vehicle average fuel efficiency

3.Fuel Price(RM/L): select price from dropdown button

Process:
1.The app validate numeric input that user entered

2.If input valid, the formulae applied:

Fuel cost= (distance/efficiency) x Fuel Price

Output
1.Calculation result will show on the screen, formatted to two decimal places

2.Error message will shown if empty or invalid inputs entered

WIDGETS USED
Text: Displays label, headings, and result text
TextField: Accept numeric user input
DropdownButton: Select fuel price from list
ElevatedButton: Triggered cost calculation
Row/Column: organized widget vertically and horizontally
Container: Add padding, margin, border, backgroundcolor
CircularProgressIndicator: Shown on splashscreen
Scaffold/AppBar: Provide main screen structure

Basic Validation Approach
•Uses double.tryParse() to convert text input to double values.
•Prevents app crashes from empty or non-numeric inputs by showing an inline red error message instead.
•Rejects 0 or negative numbers and prompts user to “Please Enter A Valid Number”.
•Displays result as 0.00 when invalid inputs are detected.
•
Formats valid results using toStringAsFixed(2) to limit decimals to two places.
