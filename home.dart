import 'package:flutter/material.dart';
import 'package:task/settings.dart';
import 'package:task/signIn.dart';
import 'package:task/main.dart';
import 'package:task/profile.dart';
import 'package:task/splash.dart';
import 'package:task/task.dart';
import 'package:task/viewtask.dart';



class home extends StatefulWidget {
  const home({super.key, required this.title});
  final String title;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {



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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => home(title: "Task Manager")));
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
                color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(
              height: 30, // <-- SEE HERE
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
                return task(title: "Task Manager");
              },
              ),
                      (route) => false);

            }, child: Text("Create New Task",style: TextStyle(
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
            SizedBox(
              height: 30, // <-- SEE HERE
            ),
            ElevatedButton(onPressed: (){
              //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SecondPage('something')));
            Navigator.pushAndRemoveUntil(
                context,MaterialPageRoute(builder: (context)
              {
                return viewtask(title: "Task Manager");
              },
              ),
                      (route) => false);

            }, child: Text("View Task",style: TextStyle(
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
      ),

    );
  }
}
