import 'package:flutter/material.dart';
import 'package:bmiproject/main.dart';

void main() {
  runApp(const MyApp());
}

class Bmi extends StatelessWidget {

  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
         // image: DecorationImage(
            //image: AssetImage('assets/images/bg.jpg'),
          //  fit: BoxFit.cover,
         // ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('BMI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.indigo)),
                  const Text('CALCULATOR',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.indigo)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              //child: Image.asset(
                //'assets/images/bmi.png',
               // height: 130,
             // ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('HEIGHT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                            const Text('(m)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _lengthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter height',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('WEIGHT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                            const Text('(kg)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _girthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter weight',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(onPressed: (){
                var length_text = _lengthController.text;
                var girth_text =  _girthController.text;
                double? height = double.tryParse(length_text);
                double? weight = double.tryParse(girth_text);

                if(height == null || weight == null){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("ERROR"),
                        content: const Text("Invalid input"),
                        actions: [
                          // ปุ่ม OK ใน dialog
                          TextButton(
                            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.indigo)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                else{
                  double bmi = weight/(height*height);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              //Image.asset('assets/images/bmi.png',
                                  //width: 40, height: 40),
                              Text('  RESULT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.deepPurple)),
                            ],
                          ),
                        ),
                        content: Text('BMI : ${bmi.round()}'),
                        actions: [
                          TextButton(
                            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.indigo)),
                            onPressed: () {
                              // ปิด dialog
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }, child: Text('CALCULATE' , style : TextStyle(fontSize: 25.0 ))),
            ),
          ],
        ),
      ),
    );
  }
}