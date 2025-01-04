//
//  AuthHttpRouter.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Foundation
import Alamofire

enum AuthHttpRouter {
    case login(AuthModel)
    case signUp(AuthModel)
    case validate(token: String)
    case refreshToken(token: String)
    case logout(token: String)
    case validateEmail(email: String)
}

extension AuthHttpRouter: HttpRouter {
    
    
    var baseUrlString: String {
        return "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch(self) {
        case .login:
            return "login"
        case .signUp:
            return "register"
        case .validate:
            return "user"
        case .refreshToken:
            return "token/refresh"
        case .logout:
            return "logout"
        case .validateEmail:
            return "validate/email"
        }
    }
    
    var method: HTTPMethod {
        switch (self) {
        case .login, .signUp, .refreshToken, .logout, .validateEmail:
            return .post
        case .validate:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch(self) {
        case .login, .signUp, .validateEmail:
            return ["Content-Type": "application/json; charset=UTF-8"]
        case .validate(let token), .refreshToken(let token), .logout(let token):
            return [
                "Authorization" : "Bearer \(token)",
                "Content-Type" : "application/json; charset=UTF-8"
            ]
        }
    }
    
    var parameters: Parameters? {
        return nil
    }

    func body() throws -> Data? {
        switch self {
        case .signUp(let user):
            return try JSONEncoder().encode(user)
        case .validateEmail(let email):
            return try JSONEncoder().encode(["email" : email])
        default:
            return nil
        }
    }
    
}
