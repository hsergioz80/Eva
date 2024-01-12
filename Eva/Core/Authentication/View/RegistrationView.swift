//
//  RegistrationView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var address = ""
    @State private var PUDate = Date()
    @State private var DODate = Date()

    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            //image
            Image("Basket")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)
            
            VStack(spacing: 24){
                InputView(text: $email,
                          title: "Email Address",
                          placeHolder: "name@email.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeHolder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeHolder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.cirlce.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGray))
                        }
                        else{
                            Image(systemName: "xmark.cirlce.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button{
                Task{
                    try await viewModel.createUser(withEmail:email,
                                                   password: password,
                                                   fullname: fullName,
                                                   address: address,
                                                   PUDate: PUDate,
                                                   DODate: DODate)
                }
            }label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0: 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing:4){
                    Text("Already have an account? ")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

//MARK: -- AuthenticationFormProtocol

extension RegistrationView:AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword ==  password
        && !fullName.isEmpty
        
    }
}
#Preview {
    RegistrationView()
}
