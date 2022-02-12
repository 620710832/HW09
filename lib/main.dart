import 'package:flutter/material.dart';

import 'Test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const wh = 60.0;

  @override
  State<HomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<HomePage> {
  String _input = "";
  String _output = "ทายเลข 1 ถึง 100";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.lock,
                  size: 60.0,
                  color: Colors.black38,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20.0, color: Colors.black38),
                  ),
                ),
                Text(
                    "Enter PIN to login",
                  style: TextStyle(fontSize: 20.0, color: Colors.black38),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0;i<_input.length;i++)
                Container(
                  width: 20.0,
                  height: 20.0,
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                for(var l=0;l<6-_input.length;l++)
                 Container(
                   width: 20.0,
                   height: 20.0,
                   margin: EdgeInsets.all(4.0),
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     shape: BoxShape.circle,
                 ),
                 ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(1),
                    _buildButton(2),
                    _buildButton(3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(4),
                    _buildButton(5),
                    _buildButton(6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(7),
                    _buildButton(8),
                    _buildButton(9),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 75.0,
                      height: HomePage.wh,
                    ),
                    _buildButton(0),
                    _buildButton(-1),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int? num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
            if(num==-1){
              setState(() {
                //'12345'
                var length = _input.length;
                _input = _input.substring(0, length - 1);
              });
            }
            else if (num == -2) {
              setState(() {
                _input = '';
              });
            } else {
              setState(() {
                if(_input.length<=5) {
                  _input = "$_input$num";
                }
              }
              );
              print('pressed $num');
            }
            if(_input.length==6&&_input=="123456"){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Test())
              );
              _input ="";
            }
            else if(_input.length==6&&_input!="123456"){
              showDialog(context: context,barrierDismissible: false,builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Incorrect PIN'),
                  content: Text('Pls try again'),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('OK'))
                  ],
                );
              }
              );
              _input ="";
            }
          },
          borderRadius: BorderRadius.circular(30.0),
        child: Container(
          decoration: (num==-1) ? null : BoxDecoration(
            border: Border.all(width:2.0),
            shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          width  : 60.0,
          height : 60.0,
          child: (num == -1) ? Icon(Icons.backspace_outlined)
              :(num==-2)?Icon(Icons.close): Text("$num"),
        )
      ),
    );
  }
}
