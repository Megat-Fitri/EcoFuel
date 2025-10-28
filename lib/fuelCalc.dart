import 'package:flutter/material.dart';

class FuelCalc extends StatefulWidget {
  

  @override
  State<FuelCalc> createState() => _FuelCalcState();
}

class _FuelCalcState extends State<FuelCalc> {


  TextEditingController distanceController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  double fuelPrice= 2.02;
  double? result=0;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Cost Estimator'),
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      ),
      body: Center(
        
        child: 
        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.lightGreenAccent,
          ),
          width: 350.0,
          height: 550.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Distance(km)',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: efficiencyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                 labelText: 'Car Fuel Efficiency (km/L)',
                 border: OutlineInputBorder() 
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 150,child: Text("Fuel Price (RM/L):")),
                  DropdownButton<double>(
                    value: fuelPrice,
                    items: <double>[2.02,2.17,2.52].map((double value){
                      return DropdownMenuItem<double>(
                        value: value  ,
                        child: Text("RM $value"),
                        );
                    }).toList(), 
                    onChanged: (double? newValue){
                      fuelPrice=newValue!;
                      setState(() {});
                    }
                    )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateCost,
                child: Text('Calculate Cost')
              ),
              if(errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color:  Colors.red, fontWeight: FontWeight.bold),

              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text('Trip Fuel Cost Estimation (RM) :'), 
              Container(
                padding:EdgeInsets.all(7),
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white
                ),
                child: Text('${result!.toStringAsFixed(2)}'),
                ),
                ],
              )
            ],
          ),
        ),
      ),
      
    );
  }

  void calculateCost(){
    double? distance = double.tryParse(distanceController.text);
    double? efficiency = double.tryParse(efficiencyController.text);

    if (distance ==null || efficiency == null){
      setState(() {
        errorMessage= "Please Enter A Numbers!";
        result = 0;
        
      });
      return;
    }

    if (distance <= 0 || efficiency <= 0){
      setState(() {
        errorMessage="Please Enter A Valid Number";
        result = 0;
      });
      return;
    }
    else{
      double cost = (distance/efficiency)*fuelPrice;

      setState(() {
        result = cost;
      });
    }
  }
}
