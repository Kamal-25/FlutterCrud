// import 'package:flutter/material.dart';
// import 'package:flutter_crud/commons.dart';
// import 'package:flutter_crud/home_page.dart';
// import 'package:flutter_crud/student_service.dart';
// import 'package:flutter_crud/student.dart';
//
// class AddPage extends StatefulWidget {
//   final Student? student;
//
//   AddPage({this.student});
//
//   @override
//   State<AddPage> createState() => _AddPageState(student: student);
// }
//
// class _AddPageState extends State<AddPage> {
//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   final courseController = TextEditingController();
//   final gpaController = TextEditingController();
//   final addressController = TextEditingController();
//   final cgpaController = TextEditingController();
//   Student? student;
//   bool isNew = true;
//
//   _AddPageState({this.student}) {
//     isNew = student == null || student!.id == 0;
//     if (isNew) {
//       student = Student(id: 0);
//     }
//     nameController.text = student!.name ?? '';
//     ageController.text = student!.age ?? '';
//     courseController.text = student!.course ?? '';
//     gpaController.text = student!.gpa ?? '';
//     addressController.text = student!.gpa ?? '';
//     cgpaController.text = student!.gpa ?? '';
//   }
//
//   @override
//   void dispose() {
//     addressController.dispose();
//     cgpaController.dispose();
//     gpaController.dispose();
//     nameController.dispose();
//     ageController.dispose();
//     courseController.dispose();
//     super.dispose();
//   }
//
//   clearText() {
//     gpaController.clear();
//     nameController.clear();
//     ageController.clear();
//     courseController.clear();
//     addressController.clear();
//     cgpaController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context, onPressedNavBtn, "Home"),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: ListView(
//             children: [
//               getInputContainer("Id", nameController, "Please enter Id"),
//               getInputContainer("Price", ageController, "Please enter Price"),
//               getInputContainer("Band", courseController, "Please enter Band"),
//               // getInputContainer("GPA", gpaController, "Please enter GPA"),
//               // getInputContainer("Address", addressController, "Please enter address"),
//               // getInputContainer("CGPA", cgpaController, "Please enter CGPA"),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
//                 child: Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: onSubmit,
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.blue, // Change this to the desired color
//                         ),
//                         child: Text(isNew ? 'Submit' : 'Update')),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onSubmit() {
//     if (_formKey.currentState!.validate()) {
//       student!.name = nameController.text;
//       student!.course = courseController.text;
//       student!.gpa = gpaController.text;
//       student!.age = ageController.text;
//       student!.address = addressController.text;
//       student!.cgpa = cgpaController.text;
//       Student savedStudent = StudentService.addStudent(student!.clone());
//       showMessage(context, 'Successfully saved', savedStudent.id < 1);
//     }
//   }
//
//   void onPressedNavBtn() {
//     navigate(context, HomePage());
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_crud/commons.dart';
import 'package:flutter_crud/home_page.dart';
import 'package:flutter_crud/student_service.dart';
import 'package:flutter_crud/student.dart';

class AddPage extends StatefulWidget {
  final Student? student;

  AddPage({this.student});

  @override
  State<AddPage> createState() => _AddPageState(student: student);
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();
  Student? student;
  bool isNew = true;

  _AddPageState({this.student}) {
    isNew = student == null || student!.id == 0;
    if (isNew) {
      student = Student(id: 0);
    }
    nameController.text = student!.name ?? '';
    ageController.text = student!.age ?? '';
    courseController.text = student!.course ?? '';
  }

  @override
  void dispose() {
    ageController.dispose();
    nameController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, onPressedNavBtn, "Home"),
      body: Center(
        child: Container(
          width: 300, // Set the width of the container
          height: 400, // Set the height of the container
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getInputContainer("Id", nameController, "Please enter Id"),
                getInputContainer("Price", ageController, "Please enter Price"),
                getInputContainer("Band", courseController, "Please enter Band"),
                ElevatedButton(
                  onPressed: onSubmit,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Change this to the desired color
                  ),
                  child: Text(isNew ? 'Submit' : 'Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      student!.name = nameController.text;
      student!.course = courseController.text;
      student!.age = ageController.text;
      Student savedStudent = StudentService.addStudent(student!.clone());
      showMessage(context, 'Successfully saved', savedStudent.id < 1);
    }
  }

  void onPressedNavBtn() {
    navigate(context, HomePage());
  }
}

