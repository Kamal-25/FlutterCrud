import 'dart:collection';
import 'package:flutter_crud/dao/crud_repository.dart';
import 'package:flutter_crud/student.dart';

class InMemoryRepository extends CrudRepository<Student, int> {

  Map<int, Student> db = LinkedHashMap.identity();

  @override
  void deleteById(int id) {
    db.remove(id);
  }

  @override
  List<Student> findAll() {
    return db.values.toList();
  }

  @override
  Student findById(int id) {
    return db[id] ?? Student(id: 0);
  }

  @override
  Student save(Student data) {
    if(data.id < 1) {
      data.id = db.length + 1;
    }
    db[data.id] = data;
    return data;
  }

}