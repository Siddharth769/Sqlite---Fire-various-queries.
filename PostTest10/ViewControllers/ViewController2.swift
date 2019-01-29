//
//  ViewController2.swift
//  PostTest10
//
//  Created by siddharth on 29/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
     var employeeAray2: [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
       
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeAray2!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! Custom2TableViewCell
        let detail = employeeAray2![indexPath.row]
        
        let doublevalueOfAvgSal = detail.avgSal
        let stringvalue = "\(doublevalueOfAvgSal)"
        let doublevalueOfMaxSal = detail.maxSal
        let stringvalueMaxSal = "\(doublevalueOfMaxSal)"
        let doublevalueOfMinSal = detail.minSal
        let stringvalueMinSal = "\(doublevalueOfMinSal)"
        let doublevalueOfSumSal = detail.sumSal
        let stringvalueSumSal = "\(doublevalueOfSumSal)"
        
        cell.idCountLabel.text = String(detail.idCount)
        cell.avgSalLabel.text = stringvalue
        cell.maxSalLabel.text = stringvalueMaxSal
        cell.minSalLabel.text = stringvalueMinSal
        cell.sumLabel.text = stringvalueSumSal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    



}
