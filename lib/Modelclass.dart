class Person{
  final String? name;
  final int? age;

  Person({this.name,this.age});

  factory Person.fromJson(Map<String,dynamic> map){
    return Person(
      name: map['name'],
      age: map['age'],
    );

  }

  Map<String,dynamic> toMap()
  {
    return {

      'name' : name,
      'age' : age,
    };
  }
}