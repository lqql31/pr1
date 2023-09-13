class Student {
  int id;
  String surname;
  String middle;
  String firstName;
  int age;
  String group;
  double grade;

  // Дополнительные атрибуты
  String city = "";
  String country = "";
  String gender = "";

  Student(this.id, this.surname, this.middle, this.firstName, this.age, this.group, this.grade,
      {this.city = "", this.country = "", this.gender = ""});

  void displayStudent() {
    print(
        "ID: $id, Имя: $firstName $middle $surname, Возраст: $age, Группа: $group, Балл: $grade, Город: $city, Страна: $country, Пол: $gender");
  }
  
  getAttribute(String attribute) {}
}

class StudentList {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  Student? getStudentWithHighestGrade({bool highest = true}) {
    if (students.isEmpty) return null;

    students.sort((a, b) => a.grade.compareTo(b.grade));

    return highest ? students.last : students.first;
  }

  double getAverageGrade() {
    if (students.isEmpty) return 0;

    double sum = students.fold(0, (acc, student) => acc + student.grade);
    return sum / students.length;
  }

  void removeStudentById(int id) {
    students.removeWhere((student) => student.id == id);
  }

  void updateStudent(Student student) {
    int index = students.indexWhere((s) => s.id == student.id);
    if (index != -1) {
      students[index] = student;
    }
  }

  List<Student> filterStudents(String attribute, dynamic value) {
    return students.where((student) => student.getAttribute(attribute) == value).toList();
  }

  void displayStudents([List<Student>? filteredStudents]) {
    List<Student> displayList = filteredStudents ?? students;

    displayList.forEach((student) => student.displayStudent());
  }
}

void main() {
  StudentList studentList = StudentList();

  // Создание списка студентов
  for (int i = 1; i <= 20; i++) {
    Student student = Student(i, "Фамилия$i", "Имя$i", "Отчество$i", i + 18, "Группа$i", 4.0 + (i / 10),
        city: "Город$i", country: "Страна$i", gender: i % 2 == 0 ? "Мужчина" : "Женщина");
    studentList.addStudent(student);
  }

  // Добавление нового студента
  Student newStudent = Student(21, "Новая Фамилия", "Новое Имя", "Новое отчество", 21, "Новая группа", 4.5,
      city: "Новый город", country: "Новая страна", gender: "Мужской");
  studentList.addStudent(newStudent);

  // Получение студента с наивысшим баллом
  Student? highestGradeStudent = studentList.getStudentWithHighestGrade(highest: true);
  print("Студент с наивысшим быллом:");
  highestGradeStudent?.displayStudent();

  // Получение студента с наименьшим баллом
  Student? lowestGradeStudent = studentList.getStudentWithHighestGrade(highest: false);
  print("Студент с наименьшим баллом:");
  lowestGradeStudent?.displayStudent();

  // Получение среднего балла всех студентов
  double averageGrade = studentList.getAverageGrade();
  print("Общий ср. балл: $averageGrade");

  // Удаление студента по id
  studentList.removeStudentById(10);

  // Изменение данных студента
  Student updatedStudent = Student(2, "Измененная фамилия", "Измененное имя", "Измененное отчество", 20, "Измененная группа", 4.7,
      city: "Измененный город", country: "Измененная страна", gender: "Женский");
  studentList.updateStudent(updatedStudent);

  // Фильтрация студентов по городу
  List<Student> filteredStudents = studentList.filterStudents("город", "Город5");

  // Вывод всех студентов
  print("Все студенты:");
  studentList.displayStudents();

  // Вывод отфильтрованных студентов
  print("Фильтр:");
  studentList.displayStudents(filteredStudents);
}# pr1
