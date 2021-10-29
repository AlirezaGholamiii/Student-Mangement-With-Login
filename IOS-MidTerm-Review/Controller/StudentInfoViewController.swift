//
//  StudentInfoViewController.swift
//  IOS-MidTerm-Review
//
//  Created by user203475 on 10/17/21.
//

import UIKit


protocol TableViewRefresh {
    /// Protocol to auto-refresh the list - don't touch this code.
    func refresh()
}


class StudentInfoViewController: UIViewController {

    public var selectedStudent : Student?
    public var editMode : Bool = false
    
    var delegate : TableViewRefresh?  /// delegate to auto-refresh the list  - don't touch this code.
    
    @IBOutlet weak var txtStudentName : UITextField!
    @IBOutlet weak var txtStudentEmail: UITextField!
    @IBOutlet weak var btnDelete : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if editMode == false {
            self.title = "Adding new student"
            btnDelete.isHidden = true
            
        } else {
            self.title = "Editing student"
            btnDelete.isHidden = false
            txtStudentName.text = selectedStudent!.getName()
            txtStudentEmail.text = selectedStudent!.getEmail()
        }
        

    }

    
    @IBAction func btnSave(_ sender: Any) {
        
        if let studentName : String = txtStudentName.text, let studentEmail : String = txtStudentEmail.text{
            
            if studentName.count < 3 {
                Toast.ok(view: self, title: "Toast Message", message: "Please, enter a student name with at least 3 chars!")
                return
            }
            
            if studentEmail.count <= 2 {
                Toast.ok(view: self, title: "Toast Message", message: "Please, enter a valid email")
                return
            }
            
            if editMode {
                
                selectedStudent!.setName(name: studentName)
                selectedStudent!.setEmail(email: studentEmail)
                
            
            } else {

                let student = Student()
                
                student.setName(name: studentName)
                student.setEmail(email: studentEmail)
                student.setId(id: Student.getNextId())
                
                StudentProvider.addStudent(student: student)

            }
           
            delegate?.refresh()  /// auto-refresh the list - don't touch this code
            
            navigationController!.popViewController(animated: true)
            
            //StudentListViewController.refresh()
            
            
        } else {
            Toast.ok(view: self, title: "Toast Message", message: "Enter a valid name!")
        }
        
        
    }
    
    
    @IBAction func btnDeleteTouchUp(_ sender: Any) {
        //Show a dialog
        let alert = UIAlertController(title: "Confirmation", message: "Do you really want to delete " + txtStudentName.text! + "?", preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.deleteStudent()
        }))

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
              //print("Handle Cancel Logic here")
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func deleteStudent() {
        StudentProvider.removeStudent(studentId: selectedStudent!.getId())
        
        delegate?.refresh()
        navigationController?.popViewController(animated: true)
    }

}
