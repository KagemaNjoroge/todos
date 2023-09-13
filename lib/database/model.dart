class Todo {
  int id;
  String title;
  String description;
  String date;
  int priority; // priority 0 = low, 1 = high, 2 = medium
  int status; // status 0 = incomplete, 1 = complete

  Todo(
      {required this.id,
      this.status = 1,
      required this.title,
      required this.description,
      required this.date,
      required this.priority});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, date: $date, priority: $priority}';
  }
}

class User {
  String name;
  String email;
  String phone;
  String password;

  String imagePath;
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'imagePath': imagePath,
    };
  }

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        password: data['password'],
        imagePath: data['imagePath']);
  }
}
