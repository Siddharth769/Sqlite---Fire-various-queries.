//
//  ViewController.swift
//  PostTest10
//
//  Created by siddharth on 28/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var employees = [Employee]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        employees = Database.instance.getEmployees()

    }
 
    @IBAction func descOrderButton(_ sender: Any) {
        employees = Database.instance.getEmployeeByFirstNameInDescendingOrder()
        performSegue(withIdentifier: "orderByDescSegue", sender: employees)

    }
    
    @IBAction func avgSalaryCountButton(_ sender: Any) {
        employees = Database.instance.getAvgSalAndCount()
        performSegue(withIdentifier: "avgSalCountSegue", sender: employees)
    }
    
    @IBAction func salaryaRangeButton(_ sender: Any) {
        employees = Database.instance.getSalaryRange()
        performSegue(withIdentifier: "salaryRangeSegue", sender: employees)

    }
    
    @IBAction func lastNameLE6Button(_ sender: Any) {
        employees = Database.instance.getLastName6()
        performSegue(withIdentifier: "lastName6CharSegue", sender: employees)
  
    }
    
    @IBAction func maxMinAvgSumButton(_ sender: Any) {
        employees = Database.instance.getAvgMinMax()
        performSegue(withIdentifier: "maxMinSumAvgSegue", sender: employees)
    }
    
    @IBAction func sameJobButton(_ sender: Any) {
        employees = Database.instance.getsameJob()
        performSegue(withIdentifier: "sameJobSegue", sender: employees)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderByDescSegue" {
            let destination = segue.destination as! DetailViewController
            destination.employeeAray = employees
        }
        
        if segue.identifier == "salaryRangeSegue" {
            let destination = segue.destination as! DetailViewController
            destination.employeeAray = employees
        }
        
        if segue.identifier == "lastName6CharSegue" {
            let destination = segue.destination as! DetailViewController
            destination.employeeAray = employees
        }
        
        if segue.identifier == "sameJobSegue" {
            let destination = segue.destination as! DetailViewController
            destination.employeeAray = employees
        }
        
        if segue.identifier == "avgSalCountSegue" {
            let destination = segue.destination as! ViewController2
            destination.employeeAray2 = employees
        }
        
        if segue.identifier == "maxMinSumAvgSegue" {
            let destination = segue.destination as! ViewController2
            destination.employeeAray2 = employees
        }
        
    }
    

}

