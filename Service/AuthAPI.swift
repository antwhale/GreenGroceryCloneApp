//
//  AuthAPI.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Foundation
import Combine

protocol AuthAPI {
    func checkEmail(email: String) -> Future<Bool, Never>
    func signUp(username: String, email: String, password: String) -> Future<(statusCode: Int, data: Data), Error>
}
