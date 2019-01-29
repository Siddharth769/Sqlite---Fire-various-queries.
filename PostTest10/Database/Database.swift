//
//  Database.swift
//  PostTest10
//
//  Created by siddharth on 28/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import Foundation
import SQLite

class Database {
    var employeeArray = [Employee]()
    
    static let instance = Database()
    private var db: Connection? = nil
    
    private var employee = Table("Employee")
    private var id = Expression<Int>("id")
    private var firstName = Expression<String?>("firstName")
    private var lastName = Expression<String?>("lastName")
    private var email = Expression<String?>("email")
    private var phone = Expression<String?>("phone")
    //private var hireDate = Expression<NSDate?>("phone")
    private var jobID = Expression<String>("jobID")
    private var salary = Expression<Double>("salary")
    private var commission_pct = Expression<Double>("commission_pct")
    private var managerID = Expression<Int>("managerID")
    private var departmentID = Expression<Int>("departmentID")

//
//    let querry1String = "SELECT * FROM Employee ORDER BY firstName DESC;"
//    let querry2String = "SELECT AVG(salary), COUNT(*) FROM Employee;"
//    let querry3String = "SELECT firstName, lastName, salary FROM Employee WHERE salary NOT BETWEEN 10000 AND 20000;"
//    let querry4String = "SELECT lastName FROM Employee WHERE lastName LIKE '______';"
//    let querry5String = "SELECT jobID, COUNT(*) FROM Employee GROUP BY jobID;"
//    let querry6String = "SELECT ROUND(MAX(salary),0) 'Maximum', ROUND(MIN(salary),0) 'Minimum', ROUND(SUM(salary),0) 'Sum', ROUND(AVG(salary),0) 'Average', firstName FROM Employee;"
//
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/Database3.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTable()
    }
  
}



extension Database {

    func getEmployees() -> [Employee] {
        
        do {
            for user in try db!.prepare(self.employee) {
                employeeArray.append(Employee(id: user[id], firstName: user[firstName], lastName: user[lastName], email: user[email], phone: user[phone], jobID: user[jobID], salary: user[salary], commission_pct: user[commission_pct], managerID: user[managerID], departmentID: user[departmentID]))
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
    
    func getEmployeeByFirstNameInDescendingOrder()-> [Employee]{
 
        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(id, firstName).order(firstName.desc)) {
                print("id: \(String(describing: user[id])), firstname: \(String(describing: user[firstName]))")
                
                employeeArray.append(Employee(id: user[id], firstName: user[firstName], lastName: "", email: "", phone: "", jobID: "", salary: nil, commission_pct: nil, managerID: nil, departmentID: nil))
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
    
    func getAvgSalAndCount()-> [Employee]{
        
        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(salary.average, id.count).limit(1)) {
                print("average Salary: \(String(describing: user[salary.average])), idcount: \(String(describing: user[id.count]))")
                employeeArray.append(Employee(idCount: user[id.count], avgSal: user[salary.average]!))
                
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
       
    }

    func getSalaryRange()-> [Employee] {
        
        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(firstName, lastName, salary).where(20000<salary && salary>30000)) {
                print("firstname: \(String(describing: user[firstName])), lastname: \(String(describing: user[lastName])), salary: \(user[salary]))")
                 employeeArray.append(Employee(id: 0, firstName: user[firstName], lastName: user[lastName], email: "", phone: "", jobID: "", salary: user[salary], commission_pct: nil, managerID: nil, departmentID: nil))
                
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
    
    
    func getLastName6()-> [Employee] {
        
        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(lastName).where(lastName.like("______"))) {
                print("lastname: \(String(describing: user[lastName]))")
                employeeArray.append(Employee(id: 0, firstName: "", lastName: user[lastName], email: "", phone: "", jobID: "", salary: nil, commission_pct: nil, managerID: nil, departmentID: nil))
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
    
    func getsameJob()-> [Employee] {
        
        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(jobID, id.count).group(jobID)) {
                print("jobID: \(String(describing: user[jobID])), idcount: \(String(describing: user[id.count]))")
                employeeArray.append(Employee(id: 0, firstName: "", lastName: "", email: "", phone: "", jobID: user[jobID], salary: nil, commission_pct: nil, managerID: nil, departmentID: nil))
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
    
    func getAvgMinMax()-> [Employee]{

        do {
            employeeArray.removeAll()
            for user in try db!.prepare(employee.select(salary.max.round(0), salary.min.round(0), salary.sum.round(0), salary.average)) {
                print("maxSal: \(String(describing: user[salary.max.round(0)])), minSal: \(String(describing: user[salary.min.round(0)])), sumSal: \(String(describing: user[salary.sum.round(0)])), avgSal: \(String(describing: user[salary.average]))")
                employeeArray.append(Employee(avgSal: user[salary.average]!, maxSal: user[salary.max.round(0)]!, minSal: user[salary.min.round(0)]!, sumSal: user[salary.sum.round(0)]!))   
            }
        }catch {
            print("Select failed")
        }
        return employeeArray
    }
}


extension Database {
    
    
    func createTable() {
        do {
            try db!.run(employee.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
                table.column(email, unique: true)
                //table.column(salary)
                table.column(phone)
                table.column(jobID)
                table.column(salary)
                table.column(commission_pct)
                table.column(managerID)
                table.column(departmentID)
            })
        } catch {
            print("Unable to create table")
        }
        
                let insertQuery = employee.insert(firstName <- "Alice", lastName <- "Graham", email <- "alice@gmail.com", phone <- "1111111111", jobID <- "AGJob", salary <- 20000.0, commission_pct <- 15.0, managerID <- 12, departmentID <- 2)
        
                let insertQuery2 = employee.insert(firstName <- "Ananya", lastName <- "Srivastav", email <- "ananya@gmail.com", phone <- "222222222", jobID <- "ASJob", salary <- 25000.0, commission_pct <- 25.0, managerID <- 12, departmentID <- 2)
        
                let insertQuery3 = employee.insert(firstName <- "Bill", lastName <- "Gates", email <- "bill@gmail.com", phone <- "3333333333", jobID <- "BGJob", salary <- 50000.0, commission_pct <- 45.0, managerID <- 1, departmentID <- 1)
        
                let insertQuery4 = employee.insert(firstName <- "Steve", lastName <- "Jobs", email <- "steve@gmail.com", phone <- "4444444444", jobID <- "SJJob", salary <- 4500000.0, commission_pct <- 35.0, managerID <- 1, departmentID <- 1)
        
                let insertQuery5 = employee.insert(firstName <- "Clinton", lastName <- "Jacks", email <- "clinton@gmail.com", phone <- "5555544444", jobID <- "CJJob", salary <- 4000000.0, commission_pct <- 35.0, managerID <- 12, departmentID <- 1)
        
                let insertQuery6 = employee.insert(firstName <- "Francis", lastName <- "Adams", email <- "francis@gmail.com", phone <- "7777777777", jobID <- "FAJob", salary <- 2000000.0, commission_pct <- 15.0, managerID <- 1, departmentID <- 2)
        
                let insertQuery7 = employee.insert(firstName <- "Richard", lastName <- "Sky", email <- "richard@gmail.com", phone <- "3333544444", jobID <- "RSJob", salary <- 3000000.0, commission_pct <- 25.0, managerID <- 12, departmentID <- 2)
        
                let insertQuery8 = employee.insert(firstName <- "Amanda", lastName <- "Cerny", email <- "amanda@gmail.com", phone <- "3335544444", jobID <- "ACJob", salary <- 4000000.0, commission_pct <- 35.0, managerID <- 12, departmentID <- 1)
        
                let insertQuery9 = employee.insert(firstName <- "Richelle", lastName <- "Manhattan", email <- "michelle@gmail.com", phone <- "4455544444", jobID <- "RMJob", salary <- 3300000.0, commission_pct <- 15.0, managerID <- 1, departmentID <- 1)
        
                let insertQuery10 = employee.insert(firstName <- "Marcus", lastName <- "Holloway", email <- "marcus@gmail.com", phone <- "555324444", jobID <- "MHJob", salary <- 38000000.0, commission_pct <- 35.0, managerID <- 12, departmentID <- 1)
        
                do{
                    let rowID = try db?.run(insertQuery)
                    let rowID2 = try db?.run(insertQuery2)
                    let rowID3 = try db?.run(insertQuery3)
                    let rowID4 = try db?.run(insertQuery4)
                    let rowID5 = try db?.run(insertQuery5)
                    let rowID6 = try db?.run(insertQuery6)
                    let rowID7 = try db?.run(insertQuery7)
                    let rowID8 = try db?.run(insertQuery8)
                    let rowID9 = try db?.run(insertQuery9)
                    let rowID10 = try db?.run(insertQuery10)
        
                }catch { print("Error inserting table entries") }
        
                do {
                    for user in try db!.prepare(employee) {
                        print("id: \(user[id]), first name: \(String(describing: user[firstName])), last name: \(String(describing: user[lastName])), email: \(String(describing: user[email])), phone number: \(String(describing: user[phone])), job id: \(user[jobID]), salary: \(user[salary]), commisiion: \(user[commission_pct]), manager id: \(user[managerID]), department: \(user[departmentID])")
                    }
                } catch {
                    print("Error printing db table to console")
                }
        
    }
}
