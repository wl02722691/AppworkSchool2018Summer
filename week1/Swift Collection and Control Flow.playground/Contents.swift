//Array

//1.Please create an empty array with String data type and save it in a variable named myFriends​.
var myFriends​: [String] = []

//2.I have three friends, ‘Ian’, ‘Bomi’, and ‘Kevin’. Please help me to add their name in to myFriends​ array.
myFriends​ = myFriends​ + ["Ian","Bomi","Kevin"]

//3.I forget to add ‘Michael’ who is one of my best friend. Please help me to add Michael tothe end of ​myFriends​ array.
myFriends​.append("Michael")
print(myFriends​)

//4.Because I usually hang out with Kevin, please move Kevin to the begin of the ​myFriendsarray.
myFriends​.insert("Kevin", at: 0)
myFriends​.remove(at: 3)
print(myFriends​)

//5.Use for...each to print all the friend in ​myFriends​​array.
myFriends​.forEach { (all) in
    print(all)
}

//6.Now I want to know who is at index 5 in the ​myFriends​ array. Find the answer for me.Please explain how do you get your answer and why the answer is it.
//print(myFriends​[5])
//fatal error: Index out of range.
//because the index of myFriend ranges from 0 to 3

//7.How to get the first element in an array?
//
myFriends​.first

//8.How to get the last element in an array?
myFriends​.last

//Dictionary
//1.Please create an dictionary with keys of type String, value of type Int, and save it in avariable named ​myCountryNumber​.
var myCountryNumber​:[String:Int] = [:]
//2.Please add three keys ‘US’, ‘GB’, ‘JP’ with values 1, 44 , 81.
myCountryNumber​ = ["US":1,"GB":44,"JP":81]
//3.Change the ‘GB’ value from 44 to 0.
myCountryNumber​["GB"] = 0
print(myCountryNumber​)

//4.How to declare a empty dictionary ?
var emptyDict:[String:Int] = [:]

//For, While, Repeat
//1.Please use for-in loop and Range to print the last three members in the ​lottoNumbersarray
let lottoNumbersarray = [10,9,8,7,6,5]
for lastThree in lottoNumbersarray[3...5]{
    print(lastThree)
}
//2.When use for-in loop, we make the computer do the same thing multiple times. But the index in for-in loop is increasing by 1. What if we want to decreasing by -1 ? What if we want to increasing by 2 ? Please use loop to get the result in the console
print("for-in loop 5 to 10")
for i in 5...10{
    print(i)
}
print("for-in loop 10 to 6")
for i in stride(from: 10, to: 4, by: -2){
    print(i)
}

//3.Please use while loop to solve above question
print("while loop 5 to 10")
var num = 5
while num <= 10 {
    print("\(num)")
    num += 1
}
print("while loop 10 to 6")
var num2 = 10
while num2 > 5{
   print("\(num2)")
   num2 -= 2
}


//4.Please use repeat-while loop to solve question 2.
print("repeat-while 5 to 10")
var num3 = 5
repeat {
    print("\(num3)")
    num3 += 1
} while num3 <= 10
print("repeat-while 10 to 6")
var num4 = 10
repeat {
    print("\(num4)")
    num4 -= 2
} while num4 >= 5

//If statement
//Here is variable ​isRaining​ to record the weather. Please write a statement that if theweather is raining, print ​“It’s raining, I don’t want to work today.”​, otherwise print ​“Althoughit’s sunny, I still don’t want to work today.”
var isRaining = false
if isRaining {
    print("It’s raining, I don’t want to work today.")
}else{
    print("Althoughit’s sunny, I still don’t want to work today.")
}

//Switch
//1.In a company, we usually use number to represent job level. Let’s make a sample. Wehave four job levels : Member, Team Leader, Manager, Director. We use 1 to present Member, 2 to Team Leader, 3 to Manager, 4 to Director.Create a variable name ​jobLevel​ and assign a number to it. If jobLevel number is in ourlist, print the relative job title name. If not, just print ​“We don't have this job”​. Please useswitch statement to complete this requirement.
var jobLevel = 0
switch jobLevel {
case 1:
    "Member"
case 2:
    "Team Leader"
case 3:
    "Manager"
case 4:
    "Director"
default:
    "We don't have this job"
}

