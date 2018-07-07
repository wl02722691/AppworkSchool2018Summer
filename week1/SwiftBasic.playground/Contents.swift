import UIKit

//1
//That’s practice this syntax :When mentioning about calculating circle’s area, we use the formula: ​ 2 * radius * PI​ to getarea. Now, please define a variable ​ PI ​ and assign value to it. You can refer to the syntaxabove. But think clearly about using  ​ var ​ or ​ let ​ and which data type you should choose.
var Pi = 3.14159265359

//2
//Create two constants x and y of type ​Int​ and assign with any value.
//Please calculate theaverage of x and y and store the result in a constant named average.
var x = 100000000
var y = 212382103
var average = (x+y)/2

//3
//Following with Q2, now we want to save the average in the record system, but the systemdoesn’t accept 65 but 65.0.
//Please solve this problem so that we can put the average in the record system
//Please explain the difference between ( 10 / 3 ) and ( 10.0 / 3.0 )
//Int.A signed integer value type.整數
//Double. A double-precision, floating-point value type.小數
var x2:Double = 10
var y2:Double = 3
var average2:Double = (x2+y2)/2

//4
//Swift is a very powerful language.
//It can infer the data type for you (​ Type inference ​).
//But we still need to know the basic theory. Please mark the data type in the following
var flag:Bool = true
var inputString:String = "Hello world."
let bitsInBite:Int = 8
let averageScore:Double = 86.8

//5
//Compound assignment ​ operator is very useful when programming.
//Please create salaryas 22000, and use ​addition assignment operator ​ adding 28000 to salary, and it will be 50000 after this process
var salaryas = 22000
salaryas += 28000

//6
//You should notice that ​ ‘=’ ​has difference meaning in programming.
//In real world, ​ ‘=’means equal. In programming, ​ ‘=’ ​ means ​assign​. You simply put the right hand side datainto left hand side variable or constant.
//Now please write down the ​Equality​ operator in swift
var love = "love"
var end = love == "BYE"
print(end)

//7
//Declare two constants and the value are 10 and 3, please calculate the remainder and save the result in a constant ​remain​.
var number1 = 10
var number2 = 3
var remainder = number1 % number2
print(remainder)

//8
//Please explain the difference between​​ let​ and​​ var
//let​中的值不會變動，例如不能變動的考試分數
//var中的值會變動，例如計算的數字

//9
//Please write down naming conventions and rules you learned in this session.
//camel case
//當變數名和函式名稱是由二個或多個單字連結在一起，而構成的唯一識別字時，利用「駝峰式大小寫」來表示，可以增加變數和函式的可讀
#imageLiteral(resourceName: "CamelCase.png")
//cute camel👆
