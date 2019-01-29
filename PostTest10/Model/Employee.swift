//
//  Employee.swift
//  PostTest10
//
//  Created by siddharth on 28/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import Foundation

class Employee {
    
    var id: Int
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    //var hire_date: NSDate?
    var jobID: String?
    var salary: Double?
    var commission_pct: Double?
    var managerID: Int?
    var departmentID: Int?
    
    var idCount: Int
    var avgSal: Double
    var maxSal: Double
    var minSal: Double
    var sumSal: Double
    
    init(id: Int) {
        self.id = id
        firstName = ""
        lastName = ""
        email = ""
        phone = ""
        jobID = ""
        salary = 0.0
        commission_pct = 0.0
        managerID = 0
        departmentID = 0
        idCount = 0
        avgSal = 0.0
        maxSal = 0.0
        minSal = 0.0
        sumSal = 0.0
        
        
    }
    
    init(idCount: Int, avgSal: Double) {
        self.id = 0
        firstName = ""
        lastName = ""
        email = ""
        phone = ""
        jobID = ""
        salary = 0.0
        commission_pct = 0.0
        managerID = 0
        departmentID = 0
        self.idCount = idCount
        self.avgSal = avgSal
        maxSal = 0.0
        minSal = 0.0
        sumSal = 0.0
    }
    
    init(avgSal: Double, maxSal: Double, minSal: Double, sumSal: Double) {
        self.id = 0
        firstName = ""
        lastName = ""
        email = ""
        phone = ""
        jobID = ""
        salary = 0.0
        commission_pct = 0.0
        managerID = 0
        departmentID = 0
        idCount = 0
        self.avgSal = avgSal
        self.maxSal = maxSal
        self.minSal = minSal
        self.sumSal = sumSal
    }
    
    init(id:Int, firstName: String?, lastName: String?, email: String?, phone: String?, jobID: String?, salary: Double?, commission_pct: Double?, managerID: Int?, departmentID: Int?){
            self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.jobID = jobID
        self.salary = salary
        self.commission_pct = commission_pct
        self.managerID = managerID
        self.departmentID = departmentID
        idCount = 0
        avgSal = 0.0
        maxSal = 0.0
        minSal = 0.0
        sumSal = 0.0

    }

}


