import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/services/database.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController nameController=new TextEditingController();
    TextEditingController ageController=new TextEditingController();
      TextEditingController rollnoController=new TextEditingController();
     
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(top:60,left: 20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
         Row(
            
            children: [
               GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_outlined)),
               SizedBox(width: 80.0,),
              Text("Add ",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
               Text("Student",style: TextStyle(color: Colors.blue,fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
              
              ],
              ),
              SizedBox(height: 30.0,),
               Text("Student Name ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Student Name"),
                ),
              ),

                SizedBox(height: 30.0,),
               Text("Student Age ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Student age"),
                ),
              ),
                SizedBox(height: 30.0,),
               Text("Student Roll No. ",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: rollnoController,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Student Roll No."),
                ),
              ),
              SizedBox(height: 50.0,),
              GestureDetector(
                onTap: () async{
                  if(nameController.text!=""
                  && ageController.text!="" && rollnoController.text!=""){
                    String addID=randomAlphaNumeric(10);
                    Map<String,dynamic>StudentInfoMap={
                      "Name":nameController.text,
                      "Age":ageController.text,
                      "RollNo":rollnoController.text,
                      "Absent":false,
                      "Present":false,
                    };
                        String collectionName = "students";
                    await DatabaseMethods()
                    .addStudent(StudentInfoMap, addID,collectionName)
                    .then((value) {
                      nameController.text="";
                      ageController.text="";
                      rollnoController.text="";
                     ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      "Student Data has been Uploaded!",
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  ),
);

                    });
                  }
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: 150,
                    decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("Add ",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),
                                    ),
                    ) ,
                  ),
                ),
              )
      ],),),
    );
  }
}