import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a student document to Firestore
  Future<void> addStudent(Map<String, dynamic> studentInfo, String studentId, String collectionName) async {
    return await _firestore
        .collection(collectionName)
        .doc(studentId)
        .set(studentInfo)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Fetch student details as a stream
  Stream<QuerySnapshot> getStudentDetails() {
    return _firestore.collection('students').snapshots();
  }

  // Update attendance
  Future<void> updateAttendance(String attendanceCase, String id) async {
    return await _firestore
        .collection("students")
        .doc(id)
        .update({attendanceCase: true})
        .catchError((e) {
      print(e.toString());
    });
  }

  // Delete attendance
   Future<void> deleteStudentData( String id) async {
    return await _firestore
        .collection("students")
        .doc(id)
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }
}
