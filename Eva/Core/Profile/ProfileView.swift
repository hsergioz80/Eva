//
//  ProfileView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var price = 0
    @State private var PUDate = Date()
    @State private var DODate = Date()
    @State private var address = ""
    @State private var path = NavigationPath()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack(path: $path){

            if let user = viewModel.currentUser{
                List{
                    Section{
                        UserInfoView(initials: user.initials, fullname: user.fullname, email: user.email)
                    }
                    
                    Section("Select Pick Up Date and Drop Off Date"){
                        SelectDateView(PUDate: $PUDate, DODate: $DODate)

                    }
                    VStack(spacing: 24){
                        InputView(text: $address,
                                  title: "Enter Pick Up Address",
                                  placeHolder: "50 Cherry Lane")
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    Section("Choose 1 or more Options"){
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ServiceButton(price: $price, cost: "$40", imageName: "Wash")
                                ServiceButton(price: $price, cost: "$60", imageName: "Dry")
                            }
                        }
                    }
                    //sign in
                    Button{
                        Task{
                            try await viewModel.getAddress(uid: user.id, address: address)
                            try await viewModel.getDates( uid: user.id, PUDate: PUDate, DODate: DODate)
                            try await viewModel.getPrice( uid:user.id, price: price)

                            path.append("Payment")
                        }
                    }label: {
                        HStack{
                            Text("Request Wash")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .navigationDestination(for: String.self){view in if view == "Payment"{
                            Payment()
                        }
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
                    
                    Section("General"){
                        HStack{
                            SettingsRowView(imageName: "gear",
                                            title: "Version",
                                            tintColor: Color(.systemGray))
                            
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section("Account"){
                        Button{
                            viewModel.signOut()
                        }label: {
                            SettingsRowView(imageName:"arrow.left.circle.fill",
                                            title: "Sign Out",
                                            tintColor: .red)
                        }
                        
                        Button{
                            print("Delete Account")
                        }label: {
                            SettingsRowView(imageName:"xmark.circle.fill",
                                            title: "Delete Account",
                                            tintColor: .red)
                        }
                    }
                }
            }
        }
    }
}

extension ProfileView:AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !address.isEmpty
        && price > 0
    }
}

#Preview {
    ProfileView()
}
