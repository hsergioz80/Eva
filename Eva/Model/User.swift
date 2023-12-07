//
//  User.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullname: String
    let email:String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
            return ""
    }
}

extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Koby Bryant", email: "test@gmail.com")
}
