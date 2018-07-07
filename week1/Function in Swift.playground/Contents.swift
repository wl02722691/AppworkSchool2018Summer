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


//4.What is the return type in the following statements?
//birthday的return type 是 String
//birthday的return type 是 Double


//Others
//Please describe how to establish a github repo and how to upload the local projects to    github. Try to explain it as detail as possible.
//1.先辦github帳號
//2.開啟終端機
//3.先cd到要上傳的檔案
//4.git init讓git開始監視檔案
//5.git status看一下狀態，一開始應該在branch master
//6.輸入git add .將git放到暫存區
//7.git commit -m "寫程式目前的狀態"
//8.git remote add origin https://github.com/wl02722691/AppworkSchool2018Summer.git（填寫在github上的http）
//9.git remote -v 檢查一下狀態-v代表詳情
//10.git push origin master把本地的狀態推到github

