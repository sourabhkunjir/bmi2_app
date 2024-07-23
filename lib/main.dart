import 'package:flutter/material.dart';

void main() {
  runApp(BMIapp());
}

class BMIapp extends StatelessWidget {
  const BMIapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable initialize
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI app",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your BMI calculator !",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your weight(Kg) : "),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your height(feet) : "),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: inController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your height(inch) : "),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //string to int conversion
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          // Bmi unit --> kg/m^2
                          // ft+inch --> m conversion
                          // t=total & i= int
                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iWt / (tM * tM);

                          //bgcolor change
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are overweight";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You're underweight";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You're Healthy !";
                            bgColor = Colors.green.shade200;
                          }
                          setState(() {
                            result =
                                "$msg \n BMI is : ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required block*";
                          });
                        }
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$result",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
