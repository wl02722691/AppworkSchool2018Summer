//: Playground - noun: a place where people can play
protocol FullNameable{
    var fullName:String{get}
}

struct User:FullNameable{
    //繼承FullNameable的protocol一定要加上內容的fullName不然會error
    //var fullName: Int型態與預設的String不同也會error
    var fullName: String
}

let user = User(fullName: "Alice")

struct Friend:FullNameable{
    let fristName:String
    let middleName:String
    let lastName:String

    var fullName: String{
        return "\(fristName) \(middleName) \(lastName)"
        //protocal用{get}可以接到return的東西
    }
}


let friend = Friend(fristName: "Alice", middleName: "cute", lastName: "beatiful")

friend.fullName

