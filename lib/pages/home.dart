
//import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/add_student.dart';
import 'package:flutter_crud/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
     //Stream? studentStream;
  
 getontheload()async{
    studentStream=
    await DatabaseMethods().
    getStudentDetails(); 
    setState(() {});
      

   
  }
  
@override
  void initState() {
   getontheload();
    super.initState();
  }
        Stream? studentStream;
      Widget showStudentsList(){
return StreamBuilder(
   stream: studentStream,
   builder:(context,AsyncSnapshot snapshot){
  return snapshot.hasData
  ?ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
 itemCount: snapshot.data.docs.length, 
 itemBuilder: (BuildContext context, int index) {
  DocumentSnapshot ds=snapshot.data.docs[index];
  return  Container(
     margin: EdgeInsets.only(bottom: 20.0),
    child: Material(
                   elevation: 3.0,
                   borderRadius: BorderRadius.circular(10),
                  child: Container(
                   
                    padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                           children: [
                             Text("Student Name: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
                             ),
                              Text(
                                ds["Name"],
                              style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
                             ),
                            Spacer(),
                             GestureDetector(
                              onTap: ()async{
await DatabaseMethods().deleteStudentData(ds.id);
                              },
                               child: Padding(
                                 padding: const EdgeInsets.only(right: 10.0),
                                 child: Icon(Icons.delete,color: Colors.black,size: 25,),
                               ),
                             )
                           ],
                         ),
                         SizedBox(height: 5.0,),
                          Row(
                           children: [
                             Text("Roll No.: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
                             ),
                              Text(ds["RollNo"],style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         SizedBox(height: 5.0,),
                          Row(
                           children: [
                             Text("Age: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
                             ),
                              Text(ds["Age"],style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                         SizedBox(height: 5.0,),
                          Row(
                           children: [
                             Text("Attendence: ",style: TextStyle(color: Colors.black,fontSize: 19.0,fontWeight: FontWeight.bold),
                             ),
                             SizedBox(width: 10.0,),
                           ds["Present"]==false  
                           ? GestureDetector(
                            onTap:()async{
await DatabaseMethods().updateAttendance("Present", ds.id);
                             
                            },
                             child: Container(
                                width: 50,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                 border: Border.all(),
                                 
                                 borderRadius:
                                  BorderRadius.circular(5.0)),
                                child: Center(
                                  child: Text("P ",
                                  style: TextStyle(color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                                 ),
                                ) ,
                               ),
                           ):
                           Container(
                              width: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text("P ",
                                style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                                                           ),
                              ) ,
                             ),
                              SizedBox(width: 20.0,),
                              ds["Absent"]==false
                              ? GestureDetector(
                                 onTap:()async{
await DatabaseMethods().updateAttendance("Absent", ds.id);
                            },
                                child: Container(
                                  width: 50,
                                   
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                      border: Border.all(),
                                  // color:Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                                child: Center(
                                  child: Text("A",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                    ),
                                                             ),
                                ) ,
                                ),
                              ):
                             Container(
                              width: 50,
                                 
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  
                                color:Colors.red,borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text("A",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
                                                           ),
                              ) ,
                             )
                           ]
                         )
    
                      ],
                    ),
                  ),
                ),
  )
;
   },
    ):Container();
});
      }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudent()));
        },child: Icon(Icons.add,color: Colors.white,),),
    body: Container(
    margin: EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0),
      child: Column(
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Student ",style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
               Text("Attendence",style: TextStyle(color: Colors.blue,fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
              
              ],
              ),
              SizedBox(height: 30.0,),
              // Material(
              //    elevation: 3.0,
              //    borderRadius: BorderRadius.circular(10),
              //   child: Container(
              //     padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //          Row(
              //            children: [
              //              Text("Student Name: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
              //              ),
              //               Text("Suneel Kumar ",style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
              //              ),
              //            ],
              //          ),
              //          SizedBox(height: 5.0,),
              //           Row(
              //            children: [
              //              Text("Roll No.: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
              //              ),
              //               Text("01 ",style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
              //              ),
              //            ],
              //          ),
              //          SizedBox(height: 5.0,),
              //           Row(
              //            children: [
              //              Text("Age: ",style: TextStyle(color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500),
              //              ),
              //               Text("15 ",style: TextStyle(color: Colors.blue,fontSize: 19.0,fontWeight: FontWeight.bold),
              //              ),
              //            ],
              //          ),
              //          SizedBox(height: 5.0,),
              //           Row(
              //            children: [
              //              Text("Attendence: ",style: TextStyle(color: Colors.black,fontSize: 19.0,fontWeight: FontWeight.bold),
              //              ),
              //              SizedBox(width: 10.0,),
              //              Container(
              //               width: 50,
              //               padding: EdgeInsets.all(5),
              //               decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(5.0)),
              //               child: Center(
              //                 child: Text("P ",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
              //                                            ),
              //               ) ,
              //              ),
              //               SizedBox(width: 10.0,),
              //              Container(
              //               width: 50,
              //               padding: EdgeInsets.all(5),
              //               decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(5.0)),
              //               child: Center(
              //                 child: Text("A",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
              //                  ),
              //               ) ,
              //              )
              //            ],
              //          )

              //       ],
              //     ),
              //   ),
              // ),

              showStudentsList(),
             
        ],
      ),
    ),
    );
  }
}
