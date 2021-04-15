import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200.0,
                width: 200.0,
                child: bmiModel.isNormal ? SvgPicture.asset("images/enjoy.svg", fit: BoxFit.contain,) : SvgPicture.asset("images/sad.svg", fit: BoxFit.contain,)
              ),
              SizedBox(height: 32,),
              Text("Your BMI is : ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.red[700],fontSize: 34,fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),
              Text("${bmiModel.comments}", style: TextStyle(color: Colors.indigo[700],fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(height: 16,),
              bmiModel.isNormal ? Text("Good ! Your BMI is Normal.", style: TextStyle(color: Colors.red[700],fontSize: 18,fontWeight: FontWeight.w700),) : Text("Ohh...No... Your BMI is not Normal.", style: TextStyle(color: Colors.red[700],fontSize: 18,fontWeight: FontWeight.w700),),
              Container(
                child: FlatButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color:Colors.white),
                  label: Text("Let's Calculate Again"),
                  textColor: Colors.white,
                  color: Colors.pink,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(top: 30,left: 16,right: 16),
              ),
            ],
          ),
      ),
    );
  }
}
