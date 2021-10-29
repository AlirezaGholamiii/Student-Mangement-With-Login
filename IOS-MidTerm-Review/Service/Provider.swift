//
//  Provider.swift
//  IOS-MidTerm-Review
//
//  Created by user203475 on 10/17/21.
//

import Foundation


class StudentProvider {
    
    
    static var allStudents : [Student] = []
    
    
    static func addStudent( student : Student ){
        allStudents.append(student)
    }


    static func removeStudent( studentId : Int ) -> Bool {
        
        for (index, student) in allStudents.enumerated(){
            if student.getId() == studentId {
                allStudents.remove(at: index)
                return true
            }
        }
        
        return false
    }
    
    
    static func updateStudent( updatedStudent : Student ) -> Bool {
        
        for (index, student) in allStudents.enumerated(){
            if student.getId() == updatedStudent.getId(){
                return true
            }
        }
        
        return false
    }
    
    
}
