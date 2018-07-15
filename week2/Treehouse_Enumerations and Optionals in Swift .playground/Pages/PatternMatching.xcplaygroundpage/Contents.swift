
enum Coin:Double{
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let wallet:[Coin] = [.penny,.dime,.penny,.quarter,.penny,.dime,.penny,.quarter,.penny,.dime,.penny,.quarter]

var count = 0

for coin in wallet{
    switch coin{
    case .quarter :count += 1
    default:continue
    }
}

count = 0

for case .quarter in wallet {
    count += 1
}

for coin in wallet{
    if case .nickel = coin {
        print("not so much money")
    }else if case .dime = coin{
        print("better than nothing")
    }
}

let someOptional :Int? = 32
if case . some(let x) = someOptional{
    print(x)
}
