//
//  SignUpErrorModel.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Foundation

struct SignUpErrorModel: Codable {
    let validationErrors: ValidationErrors
    
    enum CodingKeys: String, CodingKey {
        case validationErrors = "validation_errors"
    }
}

struct ValidationErrors: Codable {
    let name, email, password: [String]?
}
