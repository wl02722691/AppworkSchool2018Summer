//1.Please declare a function named ​greet​ with ​person​ as argument label and parametername. ​greet​ method will return a String. For example, if you call the method greet like:greet​(person: ​"Celeste"​)It will return string: ​“Hello, Celeste”​.

func greet​(person:String){
    print("Hello,\(person)")
}
greet​(person: "Celest")


//2.Please declare a method named ​multiply​ with two argument ​a​ , ​b​ , and with no returnvalue. When you call this method, compiler will print out  the result of ​a * b​. Notice that wewant to give argument ​b​ with a default value 10. Please implement this requirement.
func multiply(a:Int,b:Int=10){
    _ = a * b
  }
multiply(a: 3)
multiply(a: 21, b: 3223)


//3.What is the difference between argument label and pararmeter label in function ?
//Parameter Names” 和 “Argument Labels”, 其實就是function內/外名字，可以增加可讀性。
//The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent
//單純使用argument labels的狀況在24行就會有冗字的感覺
//func move(origin: String, destination: String) -> String {
//    return "Move from \(origin) to \(destination)."
//}
//let string = move(origin: "Tokyo", destination: "Taipei")
//print(string)
//設計上若Parameter Namesm與Argument Labels兼用，在30行中用from跟to就可以很明顯地瞭解其解讀性
func move(from origin: String, to destination: String) -> String {
    return "Move from \(origin) to \(destination)."
}
let string = move(from: "Tokyo", to: "Taipei")
print(string)

//4.What is the return type in the following statements?
//birthday的return type 是 String

//birthday的return type 是 Double
//Others



//Please describe how to establish a github repo and how to upload the local projects to github. Try to explain it as detail as possible.
//1.先辦github帳號cd
//2.開啟終端機
//3.先到要上傳的檔案
//4.git init讓git開始監視檔案
//5.git status看一下狀態，一開始應該在branch master
//6.輸入git add .將git放到暫存區
//7.git commit -m "現在狀況"
//8.git remote add origin https://github.com/wl02722691/AppworkSchool2018Summer.git（填寫在github上的http）
//9.git remote -v 檢查一下狀態-v代表詳情
//10.git push origin master把本地的狀態推到github

