// ignore_for_file: dead_code, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations

void main() {

  //* variables by default are non-nullable, cannot be null, must have a value

  //! ? (null check)
  //* this is variable means its can be null

  int? y;
  print(y); //* its means y is null

  //! ?? (null coalescing operator)
  //* provides a another value incase the variable is null

  String? nameFromDataBase;
  String userName = nameFromDataBase ?? "No name";
  print(userName);

  //! !  (null assertion operator)
  //* means you are certain this variable in not null

  String? name = "Akber";
  print(name!.length);

  //! ?. (null safe operator)
  //* used to access a property/method of an object (like length etc)

  //* => if the object before ?. is not null, it will return like normal
  //* => if the object before ?. is null, it will return null

  String? fullName = "Hello";
  String? secondName;
  print(fullName?.length);
  print(secondName?.length);

  /*
   with out the ?. you will get errors for using properties/methods on null values.
   Simply, in other words..
   this helps you gracefully handle null values without your app crashing

   => BEFORE NULL SAFTEY:

   if(fullName !=null){
    do code
   }

   we can simply use by using ?.

   => WHEN TO USE ?. VS !
   ---------------------------------------------------------------------
    "?."
   - Saftey : using ?. is safe when dealing with nullable objects.
              if the object is null, the expression will gracefully
              return null without throwing an error

   - Cleaner code : it can simplify conditional checks.
                    instead of using a longer condition

                    if(name !=null){
                      return name.address;
                    }else{
                      return null
                    }

                  We can just say:
                  name?.address
   ------------------------------------------------------------------------

    "!"

    - Explicitness : By using this , you are explicitly stating thay you expect the value
                     to ba null.
                     If it does end up beign null, the code will throw an error

   ---------------------------------------------------------------------------
  */

  //* question


  List<Student> studentsList = [
    Student(name: "Akber", mark: 50),
    Student(name: "Shijo"),
    Student(name: "Defin", mark: 0),
    Student(name: "Anoop", mark: 30),
  ];

  for (var student in studentsList) {
    print("Name :" +
        student.name +
        "Mark :" +
        "${student.markAsPercentage(student.mark)}");
  }
}

//* pratical exaple for ?. and !
//* imagine school students take an exam, the exam is out 15, school wants print the mark or every student, some students dont attend the exam

class Student {
  final String name;
  final int? mark; // score can be null because student was absent

  Student({required this.name, this.mark});

  //* marks to percentage
  String markAsPercentage(int? mark) {
    int totalMark = 80;
    double percentage = (mark?.toDouble() ?? 0) * 100 / totalMark;
    return mark == null ? "Absent" : "${percentage.toStringAsFixed(0)}%";
  }
}
