//
//  Student.swift
//  IOS-MidTerm-Review
//
//  Created by user203475 on 10/17/21.
//

import Foundation

class Student {

    static private var idGenerator : Int = 0
    
    private var id : Int = 0
    private var name : String = ""
    private var email : String = ""

    init(id: Int = 0, name: String = "", email : String = "") {
        self.id = id
        self.name = name
        self.email = email
    }
    
    static func getNextId() -> Int {
        Student.idGenerator += 1
        return Student.idGenerator
    }
    

    func getName() -> String {
        return self.name
    }
    func setName(name : String) {
        self.name = name
    }
    
    func getEmail() -> String {
        return self.email
    }
    func setEmail(email : String) {
        self.email = email
    }

    func getId() -> Int {
        return self.id
    }
    func setId(id : Int) {
        self.id = id
    }

        
    
}
