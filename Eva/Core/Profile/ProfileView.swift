//
//  ProfileView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var PUDate = Date()
    @State private var DODate = Date()
    @State private var address = ""
    @State private var path = NavigationPath()
    @EnvironmentObject var viewModel: AuthViewModel
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()

    var body: some View {
        NavigationStack(path: $path){
            if let user = viewModel.currentUser{
                List{
                    Section{
                        UserInfoView(initials: user.initials, fullname: user.fullname, email: user.email)
                    }
                    
                    DatePicker(
                        "Pick Up Date",
                        selection: $PUDate,
                        in: dateRange,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    
                    DatePicker(
                        "Drop Off Date",
                        selection: $DODate,
                        in: dateRange,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    
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
                            
                            try await viewModel.getDates( uid: user.id, PUDate: PUDate, DODate: DODate)

                            path.append("PUInfo")
                        }
                    }label: {
                        HStack{
                            Text("Request Wash")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .navigationDestination(for: String.self){view in if view == "PUInfo"{
                                PUInfo()
                            }
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
}



#Preview {
    ProfileView()
}
