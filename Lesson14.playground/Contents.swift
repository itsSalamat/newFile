import UIKit


// creating classes

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}


class SimplePerson {
    let name : String
    
    init(name: String) {
        self.name = name
    }
}

var var1 = SimplePerson(name: "Aslan")

var var2 = var1



struct SimlpePersonStruct {
    let name: String
}

var var1Struct = SimlpePersonStruct(name: "Aslan")

var var2Struct = var1Struct



// value type vs reference type

struct Location {
    var x : Double
    var y : Double
}


var location1 = Location(x: 10, y: 15)

var location2 = location1 // copy of value

location1.x
location1.y

location2.y = 20

location1.x
location1.y

location2.x
location2.y

location1.x = 11  // pervyi example izmenila
location1.x

location2.x       // vtoroi example  x-ne izmeilsya
location2.y

location1.x
location1.y


/// v classah esli my izmenim 1-example to izmenitsya i 2-i example bc
/// v classah my skopirovali ne value a reference . t.e. link to example


var person1 = Person(firstName: "Aslan", lastName: "Arapbaev")

var person2 = person1 // copy of reference
person2.fullName      

person1.firstName
person1.lastName

person2.firstName = "Salamat"
person2.lastName = "Kochkonbaeva"

person1.firstName = "Santa" // v classah esli my izmenim 1-example to izmenitsya i 2-i example bc v classah my skopirovali ne value a reference . t.e. link to example

person1.firstName
person1.lastName

person2.firstName
person2.lastName


// Object identity

let number1 = 10
let number2 = 10

number1 == number2

let aslan = Person(firstName: "Aslan", lastName: "Arapbaev")
let timur = Person(firstName: "Timur", lastName: "Mone")

timur === aslan

let john = aslan

john === timur
john === aslan


// class mutability

struct Grade {
    let subject: String
    let points: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let studentAslan = Student(firstName: "Aslan", lastName: "Arapbaev")

let computerScience = Grade(subject: "Computer Science", points: 95)
let history = Grade(subject: "History", points: 80)

//studentAslan = Student(firstName: "Timur", lastName: "Mone")  // error

studentAslan.recordGrade(computerScience)
studentAslan.recordGrade(history)

//studentAslan = Student(firstName: "Timur", lastName: "Mone")

extension Student {
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
}


// Inheritance

class Student2: Person {  // Person base class and Student2 a derived class
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let aslanPerson = Person(firstName: "Aslan", lastName: "Arapbaev")
let aslanStudent = Student2(firstName: "Aslan", lastName: "Arapabev")

aslanPerson.fullName
aslanStudent.fullName

aslanStudent.recordGrade(history)
//aslanPerson.recordGrade(history) // not a student


class StudentProgrammer: Student2 {
    var minimumHoursOfPracticeSwift: Double = 120.0
    var numberOfProjectsOnGITHub: Int = 10
}

var studentProgrammerAslan = StudentProgrammer(firstName: "Aslan", lastName: "Arapbaev")
studentProgrammerAslan.numberOfProjectsOnGITHub

class StudentProgrammerAssistant: StudentProgrammer {
    //...
}

class Transport {
    var wheels: Int
    var seats: Int
    
    init(wheels: Int, seats: Int) {
        self.wheels = wheels
        self.seats = seats
    }
}

class Bicycle: Transport {
    var basket: Int = 1
}

class MotorCycle: Bicycle {
    //
}

class Bus: Transport {
    
    func stopAtBusstop() {
        print("stop")
    }
}

let bicycle1 = Bicycle(wheels: 2, seats: 1)
bicycle1.basket

let bus1 = Bus(wheels: 4, seats: 20)
bus1.stopAtBusstop()

class Car {
    var wheels: Int
    var seats: Int
    
    init() {
        self.seats = 4
        self.wheels = 4
    }

    init(seats: Int) {
        self.seats = seats
        self.wheels = 4
    }
}

let car1 = Car()
car1.seats


// Polymorphism

let john2 = Person(firstName: "John", lastName: "Black")
let johnStudent = Student2(firstName: "John", lastName: "White")
let johnProgrammer = StudentProgrammer(firstName: "John", lastName: "Programmer")

func printFullName(_ person: Person) {
    print(person.firstName + " " + person.lastName)
}

printFullName(john2)
printFullName(johnStudent)
printFullName(johnProgrammer)

printFullName(aslanPerson)
printFullName(aslanStudent)


func phonebookName(_ student: Student2) -> String {
    "\(student.lastName), \(student.firstName)"
}

phonebookName(johnStudent)
phonebookName(johnProgrammer)
//phonebookName(john2)

// Опрератор as

let num = 1
let numDouble = Double(num)

johnProgrammer.numberOfProjectsOnGITHub

(johnProgrammer as Person).firstName


aslanStudent.grades

(aslanStudent as Person).fullName
//(aslanStudent as Person).grades // not available

let aslanComputerStudent = StudentProgrammer(firstName: "Aslan", lastName: "Arapbaev")

aslanComputerStudent.minimumHoursOfPracticeSwift
(aslanComputerStudent as Student2).grades

//aslanComputerStudent as? Student

(aslanComputerStudent as? Person)?.firstName   //An optional downcast (to a subtype)

(aslanComputerStudent as! Student2).recordGrade(computerScience)   // A forced downcast.
//(aslanComputerStudent as! Car).recordGrade(computerScience)   //error unrelated type

if let aslanStudent = aslanComputerStudent as? Student2 {
    print("Success")
}

var personJohn = Person(firstName: "John", lastName: "Simpson")

personJohn = aslanStudent

//personJohn.grades // error

(personJohn as? Student2)?.grades



func afterClassActivity(for student: Student2) -> String {
    "Goes home!"
}

func afterClassActivity(for student: StudentProgrammer) -> String {
    "Goes to practice!"
}

afterClassActivity(for: johnStudent)
afterClassActivity(for: johnProgrammer as Student2)

//bbbb
