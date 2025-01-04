//
//  AuthModel.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Foundation

struct AuthModel : Codable {
    let name: String
    let email: String
    let password: String
    
    init(name: String = "", email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
