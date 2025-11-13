// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // TODO: Calculate total salary (base + bonus)
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    // TODO: Process payment
    print("Payment processed: ${amount.toStringAsFixed(1)}");
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // TODO: Generate report
    return "Report: Monthly report for $employeeName in $department department";
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    // This is the base display method, overridden in subclasses
    print("$name (ID: $id, Department: $department)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: ${getBaseSalary().toStringAsFixed(1)}");
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize) : super(name, id, department);

  @override
  String getJobTitle() {
    // TODO: Return manager job title
    return "Manager";
  }

  @override
  double getBaseSalary() {
    // TODO: Return manager base salary (Matching expected output: 8000.0)
    return 8000.0;
  }

  @override
  void displayInfo() {
    // TODO: Override to show manager-specific info
    // Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
    print("Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: ${getBaseSalary().toStringAsFixed(1)}");
  }
}

//    - Developer extends Employee with Payable
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage) : super(name, id, department);

  @override
  String getJobTitle() {
    // TODO: Return developer job title
    return "Senior Developer";
  }

  @override
  double getBaseSalary() {
    // TODO: Return developer base salary (Matching expected output: 6000.0)
    return 6000.0;
  }

  @override
  void displayInfo() {
    // TODO: Override to show developer-specific info
    // Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
    print("Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: ${getBaseSalary().toStringAsFixed(1)}");
  }
}

void main() {
  // 5. Create employees and demonstrate:

  // TODO: Create employees
  Manager manager = Manager("John Smith", "M001", "IT", 5);
  Developer developer = Developer("Alice Johnson", "D001", "IT", "Dart");

  // --- Manager Demonstration ---

  // 1. Display base info (including base salary)
  manager.displayInfo();

  // 2. Calculate salary with bonus (8000.0 + 1000.0 = 9000.0)
  double managerBonus = 1000.0;
  double managerSalary = manager.calculateSalary(manager.getBaseSalary(), managerBonus);
  print("Calculated Salary: ${managerSalary.toStringAsFixed(1)}");

  // 3. Process payment
  manager.processPayment(managerSalary);

  // 4. Report generation
  String managerReport = manager.generateReport(manager.name, manager.department);
  print(managerReport);

  print(""); // Separator

  // --- Developer Demonstration ---

  // 1. Display base info
  developer.displayInfo();

  // 2. Calculate salary with bonus (6000.0 + 500.0 = 6500.0)
  double developerBonus = 500.0;
  double developerSalary = developer.calculateSalary(developer.getBaseSalary(), developerBonus);
  print("Calculated Salary: ${developerSalary.toStringAsFixed(1)}");

  // 3. Process payment
  developer.processPayment(developerSalary);
}