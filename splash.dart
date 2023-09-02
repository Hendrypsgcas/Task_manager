import 'package:task/home.dart';
import 'package:task/signIn.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(

            children: [
              SizedBox(
                height: 50, // <-- SEE HERE
              ),
        Container(
        child: Image(
        image: AssetImage("assets/image/top.jpg"),
    ),
    ),
              const Text("TASK MANAGER",style: TextStyle(
                color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold,
              )),

    Container(
    child: Image(
    image: AssetImage("assets/image/img_1.png"),
    ),
    ),
              SizedBox(
                height: 20, // <-- SEE HERE
              ),


              ElevatedButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
                  return SignIn();
                },
                ),
                        (route) => false);

              }, child: Text("Welcome",style: TextStyle(
                  fontSize: 20, color: Colors.white
              )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  padding: EdgeInsets.fromLTRB(15,10,15,10),

                ),
              ),
  ],

        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              // backgroundColor: customTheme.estatePrimary,
              child: Icon(
                Icons.arrow_circle_right_outlined,
              ),
              onPressed: () async {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return SignIn();
                  },
                ), (route) => false);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryList()));
              },
            ),
          ),
        )


    );

  }


}