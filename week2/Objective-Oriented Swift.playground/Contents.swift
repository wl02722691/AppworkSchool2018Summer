//Objective-Oriented Swift

//1.Declare class ​Animal​ with property ​gender​, and method ​eat()​. Data type of gender should be enum Gender as list below. Call eat() method will print ​I eat everything!

class Animal​{
    var gender​:Gender
    init(gender:Gender) {
        self.gender​ = gender
    }
    func eat(){
        print("I eat everything!")
    }
}

enum Gender{
    case male
    case female
    case undefined
}

let cat = Animal​(gender: .female)
cat.eat()


//2.Declare class ​Elephant​, ​Tiger​, ​Horse​ inherit from Animal.Override the eat method to printwhat they usually eat
class Elephant​:Animal​{
    override func eat() {
        print("I eat banana")
    }
}
Elephant​.init(gender: .female).eat()

class Tiger:Animal​{
    override func eat() {
        print("I eat meat")
    }
}
Tiger.init(gender: .male).eat()

class Horse:Animal​{
    override func eat() {
        print("I eat grass")
    }
}
Horse.init(gender: .female).eat()


//3.Declare a class ​Zoo​ with property ​weeklyHot​ which means the most popular one in the zoo this week. The code list below can’t run correctly.Please find what data type should A be, and solve the relative problem. ​Notice that ​tiger​, ​elephant​, ​horse​ are instances of classTiger, Elephant, Horse.
class Zoo {
    var weeklyHot:Animal​?
}
let zoo = Zoo()
let tiger = Tiger(gender: .female)
let elephant = Elephant​(gender: .male)
let horse = Horse(gender: .undefined)

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//4.What have you learned in ​Object-Oriented Swift​ session ?
    //「物件導向程式設計」或者簡稱「OOP」
    //「把一個複雜的軟體分解成許多小部分（或者說是建構模塊），以便能夠更容易地開發及維護。在這裡所指的小部分就是物件，每一個物件都有它的任務，物件間相互協調來讓軟體能順利運作，這就是 OOP 的基本觀念。」
    //「一個物件具有二個特徵：屬性（Property ）與功能性（Functionality ）。我們以一個真實世界的物件來說明—汽車。一台汽車有自己的顏色、型號、最快速度、製造商等，這些都是汽車的屬性。就功能性來看，一台汽車應該可以提供基本的功能如加速、剎車及駕駛等。」
    //「屬性（Properties）：背景、尺寸、顏色及字型就是Uibutton的屬性。
    //功能性（Functionalities）：當按鈕被點擊時，它會判別點擊事件。偵測觸控的能力是 UIButton 的眾多功能之一。」


//5.What is the difference between ​Struct​ and ​Class​ ?
    //1).struct可以整理資料、有 initializer、有 method只是不能繼承，其他都跟class一樣
    //2).class 物件是 reference type資料容易被誤改，struct 物件是 value type資料較「安全」（因為 value type 的特性）
    //3).記憶體分成 heap 和 stack 兩塊。stack 的執行效率會比 heap 好。class 物件是 reference type，會被儲存在 heap。，會被存在 stack。所以一模一樣的事情，交給 struct 做，理論上會比 class 有效率。越新版的 Swift，struct 效能較強這件事越顯著。

//6.What is the difference between ​instance method​ and ​type method​ ?
    //實體方法(instance method)：先需要生成一個特定型別(類別、結構或列舉)的實體，才能使用這個實體裡的方法。
    //有內建屬性 self
    //型別方法(type method)為定義在特定型別(類別、結構與列舉)上的方法。不是屬於實體，而是屬於這個型別(類別、結構或列舉)本身的方法，與實體方法一樣使用點語法(dot syntax)呼叫。
    //宣告型別方法時需要在func前加上關鍵字static。而以類別來說，還可以將static替換成class來允許子類別覆寫(override)父類別的類別方法。
    //不用生成實體就可以直接呼叫型別方法，因為型別方法是屬於一個特定型別(類別、結構與列舉)而不是一個實體。

//7.What does ​Initilizer​ do in class(struct) ?
    //物件初始化 (Initialization) 就是使用初始化函式 (initializer) 設定類別屬性的過程。 初始化函式使用init關鍵字當作函式名稱
    //物件初始化有三種方式：
    //宣告變數(常數)給初始值
    //宣告變數(常數)為 optional
    //在初始化函式中設定初始值 初始值可以是預設值或透過參數傳遞

//8.What does ​self​ means in instance method ?
    //每一個instance method 都有一個隱含屬性叫做self
    //使用這條規則的主要場景是實例方法的某個參數名稱與實例的某個屬性名稱相同的時候。在這種情況下，參數名稱享有優先權，並且在參考屬性時必須使用一種更嚴格的方式。這時使用self屬性來區分參數名稱和屬性名稱。
    //下面的範例中，self消除方法參數x和實例屬性x之間的歧義：
    //struct Point {
    //    var x = 0.0, y = 0.0
    //    func isToTheRightOfX(x: Double) -> Bool {
    //        return self.x > x
    //    }
    //}
//9.What is the difference between ​reference type​ and ​value type​ ?
    //Optional、Enumeration、Integer、Array、Dictionary … 等型別，其實都是以 Structure 來定義的，而 Structure 是 Value Type
    //而class則是value type
    //reference type​資料相對安全;value type​資料容易被誤改
    //reference type​佔記憶體優勢效率高;value type​記憶體關係效率較低
    //reference type​存在記憶體stack;value type​存在記憶體heap「樹狀」的資料結構，合適表示「物件被參考」。所以class有繼承的特性
