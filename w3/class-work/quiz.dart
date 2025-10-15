enum Skill { FLUTTER, DART, OTHER }
class Address{
  final String street;
  final String  city;
  final int zipCode;
  Address(this.street, this.city, this.zipCode);
  @override
  String toString() => "$street, $city, $zipCode";
}
class Employee {

  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;
  Employee(
      this._name,
      this._baseSalary,
      this._skills,
      this._yearsOfExperience,
      this._address
      );

  Employee.mobileDevloper(
      String name,
      double baseSalary,
      List<Skill> skills,
      int yearOfExperinces,
      Address address
      ) :
        _name = name,
        _baseSalary = 40000,
        _skills = [Skill.FLUTTER, Skill.DART],
        _yearsOfExperience = yearOfExperinces,
        _address = address;

  String get name => _name;
  List get skills => _skills;

  double computeSalary(){

    double totalSalary = _baseSalary + (_yearsOfExperience * 2000) ;

    for(var skill in _skills){
      switch(skill){
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }
  void printDetails(){
    print("Employee Name: $_name, salary: $_baseSalary, SKills: $_skills, Year of Experiences: $_yearsOfExperience, address: $_address");
  }
}

void main() {
  var ad1 = Address("2004" , "New York", 16000);
  var ad2 = Address("2005", "Phnom Penh", 17000);
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER], 3, ad1);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.DART], 2, ad2);
  emp2.printDetails();
}


