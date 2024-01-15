import 'package:flutter_crud/dao/in_memory_repository.dart';
import 'package:flutter_crud/student.dart';

import 'dao/crud_repository.dart';

class StudentService {

  static CrudRepository repository = InMemoryRepository();

  static Student addStudent(Student student) {
    return repository.save(student);
  }

  static List<Student> listStudents() {
    return repository.findAll() as List<Student>;
  }

  static Student getStudent(int id) {
    return repository.findById(id);
  }

  static void deleteStudent(int id) {
    repository.deleteById(id);
  }

}