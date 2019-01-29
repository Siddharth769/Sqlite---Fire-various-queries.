//
//  DetailViewController.swift
//  PostTest10
//
//  Created by siddharth on 29/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calculateValuesLabel: UILabel!
    
    var employeeAray: [Employee]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeAray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
            let detail = employeeAray![indexPath.row]
            let doublevalue = detail.salary
            let doublevalueString = "\(String(describing: doublevalue))"
            cell.firstNameLabel.text = detail.firstName
            cell.lastNameLabel.text = detail.lastName
            cell.iDLabel.text = String(detail.id)
            cell.salaryLabel.text = doublevalueString
            cell.jobIDLabel.text = detail.jobID
            return cell
        }
    
}
