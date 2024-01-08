//
//  ProfileView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var address = ""

    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                VStack(spacing: 24){
                    InputView(text: $address,
                              title: "Enter Pick Up Address",
                              placeHolder: "50 Cherry Lane")
                }
                .padding(.horizontal)
                .padding(.top, 12)
                //sign in
                
                Button{
                    Task{
                        try await viewModel.getAddress(uid: user.id, address: address)
                    }
                }label: {
                    HStack{
                        Text("Continue")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,
                           height: 48)
                }
                .background(Color(.systemBlue))
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

#Preview {
    ProfileView()
}
