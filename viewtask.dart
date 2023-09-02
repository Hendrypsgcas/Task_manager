import 'package:flutter/material.dart';
import 'package:task/settings.dart';
import 'package:task/signIn.dart';
import 'package:task/main.dart';
import 'package:task/profile.dart';
import 'package:task/splash.dart';
import 'package:task/task.dart';



class viewtask extends StatefulWidget {
  const viewtask( {super.key, required this.title});
  final String title;

  @override
  State<viewtask> createState() => _viewtaskState();
}

class _viewtaskState extends State<viewtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,

        title: Text(widget.title),
        actions: const [ Icon(Icons.notifications)],
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/image/logo.png"),
                decoration: BoxDecoration(color: Colors.lightBlueAccent),),
              ListTile(
                leading: Icon(Icons.present_to_all,color: Colors.black),
                title: Text("Splash"),
                onTap: (){
                  print("splash");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()));
                },
              ),

              ListTile(
                leading: Icon(Icons.account_circle_outlined,color: Colors.black),
                title: Text("Profile"),
                onTap: (){
                  print("Profile");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              ListTile(
                leading: Icon(Icons.local_grocery_store_outlined,color: Colors.black),
                title: Text("Home"),
                onTap: (){
                  print("home");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => viewtask(title: "Task Manager")));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.black),
                title: Text("Settings"),
                onTap: (){
                  print("Setting");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                },
              ),

              ListTile(
                leading: Icon(Icons.logout_outlined,color: Colors.black),
                title: Text("LogOut"),
                onTap: (){
                  print("Profile");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return SignIn();
                    },
                  ), (route) => false);
                },
              ),


            ],
          )

      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25, // <-- SEE HERE
            ),
            Center(
              child: const Text("Welcome to Task Manager",style: TextStyle(
                color: Colors.blueAccent,fontSize: 23,fontWeight: FontWeight.bold,
              )),
            ),
            Center(
              child: const Text("Your Task",style: TextStyle(
                color: Colors.lightBlueAccent,fontSize: 23,fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(
              height: 30, // <-- SEE HERE
            ),
             Container(
               child: Column(
                 children: [
                   Text("Task : Meeting at 6 O clock",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   Text("Date : 15.8.2023",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   SizedBox(
                     height: 20, // <-- SEE HERE
                   ),
                   Text("Task : Eye checkup",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   Text("Date : 20.8.2023",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   SizedBox(
                     height: 20, // <-- SEE HERE
                   ),
                   Text("Task : Houes Rent",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   Text("Date : 31.8.2023",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   SizedBox(
                     height: 20, // <-- SEE HERE
                   ),
                   Text("Task : collage fees last date",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                   Text("Date :9.9.2023",style: TextStyle(
                     color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
                   )),Padding(padding: EdgeInsets.all(2.0)),
                 ],
               ),
             )
          ],
        ),
      ),
    );
  }
}
