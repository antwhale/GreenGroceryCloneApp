//
//  GreenGroceryCloneAppApp.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/14/24.
//

import SwiftUI

@main
struct GreenGroceryCloneAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SignUpViewModel(authApi: AuthService.shared, authServiceParser: AuthServiceParser.shared)
            SignUpView(viewModel: viewModel)
        }
    }
}
