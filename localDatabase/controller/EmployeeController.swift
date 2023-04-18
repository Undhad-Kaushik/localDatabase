//
//  EmployeeController.swift
//  localDatabase
//
//  Created by undhad kaushik on 28/02/23.
//

import UIKit

class EmployeeController: UIViewController {
    
    @IBOutlet weak var myDetailsTabelView: UITableView!
    
    
    var arrMyDetails: [MyDetails] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}

extension EmployeeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMyDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "\(arrMyDetails[indexPath.row].name) \n\(arrMyDetails[indexPath.row].address) \n\(arrMyDetails[indexPath.row].salary)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
