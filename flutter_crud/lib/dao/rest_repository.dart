// import 'dart:collection';
// import 'dart:html';
// import 'package:flutter_crud/dao/crud_repository.dart';
// import 'package:flutter_crud/student.dart';
// import 'package:http/http.dart' as http;
//
// class RestRepository extends CrudRepository<Student, int> {
//
//   String baseUrl = "http://localhost:8080/employee/";
//
//   @override
//   void deleteById(int id) async {
//     await http.delete(Uri.parse("$baseUrl/delete/$id}"));
//   }
//
//   @override
//   List<Student> findAll() async {
//     http.Response response = await http.get(Uri.parse(baseUrl));
//     return response.body as List<Student>;
//   }
//
//   @override
//   Student findById(int id) {
//     return db[id] ?? Student(id: 0);
//   }
//
//   @override
//   Student save(Student data) {
//     if(data.id < 1) {
//       data.id = db.length + 1;
//     }
//     db[data.id] = data;
//     return data;
//   }
//
// }