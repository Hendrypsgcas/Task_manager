import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/home.dart';
import 'package:task/settings.dart';
import 'package:task/signIn.dart';
import 'package:task/main.dart';
import 'package:task/profile.dart';
import 'package:task/splash.dart';



class task extends StatefulWidget {
  const task({super.key, required this.title});
  final String title;

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => task(title: "Task Manager")));
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
              child: const Text("New task",style: TextStyle(
                color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,
              )),
            ),
            SizedBox(
              height: 30, // <-- SEE HERE
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
              child: TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your country';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'Country name should only contain alphabets and spaces';
                  }
                  if (value.length > 15) {
                    return 'Country name length should be less than 15';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Task",
                    prefixIcon: const Icon(
                      Icons.task,
                      color: Colors.blue,
                      size: 24,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 10),
              child: TextFormField(
                controller: dateOfBirthController,
                onChanged: (value) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter date ';
                  }
                  return null;
                },
                readOnly: true,
                obscureText: false, //Password would be hidden
                decoration: InputDecoration(
                    labelText: "D.O.B(YYYY-MM-DD)",
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                        size: 24,
                      ), onPressed: () {
                      _selectDate(context);
                    },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    )),
              ),
            ),









            ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){
                return home(title: "Task Manager");
              },
              ),
                      (route) => false);

            }, child: Text("Submit",style: TextStyle(
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
  void _selectDate(context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());

    if(picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // dateOfBirthController.text = _selectedDate.toString();
        dateOfBirthController.text =
            DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }

    }
  }
