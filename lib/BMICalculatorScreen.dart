import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterappbmi/BMIModel.dart';
import 'package:flutterappbmi/ResultScreen.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {

  double _userHeight = 100;
  double _userWeight = 40;
  double _bmi = 0;
  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: SvgPicture.asset(
                    "images/heart.svg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('BMI Calculator', style: TextStyle(color: Colors.red[700],fontSize: 34, fontWeight: FontWeight.w700),),
                Text('We care about your Health', style: TextStyle(color: Colors.indigo,fontSize: 15, fontWeight: FontWeight.w300),),
                SizedBox(
                  height: 32,
                ),
                Text('Height (cm)', style: TextStyle(color: Colors.indigo,fontSize: 24, fontWeight: FontWeight.w400),),
                Container(
                  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                  child: Slider(
                    min: 80.0,
                    max: 250.0,
                    onChanged: (height){
                      setState(() {
                        _userHeight = height;
                      });
                    },
                    value: _userHeight,
                    divisions: 100,
                    activeColor: Colors.red,
                    label: "$_userHeight",
                  ),
                ),
                Text("$_userHeight cm",style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

                SizedBox(
                  height: 32,
                ),

                Text('Weight (kg)', style: TextStyle(color: Colors.indigo,fontSize: 24, fontWeight: FontWeight.w400),),
                Container(
                  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                  child: Slider(
                    min: 30.0,
                    max: 120.0,
                    onChanged: (weight){
                      setState(() {
                        _userWeight = weight;
                      });
                    },
                    value: _userWeight,
                    divisions: 100,
                    activeColor: Colors.red,
                    label: "$_userWeight",
                  ),
                ),
                Text("$_userWeight kg",style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

                Container(
                  child: FlatButton.icon(
                      onPressed: (){
                        _bmi = (_userWeight)/((_userHeight/100)*(_userHeight/100));
                        if(_bmi>=18.5&&_bmi<=25){
                          _bmiModel = BMIModel(bmi: _bmi,isNormal: true,comments: "You are totally fit");
                        }else if(_bmi<18.5){
                          _bmiModel = BMIModel(bmi: _bmi,isNormal: false,comments: "You are UnderWeighted");
                        }else if(_bmi>25&&_bmi<=30){
                          _bmiModel = BMIModel(bmi: _bmi,isNormal: true,comments: "You are OverWeighted");
                        }else{
                          _bmiModel = BMIModel(bmi: _bmi,isNormal: true,comments: "You are Obesed");
                        }
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>ResultScreen(bmiModel: _bmiModel,)
                        ));
                      },
                      icon: Icon(Icons.favorite,color:Colors.white),
                      label: Text("Calculate"),
                    textColor: Colors.white,
                    color: Colors.pink,
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30,left: 16,right: 16),
                ),
//          SizedBox(height: 32,),
//          Text("Your BMI is $_bmi",style: TextStyle(color: Colors.indigo, fontSize: 28, fontWeight: FontWeight.w700),),
              ],
            )),
      ),
    );
  }
}
