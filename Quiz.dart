import "dart:io";

void main() {
  // Question #2
  for (int i = 1; i <= 100; i++) {
    if (i % 15 == 0) {
      print("fizzbuzz");
    } else if (i % 3 == 0) {
      print("fizz");
    } else if (i % 5 == 0) {
      print("buzz");
    } else {
      print(i);
    }
  }

  // Question #3
  List<Map<String, dynamic>> users = <Map<String, dynamic>>[
    {"age": 12, "name": "Ziad", "gender": "male"},
    {"age": 18, "name": "Baha", "gender": "male"},
    {"age": 21, "name": "Ahmed", "gender": "male"},
    {"age": 34, "name": "Yahya", "gender": "male"},
    {"age": 17, "name": "Reem", "gender": "female"},
    {"age": 43, "name": "Nora", "gender": "female"},
    {"age": 30, "name": "Mourad", "gender": "male"},
    {"age": 27, "name": "Rowan", "gender": "female"},
    {"age": 32, "name": "Mariam", "gender": "female"},
    {"age": 23, "name": "Fatima", "gender": "female"},
  ];
  List<Map<String, dynamic>> male =
      users.where((user) => user["gender"] == "male").toList();
  List<Map<String, dynamic>> female =
      users.where((user) => user["gender"] == "female").toList();
  List<Map<String, dynamic>> under18 =
      users.where((user) => user["age"] < 18).toList();
  List<Map<String, dynamic>> moreThan18 =
      users.where((user) => user["age"] >= 18).toList();
  print(male);
  print(female);
  print(under18);
  print(moreThan18);

  // Question #4
  List<Map<String, dynamic>> tasks = [];
  int taskId = 1;

  while (true) {
    print("To-Do List");
    print("1. View Tasks");
    print("2. Add Task");
    print("3. Update Task");
    print("4. Delete Task");
    print("5. Exit");
    stdout.write("Type the number of the answer: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        show(tasks);
        break;
      case "2":
        add(tasks, taskId);
        taskId++;
        break;
      case "3":
        update(tasks);
        break;
      case "4":
        delete(tasks);
        break;
      case "5":
        print("Thank you");
        return;
      default:
        print("This option is not correct");
    }
  }
}

void show(List<Map<String, dynamic>> tasks) {
  if (tasks.isEmpty) {
    print("No tasks");
  } else {
    print("Tasks:");
    for (var task in tasks) {
      print(
          "Id: ${task["id"]}, Title: ${task["title"]}, Status: ${task["status"]}, Description: ${task["description"]}");
    }
  }
}

void add(List<Map<String, dynamic>> tasks, int nextId) {
  stdout.write("Task name: ");
  String? name = stdin.readLineSync();
  stdout.write("Task status: ");
  String? status = stdin.readLineSync();
  stdout.write("Task description: ");
  String? description = stdin.readLineSync();

  if (name != null && status != null && description != null) {
    tasks.add({
      "id": nextId,
      "title": name,
      "status": status,
      "description": description,
    });
    print("Task added successfully.");
  } else {
    print("You forgot to fill all data");
  }
}

void update(List<Map<String, dynamic>> tasks) {
  stdout.write("Enter the Id of the task:");
  String? taskIdInput = stdin.readLineSync();
  int? id = int.tryParse(taskIdInput ?? "");

  if (id != null) {
    var task = tasks.firstWhere((task) => task["id"] == id, orElse: () => {});

    if (task.isNotEmpty) {
      stdout.write("New name $task["title"]):");
      String? newName = stdin.readLineSync();
      stdout.write("New status $task["status"]");
      String? newStatus = stdin.readLineSync();
      stdout.write("New description $task["description"]: ");
      String? newDescription = stdin.readLineSync();

      if (newName != null && newName.isNotEmpty) {
        task["title"] = newName;
      }
      if (newStatus != null && newStatus.isNotEmpty) {
        task["status"] = newStatus;
      }
      if (newDescription != null && newDescription.isNotEmpty) {
        task["description"] = newDescription;
      }

      print("Task updated successfully");
    } else {
      print("Task with Id $id not found");
    }
  } else {
    print("Id is not correct");
  }
}

void delete(List<Map<String, dynamic>> tasks) {
  stdout.write("Enter the Id of the task: ");
  String? idNumber = stdin.readLineSync();
  int? id = int.tryParse(idNumber ?? "");

  if (id != null) {
    int index = tasks.indexWhere((task) => task["id"] == id);
    if (index != -1) {
      tasks.removeAt(index);
      print("Task with ID $id deleted");
    } else {
      print("Task with ID $id not found");
    }
  } else {
    print("Invalid ID");
  }
}
