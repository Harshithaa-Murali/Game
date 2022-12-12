import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            centerTitle: true,
          ),
          body: const BasicForm(),
        )
    );
  }
}

class BasicForm extends StatefulWidget {
  const BasicForm({Key? key}) : super(key: key);

  @override
  State<BasicForm> createState() => _BasicFormState();
}

// class Submission extends StatelessWidget {
//   final String username;
//   //int num;
//   var num = Random().nextInt(10);
//   int counter;
//
//   Submission({Key? key, this.username="", this.counter=6}): super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Color myColor = Colors.yellow;
//     if(counter <= 0){
//       return Scaffold(
//         body: Center(
//           child:
//               Text(
//             "No more Guesses allowed, Number is $num",
//             style: const TextStyle(fontSize: 30,),),
//         ),
//       );
//     }
//     else{
//       if(counter == 3 && int.parse(username) < ((num/2))){
//         return const Scaffold(
//           backgroundColor: Colors.red,
//           body: AlertDialog(
//             content: Text("Only 2 tries left"),
//           ),
//         );
//       }
//       if(counter == 3 && int.parse(username) > ((num/2))){
//         return const Scaffold(
//           backgroundColor: Colors.blue,
//           body: AlertDialog(
//             content: Text("Only 2 tries left"),
//           ),
//         );
//       }
//       if(username == num.toString()){
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("You won"),
//             centerTitle: true,
//           ),
//           body: const Center(
//             child: Text("Got the Number !!!", style: TextStyle(fontSize: 35,),),
//           ),
//         );
//       }
//       else if(int.parse(username) < ((num/2))){
//         myColor = Colors.red;
//       }
//       else if(int.parse(username) > ((num/2))){
//         myColor = Colors.blue;
//       }
//     }
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("No luck! "),
//           centerTitle: true,
//         ),
//         body: Container(
//           color: myColor
//         )
//     );
//   }
// }


class _BasicFormState extends State<BasicForm> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  int counter = 6;
  var num = Random().nextInt(10);

  Color mycol = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mycol,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0,),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text('Hello'),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Enter a number"
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                    //counter=6;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a number ";
                  }
                  return null;
                },
              ),
              const SizedBox( height: 20, ),
              ElevatedButton(
                onPressed: () {
                  counter--;
                  if(counter <=0){
                    showDialog(context: context, builder: (BuildContext context){
                      return const AlertDialog(
                        title: Text('No More guesses'),
                      );
                    });
                  }
                  if(int.parse(username) == num){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return const AlertDialog(
                            title: Text('Yaay'),
                          );
                        });
                    setState(() {
                      mycol = Colors.yellow;
                    });
                  }

                },

                child: const Text("Submit"),
              )
            ],
          )
      ),
    );
  }
}
