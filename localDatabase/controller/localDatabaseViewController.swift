//
//  localDatabaseViewController.swift
//  localDatabase
//
//  Created by undhad kaushik on 28/02/23.
//

import UIKit
import FMDB

class localDatabaseViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sallaryTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var arrMyDetails: [MyDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        design()
    }
    
    func design(){
        nameTextField.layer.cornerRadius = 15
        nameTextField.layer.masksToBounds =  true
        
        addressTextField.layer.cornerRadius = 15
        addressTextField.layer.masksToBounds =  true
        
        sallaryTextField.layer.cornerRadius = 15
        sallaryTextField.layer.masksToBounds =  true
        
        saveButton.layer.cornerRadius = 15
        saveButton.layer.masksToBounds =  true
        
        searchButton.layer.cornerRadius = 15
        searchButton.layer.masksToBounds =  true
        
        updateButton.layer.cornerRadius = 15
        updateButton.layer.masksToBounds =  true
        
        deleteButton.layer.cornerRadius = 15
        deleteButton.layer.masksToBounds =  true
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if nameTextField.text == "" || addressTextField.text == "" || sallaryTextField.text == ""{
            displayAlert(messege: "please enter your full details")
            
        }
        
        // insert data
        let query = "INSERT INTO emp (name, address, salary) VALUES ('\(nameTextField.text ?? "")', '\(addressTextField.text ?? "")','\(sallaryTextField.text ?? "")');"
        
        print(query)
        let databaseObject = FMDatabase(path: AppDelegate.databasePath)
        if databaseObject.open(){
            let result = databaseObject.executeUpdate(query, withArgumentsIn: [])
            if result == true {
                nameTextField.text = ""
                addressTextField.text = ""
                sallaryTextField.text = ""
                displayAlert(messege: "Data is SuccsesFuly Saved")
              
            }else{
                displayAlert(messege: "Data is not Saved")
                
            }
        }
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let employecontroller: EmployeeController = storyBoard.instantiateViewController(withIdentifier: "EmployeeController") as! EmployeeController
//
//        self.navigationController?.pushViewController(employecontroller, animated: true)
        
    }
    
    
    @IBAction func searchbuttonClicked(_ sender: UIButton) {
        
        // search data
//        if nameTextField.text == "" || addressTextField.text == "" || sallaryTextField.text == ""
//        {
//            displayAlert(messege: "please enter your full details")
//        }
        
        let query = "select * from emp;"
        // let query = "select * frome emp WHERE name = '\(nameTextField.text ?? "")';"
        let databaseObject = FMDatabase(path: AppDelegate.databasePath)
        
        if databaseObject.open(){
            let result = databaseObject.executeQuery(query, withArgumentsIn: [])
            print(result)
            arrMyDetails = []
            while result?.next() == true{
                let name = result?.string(forColumn: "name") ?? ""
                let address = result?.string(forColumn: "address") ?? ""
                let salary = result?.string(forColumn: "salary") ?? ""
                let employee = MyDetails(name: name, address: address, salary: salary)
                arrMyDetails.append(employee)
            }
            print(arrMyDetails)
            
//            if arrMyDetails.count > 0 {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let employeViewController: EmployeeController = storyBoard.instantiateViewController(withIdentifier: "EmployeeController") as! EmployeeController
//                employeViewController.arrMyDetails = arrMyDetails
//
//                self.navigationController?.pushViewController(employeViewController, animated: true)
//
//            }else{
//                displayAlert(messege: "No data found")
//            }
        }
        
    }
    
    @IBAction func updateButtonClicked(_ sender: UIButton) {
        
        // update data
        if nameTextField.text == "" || addressTextField.text == "" || sallaryTextField.text == ""{
            displayAlert(messege: "please enter your full details")
        }
        let query = "UPDATE emp SET address = '\(addressTextField.text ?? "")', salary = '\(sallaryTextField.text ?? "")' WHERE name = '\(nameTextField.text ?? "")';"
        print(query)
        let databaseObject = FMDatabase(path: AppDelegate.databasePath)
        if databaseObject.open()
        {
            let result = databaseObject.executeUpdate(query, withArgumentsIn: [])
            if result == true{
                nameTextField.text = ""
                addressTextField.text = ""
                sallaryTextField.text = ""
                displayAlert(messege: "Data updated successfully")
            }else{
                displayAlert(messege: "Data is not updated successfully")
            }
        }

    }
    
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        
        //delete data
        
        if nameTextField.text == "" || addressTextField.text == "" || sallaryTextField.text == "" {
            displayAlert(messege: "please enter your full details")
        }
        
        
        let query = "DELETE FROM emp WHERE name = '\(nameTextField.text ?? "")';"
        
        print(query)
        let databaseObject = FMDatabase(path: AppDelegate.databasePath)
        if databaseObject.open()
        {
            let result = databaseObject.executeUpdate(query, withArgumentsIn: [])
            if result == true{
                nameTextField.text = ""
                addressTextField.text = ""
                sallaryTextField.text = ""
                displayAlert(messege: "Data deleted successfully")
            }else{
                displayAlert(messege: "Data is not deleted successfully")
            }
        }
    }
    
    func displayAlert(messege: String){
           let alert: UIAlertController = UIAlertController(title: "alert", message: messege, preferredStyle: .alert)
           let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default){ button in
               
           }
           alert.addAction(okButton)
           present(alert, animated: true , completion: nil)
           
       }
   }

   
