
struct Person{
    let firsName:String
    let middleName:String?
    let lastName:String
    
//    func fullName() ->String{
////bad way to unwarped不要用!
////        if middleName == nil{
////            return firsName + " " + lastName
////        }else{
////            return firsName + " " + middleName! + " " + lastName
////        }
////    }
//    return
//    }
}
let me = Person(firsName: "Alice", middleName: nil, lastName: "Chang")


let airportCodes = ["CDG":"Charles De Gaulle"]
let newYorkAirport = airportCodes["JFK"]
if let newYork = airportCodes ["JFK"] {
    print(newYork)
}else{
    print("Whoops!That key does not exist!")
}


//Optional Binding Using If Let
let weatherDictionary:[String:[String:String]] = [
    "currently":["temperture":"22.3"],
    "daily" :["temperture":"22.3"],
    "weekly":["temperture":"22.3"]
]

if let dailyWeather = weatherDictionary["daily"],let highTemperture = dailyWeather["temperture"]{
    print(highTemperture)
}else{
    print("nil")
}

//downsides-to-using-if-let
struct Friend{
    let name: String
    let age:String
    let address:String?
    
//    init?(dictionary:[String:String]){
//        return nil
//    }
}

func new(firendDicitonary:[String:String]) -> Friend?{
    if let name = firendDicitonary["name"],let age = firendDicitonary["age"]{
        let address = firendDicitonary ["address"]
        return Friend(name: name, age: age, address: address)
    }else{
        return nil
    }
}

//Early Exit
func newFirend(firendDicitonary:[String:String]) -> Friend?{
    guard let name = firendDicitonary["name"],let age = firendDicitonary["age"] else {
        return nil
    }
    let address = firendDicitonary["address"]
    return Friend(name: name, age: age, address: address)
}

//===============optional-values===============
//    Declare a variable named someValue of type optional Int and assign nil.
//    
//    
//    Note: You will have to explicitly declare the type as an optional Int otherwise the compiler cannot infer it.

//*******************Answer*******************
//var someValue:Int? = nil


//===============nil-values-in-collections===============
//In the editor, you have a pretty complex dictionary representing a movie. It contains a nested dictionary, which itself contains an array of Strings as a value.
//
//
//Your job is to assign the string containing the value for the lead actor (which for the sake of the example is at position 0 in the array) to the variable leadActor.
//
//
//Since dictionaries return optional values, you will have to use an if let statement to unwrap each consecutive operation.

//*******************Answer*******************
//let movieDictionary = ["Spectre": ["cast": ["Daniel Craig", "Christoph Waltz", "Léa Seydoux", "Ralph Fiennes", "Monica Bellucci", "Naomie Harris"]]]
//
//var leadActor: String = ""
//
//// Enter code below
//
//if let movie = movieDictionary["Spectre"], let cast = movie["cast"]{
//    leadActor = cast[0]
//}

//===============nil-values-in-collections===============
//In the editor, you have a struct named Book which has few stored properties, two of which are optional.
//
//
//Your task is to create a failable initializer that accepts a dictionary of type [String : String] as input and initializes all the stored properties. (Hint: A failable init method is one that can return nil and is written as init?).
//
//
//Use the following keys to retrieve values from the dictionary: "title", "author", "price", "pubDate"
//
//
//Note: Give your initializer argument the name dict


//*******************Answer*******************
//struct Book {
//    let title: String
//    let author: String
//    let price: String?
//    let pubDate: String?
//
//    init?(dict: [String: String]) {
//        guard let title = dict["title"], let author = dict["author"] else {
//            return nil
//        }
//
//        self.title = title
//        self.author = author
//        self.price = dict["price"]
//        self.pubDate = dict["pubDate"]
//    }
//
//}
