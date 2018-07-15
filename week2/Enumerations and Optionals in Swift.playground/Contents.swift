//1.There are several gasoline types, 92, 95, 98, and diesel. We can use enum to model them.
//•  Please create enum named ​Gasoline​ to model gasoline.
//•  Every kind of gasoline has price. Please create a method named ​getPrice​ in Gasolineenum. The method will return difference price depend on difference gasoline.
//•  Please establish ​raw value​ for ​Gasoline​. The data type of raw value should be String.       For example, ​Gasoline.92.rawValue​ should be “92”.
//•  Please explain what is enum’s ​associate value​ and how to use it.

enum Gasoline{
    case gasoline92
    case gasoline95
    case gasoline98
    case diesel
    func getPrice()->Double{
        switch self {
        case .gasoline92:
            return 28
        case .gasoline95:
            return 30
        case .gasoline98:
            return 32
        case .diesel:
            return 27
        }
    }
}

let price92 = Gasoline.gasoline92
price92.getPrice()


//2.Optional is a very special data type in swift. Take ​​var​ a: ​Int​? = ​10​​​ for example, the valueof ​a​ will be ​nil​ or ​Int​. You should learn how to deal with optional data type.
//•  People would like to have pets, but not everyone could have one. Declare a class ​Petwith ​name​ property and a class ​People​ with ​pet​ property which will store a Pet instanceor nil​. Please try to figure out what data type is suitable for these properties in Pet andPeople.
//•  Please create a People instance and use ​guard let​ to unwrap the ​pet​ property.
//•  Please create another People instance and use ​if let​ to unwrap the ​pet​ property.
class Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class People {
    var pet: Pet?
}

let Alice = People()
let dog = Pet(name: "kiki")
Alice.pet = dog

func haspet(owner:People) -> String{
    guard let pet = Alice.pet?.name else{
        return "doesn't have any pet"
        }
    return " has a pet. \(pet)"
}
haspet(owner: Alice)


let Vincet = People()

func VincentHasPet(petVincent:People) -> String{
    if let petVincent = Vincet.pet?.name{
        return "Vincent has a pet \(petVincent)"
    }else{
        return "Vincent doesn't have any pet."
    }
}

VincentHasPet(petVincent: Vincet)
//沒有寵物所以不會print喔
