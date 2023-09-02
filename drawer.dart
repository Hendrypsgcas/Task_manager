import 'package:task/profile.dart';
import 'package:task/settings.dart';
import 'package:task/signIn.dart';
import 'package:task/splash.dart';
import 'package:flutter/material.dart';
import 'home.dart';

Widget appDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(child: Image(image: AssetImage('assets/image/logo.png')),
            decoration: BoxDecoration(
              color: Colors.blue,
            )
        ),

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
            print("Profile");
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
    ),
  );
}