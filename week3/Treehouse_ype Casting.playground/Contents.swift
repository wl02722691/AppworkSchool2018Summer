class Employee {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class HourlyEmployee: Employee {
    let hourlyWage: Double
    
    init(name: String, hourlyWage: Double) {
        self.hourlyWage = hourlyWage
        super.init(name: name)
    }
    
    func payWages(for hours: Double) -> Double {
        return hourlyWage * hours
    }
}

class SalariedEmployee: Employee {
    let salary: Double
    
    init(name: String, salary: Double) {
        self.salary = salary
        super.init(name: name)
    }
    
    func paySalary() -> Double {
        return salary/24
    }
}

let hourlyEmployee = HourlyEmployee(name: "Taylor", hourlyWage: 12.00)
let salariedEmployee = SalariedEmployee(name: "Lorenzo", salary: 62000)

let employees = [hourlyEmployee, salariedEmployee]

for emplpyee in employees{
    //employees.paySalary無法使用因為emplpyee是繼承Employee裡面沒有paySalary的function
    if employees is HourlyEmployee {
        print("hours")
        //要確認用!的時候100%正確不然會crash
        if let hourlyEmployee = employees as? HourlyEmployee{
        hourlyEmployee.payWages(for: 32)
        }
    }
    
    if employees is SalariedEmployee{
        print("salaried")
        let salariedEmployee = employees as! SalariedEmployee
        salariedEmployee.paySalary()
        }
    }

