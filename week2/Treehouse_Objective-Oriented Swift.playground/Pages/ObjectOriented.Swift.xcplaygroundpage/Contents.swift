//: Playground - noun: a place where people can play

let x1 = 0
let y1 = 0

let coordinate1:(x: Int,y: Int) = (0,0)
coordinate1.x

struct Point{
    let x:Int
    let y:Int

    //Returns the surrending points in range of
    //the current one
    //func後面用=可以代表預設1
    func points(inRange range:Int = 1) -> [Point] {
        //=var results:[Point] = []
        var results = [Point]()

        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range

        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range

        //method is any function that is associated a particular type
        //因為function直接連結上方的Pointa因此被稱為method而非function
        //用for loop抓到所有可能fire的位置，存在result裡
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange{
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange{
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}

//coordinatePoint繼承Point的屬性後，用point的method就能抓到可能發射的地方
let coordinatePoint = Point(x: 34, y: 3)
coordinatePoint.x
coordinatePoint.points()

let coordinatePoint2 = Point(x: 3, y: 4)
coordinatePoint2.y
coordinatePoint2.points()

//Enemies
//Enemy是Superclass
class Enemy{
    var life:Int = 2
    let position:Point

    init(x:Int,y:Int) {
        //position繼承上面的Point內容
        self.position = Point(x: x, y: y)
    }
    func decreaseLife(by factor:Int){
        //呼叫decreaseLife會減少factor存在life
        life -= factor
    }
}
//繼承inheritance
//SuperEnemy是Subclass
//Intializing a Subclass
//1.Provide values for properties of the subclass
//2.Once the subclass is initialized,provide values for properties of the base class
//Subclass要override init然後再init前面加super，拿取superclass的東西時加上self
class SuperEnemy:Enemy{
    let isSuper:Bool = true
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.life = 50

    }
}

// Towers
class Tower{
    let position:Point
    var range:Int = 1 //default
    var strength:Int = 1
    
    init(x:Int,y:Int){
        self.position = Point(x: x, y: y)
    }

//an argument label and a parameter name.
    func fire(at enemy:Enemy){
        if isInRange(of: enemy) {
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        }else{
            print("Out of range")
        }
    }

    func isInRange(of enemy:Enemy) -> Bool {
        let availablePositions = position.points(inRange: range)
        for point in availablePositions{
            if point.x == enemy.position.x && point.y == enemy.position.y{
                return true

        }
    }
        return false
    }
}

class LaserTower:Tower{
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    override func fire(at enemy: Enemy) {
        while enemy.life >= 0 {
            enemy.decreaseLife(by: strength)
        }
        print("Enemy destroyed!")
    }
}



let bug = Enemy(x: 22, y: 33)
let tower = Tower(x: 21, y: 32)
tower.fire(at: bug)
let superEnemy = SuperEnemy(x: 23, y: 22)
let laserTower = LaserTower(x: 2, y: 2)

tower.fire(at: bug)
laserTower.fire(at: bug)
laserTower.fire(at: superEnemy)




//**************************declaring-a-struct**************************
//In this task, we're going to create our first struct. Declare a struct named User.
//Give it two constant stored properties - name of type String and age of type Int.
//==============================answer===========================
//struct User{
//    let name:String
//    let age:Int
//}
//**************************creating-an-instance**************************
//Struct definitions are simply blueprints and to use them we need to create an instance. I've declared a struct in the editor.
//Create an instance of the struct and assign the values "Animal Farm", "George Orwell" and 6.00 to the title, author and price properties respectively.
//Assign this instance to a constant named myBook.
//==============================answer===========================
//struct Book {
//    let title: String
//    let author: String
//    let price: Double
//}
//let myBook = Book(title:"Animal Farm",author:"George Orwell",price:6.00)
//
//
//*******************adding-instance-methods************************
//Challenge Task 2 of 1
//Given the struct below in the editor, we want to add a method that returns the person’s full name. Declare a method named fullName() that returns a string containing the person’s full name. Note: Make sure to allow for a space between the first and last name
//==============================answer===========================
//struct Person {
//    let firstName: String
//    let lastName: String
//    func fullName() -> String{
//        return "\(firstName) \(lastName)"
//    }
//}
//let Alice = Person(firstName: "Alice", lastName: "Chang")
//
//*******************adding-instance-methods************************
//Challenge Task 2 of 2
//Let's use the struct to create an instance of Person and assign it to a constant named aPerson. Assign any values you want to the first and last name properties.
//Once you have an instance, call the instance method and assign the full name to a constant named myFullName.
//==============================answer===========================
//struct Person {
//    let firstName: String
//    let lastName: String
//    func fullName() -> String{
//        return "\(firstName)" + " " + "\(lastName)"
//    }
//}
//
//let aPerson = Person(firstName: "Alice", lastName: "Chang")
//let myFullName = aPerson.fullName()
//
//*******************custom-initializers************************
//In the editor, I’ve declared a struct named RGBColor that models a color object in the RGB space.
//
//
//Your task is to write a custom initializer method for the object. Using the initializer assign values to the first four properties. Using the values assigned to those properties create a value for the description property that is a string representation of the color object.
//
//
//For example, given the values 86.0 for red, 191.0 for green, 131.0 for blue and 1.0 for alpha, each of the stored properties should hold these values and the description property should look like this:
//
//
//"red: 86.0, green: 191.0, blue: 131.0, alpha: 1.0"
//==============================answer===========================
//struct RGBColor {
//    let red: Double
//    let green: Double
//    let blue: Double
//    let alpha: Double
//    let description: String
//    // Add your code below
//
//    init(red: Double, green: Double, blue: Double, alpha: Double){
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//        // description不用加self因為不用回傳在init裡
//        description = "red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
//    }
//}
//
//*******************instances-of-classes************************
//Challenge Task 1 of 1
//Let's get in some practice creating a class. Declare a class named Shape with a variable property named numberOfSides of type Int.
//
//
//Remember that with classes you are required to write an initializer method.
//
//
//Once you have a class definition, create an instance and assign it to a constant named someShape.
//
//
//==============================answer===========================
//class Shape{
//    let numberOfSides:Int
//    init(numberOfSides:Int){
//        self.numberOfSides = numberOfSides
//    }
//}
//let someShape = Shape(numberOfSides: 43)
//
//*******************classes-with-custom-types************************
//In the editor you've been provided with a struct named Location that models a coordinate point using longitude and latitude values.
//
//
//For this task we want to create a class named Business. The class contains two constant stored properties: name of type String and location of type Location.
//
//
//In the initializer method pass in a name and an instance of Location to set up the instance of Business. Using this initializer, create an instance and assign it to a constant named someBusiness.
//
//==============================answer===========================
//location利用上面的Location直接傳入xy使用
//struct Location {
//    let latitude: Double
//    let longitude: Double
//}
//
//class Business{
//    var name:String
//    var location:Location
//    init(name:String,x:Double,y:Double){
//        self.name = name
//        self.location = Location(latitude:x,longitude:y)
//    }
//}
//
//let someBusiness = Business(name: "taiwan", x: 23.5531, y: 121.0211)
//
//*******************creating-a-subclass************************
//In the editor, I have provided a class named Vehicle.
//
//
//Your task is to create a subclass of Vehicle, named Car, that adds an additional stored property numberOfSeats of type Int with a default value of 4.
//
//
//Once you've implemented the Car class, create an instance and assign it to a constant named someCar.
//==============================answer===========================
//class Vehicle {
//    var numberOfDoors: Int
//    var numberOfWheels: Int
//
//    init(withDoors doors: Int, andWheels wheels: Int) {
//        self.numberOfDoors = doors
//        self.numberOfWheels = wheels
//    }
//}
//
//class Car: Vehicle{
//    var numberOfSeats:Int
//    //subclass的init放得跟superclass一樣，在下面就要用super.init
//    //反之用self就好
//    init(withDoors doors: Int, andWheels wheels: Int,andSeats seats:Int){
//        self.numberOfSeats = seats
//        super.init(withDoors: doors, andWheels: wheels)
//    }
//}
//
//let someCar = Car(withDoors: 2, andWheels: 3, andSeats: 5)
//
//*******************overriding-methods************************
//I've provided a base class Person in the editor below. Once an instance of Person is created, you can call fullName() and get a person's full name.
//
//
//Your job is to create a class named Doctor that overrides the fullName() method. Once you have a class definition, create an instance and assign it to a constant named someDoctor.
//
//
//For example, given the first name "Sam", and last name "Smith", calling fullName() on an instance of Person would return "Sam Smith", but calling the same method on an instance of Doctor would return "Dr. Smith".
//
//==============================answer===========================
//class Person {
//    let firstName: String
//    let lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
//}
//
//class Doctor:Person{
//    override init(firstName: String, lastName: String) {
//        super.init(firstName: firstName, lastName: lastName)
//    }
//
//    override func fullName() -> String {
//        return "Dr. \(lastName)"
//    }
//}
//
//let someDoctor = Doctor(firstName: "Alice", lastName: "Chang")
//someDoctor.fullName()
