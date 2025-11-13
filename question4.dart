// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐

// 1. Abstract Class Vehicle:
//    - Properties: String brand, String model, int year
//    - Abstract method: void start()
//    - Abstract method: void stop()
//    - Concrete method: void displayInfo()
abstract class Vehicle {
  String brand;
  String model;
  int year;

  Vehicle(this.brand, this.model, this.year);

  // Abstract methods (must be implemented by concrete subclasses)
  void start();
  void stop();

  // Concrete method
  void displayInfo() {
    // This is the base implementation, overridden in subclasses
    print("Vehicle Info: $year $brand $model");
  }

  // 4. Add a method to calculate vehicle age (current year - vehicle year)
  int calculateAge() {
    // Get the current year (Assuming current year is 2024 for output consistency, or using real time)
    // We will use DateTime.now().year for real-time calculation.
    int currentYear = DateTime.now().year;
    // Calculate and return vehicle age
    return currentYear - year;
  }
}

// 2. Concrete Classes:
//    - Car extends Vehicle
//      - Additional property: int numberOfDoors
//      - Override start() and stop() methods
class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, String model, int year, this.numberOfDoors) : super(brand, model, year);

  @override
  void start() {
    // Implementation for Car start
    print("Starting the car engine...");
  }

  @override
  void stop() {
    // Implementation for Car stop
    print("Stopping the car engine...");
  }

  @override
  void displayInfo() {
    // Override to show car-specific info
    print("Vehicle Info: $year $brand $model ($numberOfDoors doors)");
  }
}

//    - Motorcycle extends Vehicle
//      - Additional property: bool hasWindshield
//      - Override start() and stop() methods
class Motorcycle extends Vehicle {
  bool hasWindshield;

  Motorcycle(String brand, String model, int year, this.hasWindshield) : super(brand, model, year);

  @override
  void start() {
    // Implementation for Motorcycle start
    print("Starting the motorcycle engine...");
  }

  @override
  void stop() {
    // Implementation for Motorcycle stop
    print("Stopping the motorcycle engine...");
  }

  @override
  void displayInfo() {
    // Override to show motorcycle-specific info
    print("Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)");
  }
}

void main() {
  // 3. Create a list of vehicles and demonstrate polymorphism by calling start(), stop(), and displayInfo() on each vehicle

  // Create concrete instances
  Car toyotaCamry = Car("Toyota", "Camry", 2020, 4);
  Motorcycle hondaCBR = Motorcycle("Honda", "CBR", 2021, true);

  // Use the abstract base class `Vehicle` as the list type to enable polymorphism
  List<Vehicle> vehicles = [
    toyotaCamry,
    hondaCBR,
  ];

  // Demonstrate polymorphism
  for (Vehicle vehicle in vehicles) {
    // At this point, Dart determines the correct method implementation at runtime
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();

    // Demonstrate vehicle age calculation
    // Note: The age calculation uses the current date (Nov 2025). The expected output (4 years, 3 years)
    // implies the current year used for the example was 2024. The code uses the real current year (2025).
    int age = vehicle.calculateAge();

    // Check if the current age calculation matches the expected output (for demonstration consistency)
    // If current year is 2025: Camry (2020) -> 5 yrs, CBR (2021) -> 4 yrs
    // If we assume the test intended to use 2024 (Age: 4 and 3):
    // Let's use the actual class name for the output
    String vehicleType = vehicle is Car ? "Car" : "Motorcycle";
    print("${vehicleType} age: $age years");
    print("");
  }
}