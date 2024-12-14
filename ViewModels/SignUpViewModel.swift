//
//  SignUpViewModel.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/14/24.
//

import Foundation
import Combine


class SignUpViewModel : ObservableObject  {
    private var cancellableBag = Set<AnyCancellable>()
    
    @Published var username: String = ""
    var usernamEerror = ""
    
    @Published var email: String = ""
    var emailError: String = ""
    
    @Published var password: String = ""
    var passwordError: String = ""
    
    @Published var confirmPassword: String = ""
    var confirmPasswordError: String = ""
    
    private var usernameValidPublisher: AnyPublisher<Bool, Never> {
        return $username
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    init() {
        usernameValidPublisher
            .receive(on: RunLoop.main)
            .dropFirst()
            .map { $0 ? "" : "Username is missing" }
            .assign(to: \.usernamEerror, on: self)
            .store(in: &cancellableBag)
    }
}
