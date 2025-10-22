

enum SkillV2 { FLUTTER(5000), DART(3000), OTHER(1000);
  const SkillV2(this._bonus);
  final int _bonus;
  int get getBonus => _bonus;
  @override
  String toString() {
    switch(this) {
      case SkillV2.FLUTTER:
        return 'FLUTTER';
      case SkillV2.DART:
        return 'DART';
      case SkillV2.OTHER:
        return 'OTHER';
    }
  }
}
enum SKill{FLUTTER, DART, OTHER}

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
  final List<SkillV2> _skills;
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

      int yearOfExperinces,
      Address address
      ) :
        _name = name,
        _baseSalary = 40000,
        _skills = [SkillV2.FLUTTER, SkillV2.DART],
        _yearsOfExperience = yearOfExperinces,
        _address = address;

  String get name => _name;
  List get skills => _skills;

  double computeSalary(){

    double totalSalary = _baseSalary + (_yearsOfExperience * 2000) ;

    for(var skill in _skills){
      switch(skill){
        case SkillV2.FLUTTER:
          totalSalary += 5000;
          break;
        case SkillV2.DART:
          totalSalary += 3000;
          break;
        case SkillV2.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

  double computeSalaryV2(){
    double totalSalary = _baseSalary + (_yearsOfExperience * 2000);
    for(SkillV2 skill in skills){
      totalSalary += skill.getBonus;
    }
   return totalSalary;
  }
  void pirntSKills() {
    // _skills.
  }
  void printDetails(){
    print("Employee Name: $_name, \nsalary: ${computeSalaryV2()}, \nSKills: $skills, \nYear of Experiences: $_yearsOfExperience, \naddress: $_address");
  }
}

void main() {
  var ad1 = Address("2004" , "New York", 16000);
  var ad2 = Address("2005", "Phnom Penh", 17000);
  var emp1 = Employee('Sokea', 40000, [SkillV2.FLUTTER], 0, ad1);
  var emp3 = Employee.mobileDevloper('rayu', 1000, 2, ad1);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 1000, [SkillV2.DART],0 , ad2);
  emp2.printDetails();
  emp3.printDetails();
}


