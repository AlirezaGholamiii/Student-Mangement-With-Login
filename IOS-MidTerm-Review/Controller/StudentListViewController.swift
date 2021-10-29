//
//  StudentListViewController.swift
//  IOS-MidTerm-Review
//
//  Created by user203475 on 10/17/21.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewRefresh {
    
    public var userName : String = ""
    private var selectedRow : Int = -1
    
    @IBOutlet weak var lblUsername : UILabel!
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblUsername.text = "Hello " + userName
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refresh()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentProvider.allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //cell.textLabel?.text = StudentProvider.allStudents[indexPath.row].getEmail()
        cell.textLabel?.text = StudentProvider.allStudents[indexPath.row].getName()
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow = indexPath.row

        tableView.deselectRow(at: indexPath, animated: false)
        
        performSegue(withIdentifier: Segue.toStudentInfoEditing, sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toStudentInfo {
            /// insert operation
            
            let studentInfo = (segue.destination as! StudentInfoViewController)
            studentInfo.delegate = self  /// deletage to auto-refresh the list (don't touch this)
            
            studentInfo.editMode = false
        
            return
        }
        
        if segue.identifier == Segue.toStudentInfoEditing {
            /// Update/delete operations
            
            let studentInfo = (segue.destination as! StudentInfoViewController)
            studentInfo.delegate = self /// deletage to auto-refresh the list (don't touch this)
            
            studentInfo.editMode = true
            studentInfo.selectedStudent = StudentProvider.allStudents[selectedRow]
        
        }

    }
    
    
    func refresh() {
        tableView.reloadData()
    }
    
}
