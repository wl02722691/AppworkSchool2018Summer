
//方法1
let week = ["Sunday","Monday","Tuesday","Wednesday","Thurday","Firday","Saturday"]
func dayType(for day:String)->String{
    switch day {
    case "Saturday","Sunday":
        return "Weekend"
    case "Monday","Tuesday","Wednesday","Thurday","Firday":
        return"Week"
    default:
        return "This isn't a vaild day in the Western calendar"
    }
}

func isNotification(on day:String) -> Bool{
    if day == "Weekend"{
        return true
    }else{
        return false
    }
}


//let result = dayType(for: Monday) 即使直接輸入文字isMuted還是會成功顯示
//let result = dayType(for: Moonday) 也容易輸入錯誤而導致編譯錯誤
let result = dayType(for: week[2])
let isMuted = isNotification(on: result)

//方法2:enum
enum Day:Int{
    case Sunday = 1,Monday,Tuesday,Wednesday,Thurday,Firday,Saturday
}
Day.Sunday.rawValue
Day.Firday.rawValue
//就算只有sunday給值 查詢Firday也會自動有值

enum Daytype{
    case weekday,weekend
}
//雖然跟上面的func dayType名字相同也都是func，但輸入的東西一個是String一個是Day就不會error
func dayType(on day:Day)->Daytype{
    switch day {
    case .Saturday,.Sunday:
        return .weekend
    default:
        return .weekday
    }
}

func isNotification(on day:Daytype) -> Bool{
    switch day {
    case .weekend:
        return true
    default:
        return false
    }
}

let enumResult = dayType(on: .Firday)
let enumIsMuted = isNotification(on: enumResult)



//methods-on-enumerations
//import UIKit
//
//enum ColorComponent{
//    case rgb(red:Float,green:Float,blue:Float,alpha:Float)
//    case hsb(hue:CGFloat,saturation:CGFloat,brightness:CGFloat,alpha:CGFloat)
//    func color () -> UIColor{
//        switch self {
//        case .rgb(let red, let green, let blue, let alpha):
//            //return #colorLiteral (red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
//            //影片中colorLiteralRed的已經不能用了，colorLiteralRed had been depreaced in the newer versions of Swift
//            //rgb的數字最高是255
//            //可以寫成下面這樣或直接把上面的rgb(Float,Float,Float,Float)改成CGFloat
//            return UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: CGFloat(alpha))
//        case .hsb(let hue, let saturation, let brightness, let alpha):
//            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
//
//        }
//    }
//}
////let UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
////我其實都這樣用colorLiteral進化變這樣
//
//ColorComponent.hsb(hue: 321, saturation: 32, brightness: 32, alpha: 1).color()
//ColorComponent.rgb(red: 200, green: 324, blue: 323, alpha: 1).color()

enum Coin:Double{
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let conins:[Coin] = [.penny,.dime,.dime,.quarter,.quarter,.quarter]
func sum(having coins:[Coin])->Double{
    var total:Double = 0
    for coin in coins {
        total += coin .rawValue
        }
    return total
    }


sum(having: conins)

enum HTTP:String{
    case post
    case get
    case put
}

//initializing-with-raw-values

HTTP.post.rawValue

enum HTTPStatusCode:Int{
    case success = 200
    case forbidden = 403
    case unauthorized = 401
    case notFound = 404
}
let statusCode = 540
let httpStatusCode2 = HTTPStatusCode(rawValue: statusCode)
if let httpStatusCode = HTTPStatusCode(rawValue: statusCode){
    print(httpStatusCode)
}


//自動抓到String的名字

//===============creating-an-enum===============
//Let's get in some practice creating a basic enum. Declare an enum named Direction with the members left, right, up, down.
//*******************Answer*******************
//enum Direction {
//    case left
//    case right
//    case up
//    case down
//}
//===============enums-and-objects===============
//In the editor below you have two objects - classes named Point and Robot. The Robot stores its location as a point instance and contains a move function.
//
//
//The task of this challenge is to complete the implementation for move. Move takes a parameter of type Direction which is an enumeration listing the possible movement directions.
//
//
//When you tell the robot to move up (by specifying Direction.Up as the argument), the y coordinate should increase by 1. Similarly moving down means the y coordinate decreases by 1, moving right means the x coordinate increases by 1 and finally left means x decreases by 1.
//*******************Answer*******************
//class Point {
//    var x: Int
//    var y: Int
//
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//}
//
//enum Direction {
//    case left
//    case right
//    case up
//    case down
//}
//
//
//class Robot {
//    var location: Point
//
//    init() {
//        self.location = Point(x: 0, y: 0)
//    }
//
//    func move(_ direction: Direction)  {
//        switch direction {
//        case .down :
//            location.y -= 1
//        case .left:
//            location.x -= 1
//        case .right:
//            location.x += 1
//        case .up:
//            location.y += 1
//        }
//    }
//}
//===============enums-with-associated-values===============
//
//For this task, let's create a enum named MobilePhone. The enum will have three members: iphone, android and windowsPhone.
//
//
//Each of these members should have a String value as its associated value.
//
//
//Once you have an enum declared, assign the value of the iPhone member with an associated value of "7 Plus" to a constant named iphone

//*******************Answer*******************
//enum MobilePhone{
//    case iphone(String), android(String),indowsPhone(String)
//}
//
//let iphone = MobilePhone.iphone("7 Plus")


//===============enums-with-associated-values===============
//Challenge Task 2 of 1
//In the editor you've been provided with a file buttons.swift that defines a BarButton type.
//
//Let's start simple. Declare a constant named done and assign an enum value of type BarButton with the member done. This member takes an associated value; assign it the string "Save".

//*******************Answer*******************
//
//enum BarButton {
//    case done(title: String)
//    case edit(title: String)
//}
//
//let done = BarButton.done(title: "Save")

//===============enums-with-associated-values===============
//Challenge Task 2 of 2

//Next, add a method to the enum named button that returns an instance of the class UIBarButtonItem configured properly. An example of how to create an instance for this task is shown in the comments below. Use the same initializer.
//
//
//    In the method, using the associated values as titles for the button, return a button with style UIBarButtonStyle.done for the done member of the BarButton enum. Similarly for the edit member, return a UIBarButtonItem instance with the style set to UIBarButtonStyle.plain.
//
//
//In both cases you can pass nil for target and action. Once you have a method, call it on the value we created in the previous task and assign it to a constant named button.

//*******************Answer*******************
//enum BarButton {
//    case done(title: String)
//    case edit(title: String)
//    
//    func button() -> UIBarButtonItem {
//        switch self {
//        case .done(let title): return UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
//        case .edit(let title): return UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
//        }
//    }
//}
//
//let done = BarButton.done(title: "Save")
//let button = done.button()

//===============enums-with-raw-values===============
//Let's get in some practice creating enums with raw values. Declare an enum named Compass with a raw value of type Int.
//
//
//Give the enum 4 members: north, south, east and west and assign them default raw values.
//
//
//Assign the enum value Compass.south to a constant named direction, by using a raw value with Compass' initializer method.
//*******************Answer*******************
enum Compass: Int {
    
    case north = 1
    case south
    case east
    case west
    
}
let direction = Compass(rawValue: 2)
