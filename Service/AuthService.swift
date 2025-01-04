//
//  AuthService.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/21/24.
//

import Foundation
import Combine

enum SignUpError : Error {
    case emailExists
    case invalidData
    case invalidJSON
    case error(error: String)
}

enum AuthResult<T> {
    case success(value: T)
    case failure(message: String)
}

class AuthService {
    lazy var httpService = AuthHttpService()
    static let shared: AuthService = AuthService()
    private init() {}
}

extension AuthService: AuthAPI {
    func signUp(username: String, email: String, password: String) -> Future<(statusCode: Int, data: Data), Error> {
        return Future<(statusCode: Int, data: Data), Error> { [httpService] promise in
            do {
                try AuthHttpRouter
                    .signUp(AuthModel(name: username, email: email, password: password))
                    .request(usingHttpService: httpService)
                    .responseJSON { response in
                        guard
                            let statusCode = response.response?.statusCode,
                            let data = response.data,
                            statusCode == 200 else {
                            promise(.failure(SignUpError.invalidData))
                            return
                        }
                        promise(.success((statusCode: statusCode, data: data)))
                    }
            } catch {
                print("Something went wrong : \(error)")
                promise(.failure(SignUpError.invalidData))
            }
        }
        
    }
    
    func checkEmail(email: String) -> Future<Bool, Never> {
        return Future<Bool, Never> { [httpService] promise in
            do {
                try AuthHttpRouter
                    .validateEmail(email: email)
                    .request(usingHttpService: httpService)
                    .responseJSON { response in
                        guard response.response?.statusCode == 200 else {
                            print("checkEmail fail")
                            promise(.success(false))
                            return
                        }
                        promise(.success(true))
                        print("checkEmail success")
                    }
            } catch {
                promise(.success(false))
                print("checkEmail error")
            }
            
        }
    }
}
