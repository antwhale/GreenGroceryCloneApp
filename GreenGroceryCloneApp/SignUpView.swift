//
//  ContentView.swift
//  GreenGroceryCloneApp
//
//  Created by 부재식 on 12/14/24.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    var usernameerror = "Required"
    
    @State var email: String = ""
    var emailError: String = "Required"
    
    @State var password: String = ""
    var passwordError: String = "Required"
    
    @State var confirmPassword: String = ""
    var confirmPasswordError: String = "Required"
    
    
    var body: some View {
        ZStack {
            ColorCodes.primary.color().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Green Grocery")
                    .font(Font.custom("Noteworthy-Bold", size: 40))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 20.0)
                
                AuthTextField(title: "Username", textValue: $username, errorValue: usernameerror)
                
                AuthTextField(title: "Email", textValue: $email, errorValue: emailError, keyboardType: .emailAddress)

                AuthTextField(title: "Password", textValue: $password, errorValue: passwordError, isSecured: true)
                
                AuthTextField(title: "Confirm Password", textValue: $confirmPassword, errorValue: confirmPasswordError, isSecured: true)
                
                Button(action: {
                    signUp()
                }, label: {
                    Text("Sign Up")
                }).frame(minWidth: 0.0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(.infinity)
                    .padding(.top, 20.0)
            }.padding(60)
                
        }
    }
    func signUp() -> Void {
        print("Sign up clicked!!")
    }
}

extension ColorCodes {
    func color() -> Color {
        switch self {
        case .primary:
            return Color(red: 79/255, green: 139/255, blue: 43/255)
        case .success:
            return Color(red: 0, green: 0, blue: 0)
        case .failure:
            return Color(red: 219/255, green: 12/255, blue: 12/255)
        case .background:
            return Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1.0)
        }
    }
}

#Preview {
    SignUpView()
}

struct AuthTextField: View {
    var title: String
    @Binding var textValue: String
    var errorValue: String
    var isSecured: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            if isSecured {
                SecureField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .cornerRadius(5.0)
                    .keyboardType(keyboardType)
            } else {
                TextField(title, text: $textValue)
                    .padding()
                    .background(ColorCodes.background.color())
                    .cornerRadius(5.0)
                    .keyboardType(keyboardType)
            }
            
            Text(errorValue)
                .fontWeight(.light)
                .foregroundColor(ColorCodes.failure.color())
                .frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.trailing)
        }
    }
}
