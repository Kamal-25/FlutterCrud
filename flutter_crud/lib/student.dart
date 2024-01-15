class Student {
  int id;
  String? name = '';
  String? age = '';
  String? course = '';
  String? gpa = '';
  String? address = '';
  String? cgpa = '';


  Student({required this.id, this.name, this.age, this.course, this.gpa,
      this.address, this.cgpa});

  Student clone() {
    return Student(id: id, name: name, age: age, course: course, gpa: gpa, address: address, cgpa: cgpa);
  }
}