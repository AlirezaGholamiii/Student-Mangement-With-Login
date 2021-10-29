//
//  ViewController.swift
//  IOS-MidTerm-Review
//
//  Created by user203475 on 10/17/21.
//

import UIKit

class ViewController: UIViewController {
    private let credentials : (username : String, password : String) = ("1931230", "adm123")
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func txtUsernameEditingChanged(_ sender: Any) {
        txtUsername.backgroundColor = UIColor.white
    }
    
    @IBAction func txtpasswordEditingChanged(_ sender: Any) {
        txtPassword.backgroundColor = UIColor.white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
  
        return false
        
    }
    
    @IBAction func btnLoginTouchUp(_ sender: Any) {
        
        //USERNAME VALIDATION
        guard let username : String = txtUsername.text else {
            Toast.ok(view: self, title: "Toast Message", message: "Please, enter a valid username!")
            return
        }
        
        if (username.count != 7 && username.count != 8) {
            Toast.ok(view: self, title: "Toast Message", message: "Please, enter a username with 7 or 8 digits!")
            txtUsername.backgroundColor = UIColor.red
            return
        }
        
        if (username != credentials.username) {
            Toast.ok(view: self, title: "Toast Message", message: "Invalid username!")
            txtUsername.backgroundColor = UIColor.red
            return
        }
        
        //PASSWORD VALIDATION
        guard let password : String = txtPassword.text else {
            Toast.ok(view: self, title: "Toast Message", message: "Please, enter a valid password!")
            return
        }
        
        if (password != credentials.password) {
            Toast.ok(view: self, title: "Toast Message", message: "Invalid password!")
            txtPassword.backgroundColor = UIColor.red
            return
        }
        
        performSegue(withIdentifier: "toStudentList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toStudentList {
        
            let studentList = (segue.destination as! StudentListViewController)
            
            guard let username : String = txtUsername.text else {
                return
            }
            
            studentList.userName = username
            
        }
        
        
    }
   

}

