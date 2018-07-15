struct User{
    var fullName:String
    var email:String
    var age:Int
}

var someUser = User(fullName: "Alice", email: "wl027226912@gmail.com", age: 22)

var  anotherUser = someUser

someUser.email = "newemail"

anotherUser.email
//sturcet是value type是用複製的
//struct的物件複製之後，修改原先的檔案，新的物件不會改變
//用在簡單的data或value

class Person{
    var fullName:String
    var email:String
    var age:Int
    init(fullName:String,email:String,age:Int) {
        self.fullName = fullName
        self.email = email
        self.age = age
    }
}

var somePerson = Person(fullName: "Alice", email: "wl02722691@gmail.com", age: 22)

let antorherPerson = somePerson

somePerson.email = "newemail"

anotherUser.email
//class是refernce type不是用複製的
//class的物件複製之後，修改原先的檔案，新的物件會改變
