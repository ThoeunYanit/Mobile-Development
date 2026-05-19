enum Skill { FLUTTER, DART, OTHER }

// Employee Class
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
    this._address,
    this._yearsOfExperience,
  );

  //getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // named constructor
  Employee.mobileDeveloper(
    this._name,
    this._baseSalary,
    this._address,
    this._yearsOfExperience,
  ) : _skills = [Skill.FLUTTER, Skill.DART];

  double computeSalary() {
    double totalSalary = 0;

    totalSalary += _baseSalary;

    totalSalary += (_yearsOfExperience * 2000);

    for (var skill in skills) {
      if (skill == Skill.FLUTTER) {
        totalSalary += 5000;
      } else if (skill == Skill.DART) {
        totalSalary += 3000;
      } else {
        totalSalary += 1000;
      }
    }

    return totalSalary;
  }

  void printDetails() {
    String skills_with_name = '';
    for (var skill in skills) {
      skills_with_name += skill.name + ' ';
    }

    print('Employee: $_name');
    print('Base Salary: \$$_baseSalary');
    print(
      'Address: \n\tCity: ${_address._city}\n\tStreet: ${_address._street}\n\tZip Code: ${_address._zipCode}',
    );

    print('Skills: ${skills_with_name}');
    print('Year of Experience: $_yearsOfExperience');
    print('Total Salary: \$${computeSalary()}\n');
  }
}

// Address Class
class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(String street, String city, String zipCode)
    : _street = street,
      _city = city,
      _zipCode = zipCode;

  String get street {
    return _street;
  }

  String get city => _city;
  String get zipCode => _zipCode;
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.DART, Skill.FLUTTER],
    Address('Street 1', 'Phnom Penh', '12001'),
    10,
  );
  emp1.printDetails();

  var emp2 = Employee(
    'Ronan',
    45000,
    [Skill.FLUTTER, Skill.OTHER, Skill.DART],
    Address('Street 2', 'Phnom Penh', '12002'),
    10,
  );
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper(
    'Yanit',
    100000,
    Address('Street 67', 'Phnom Penh', '12670'),
    11,
  );
  emp3.printDetails();
}
