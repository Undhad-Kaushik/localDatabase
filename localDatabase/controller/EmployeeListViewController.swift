//
//  EmployeeListViewController.swift
//  localDatabase
//
//  Created by undhad kaushik on 10/02/23.
//

import UIKit

class EmployeeListViewController: UIViewController {
    
   // @IBOutlet weak var employeeListTabelView: UITableView!
    
    var arrEmployee: [Employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // setup()
    }
    
 //   private func setup(){
      //  nibRegister()
    //}
    
//    private func nibRegister(){
//        let nibFile: UINib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
//        employeeListTabelView.register(nibFile, forCellReuseIdentifier: "EmployeeTableViewCell")
//        employeeListTabelView.separatorStyle = .none
//    }
    
   
}
//extension EmployeeListViewController: UITabBarDelegate,UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrEmployee.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: EmployeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
//        let employe: Employee = arrEmployee[indexPath.row]
//        cell.nameLabel.text = "\(employe.name) \n\(employe.address)\n\(employe.salary)"
//
//
//        return cell
//    }

