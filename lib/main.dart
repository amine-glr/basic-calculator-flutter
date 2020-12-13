import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyCalculator(),
    );
  }
}
class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double result= 0.0;
  String strResult= '0';
  String operator= '';
  double firstNumber ;
  bool isFirstNumberAfterOperationButton = true;


  void onDigitPress(String text){
    print('digit pressed  $text ' );
    if(text=='+'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });

    }
    else if(text== '-'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });

    }
    else if(text== 'x'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });
    }
    else if(text== '÷'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });
    }
    else if(text== '%'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });
    }
    else if (text == '.') {
      if (strResult.contains('.')) {
        print("Already contains a decimals");
        return;
      } else {
       strResult = strResult + text;
      }
    }

    else if(text== '='){
      switch (operator){
        case '+':{
          setState(() {
            result= result + firstNumber;
          });
          strResult = '$result';
        }
        break;
        case '-':{
          setState(() {
            result=  firstNumber - result;
          });
          strResult = '$result';
        }
          break;
        case 'x':{
          setState(() {
            result= result * firstNumber;
          });
          strResult = '$result';
        }
          break;
        case '÷':{
          setState(() {
            result=   firstNumber/result;
          });
          strResult = '$result';
        }
          break;
        case '%':{
          setState(() {
            result= result / 100;
          });
          strResult = '$result';
        }
        break;

      }
    }
    else if(text== '⌫'){
      strResult = strResult.substring(0,strResult.length - 1);
      result= double.tryParse(strResult);
      firstNumber=result;
      setState(() {

      });


    }
    else if(text== 'C'){

      result=0;
      firstNumber = result;
      strResult = '';
      setState(() {

      });
    }

    else {
      var tempResult;

      if (isFirstNumberAfterOperationButton) {
        tempResult = text;
        isFirstNumberAfterOperationButton = false;
      }
      else {

        tempResult = strResult + text;

      }
      var temp = double.tryParse(tempResult);
      if (temp != null) {
        strResult = tempResult;
        setState(() {
          result = temp ?? result;
        });
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                  child: Text('$result',
                      style:
                      TextStyle(fontSize: 60),
                  ),
              ),
            ),
            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  buildCalculatorButton('C',Colors.grey),
                  buildCalculatorButton('⌫',Colors.grey),
                  buildCalculatorButton('%',Colors.grey),
                  buildCalculatorButton('÷',Colors.deepOrange),


                ],
              ),
            ),
            Expanded(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCalculatorButton('7',Colors.black54),
                buildCalculatorButton('8',Colors.black54),
                buildCalculatorButton('9',Colors.black54),
                buildCalculatorButton('x',Colors.deepOrange),

                ],
              ),
            ),
            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalculatorButton('6',Colors.black54),
                  buildCalculatorButton('5',Colors.black54),
                  buildCalculatorButton('4',Colors.black54),
                  buildCalculatorButton('+',Colors.deepOrange),

                ],
              ),
            ),
            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalculatorButton('3',Colors.black54),
                  buildCalculatorButton('2',Colors.black54),
                  buildCalculatorButton('1',Colors.black54),
                  buildCalculatorButton('-',Colors.deepOrange),

                ],
              ),
            ),
            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalculatorButton('.',Colors.black54),
                  buildCalculatorButton('0',Colors.black54),
                  buildCalculatorButton('00',Colors.black54),
                  buildCalculatorButton('=',Colors.deepOrange),

                ],
              ),
            ),

              ],
        ),
      ),
    );

  }

  Expanded buildCalculatorButton(String text, Color color ) {
    return Expanded(
        child:RaisedButton(
                onPressed: (){
                  onDigitPress(text);
                },
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(
                     color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid,
    ),),
                  color: color,
                  child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                      )
                  ),
                ),

    );
  }
}

