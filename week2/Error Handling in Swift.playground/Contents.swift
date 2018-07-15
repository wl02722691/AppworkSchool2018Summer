//See the code above, just copy the code and paste in the playground file. There is an errorinside the code.
//1.Please solve the error by adding addition code in the file. Do not remove or modify thecode above.


enum GuessNumberGameError: Error {
    case wrongNumber
}

class GuessNumerGame {
    var targetNumber =  10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}


//2.Call ​guess(number:)​ and pass 20 as argument.

try GuessNumerGame().guess(number: 20)
