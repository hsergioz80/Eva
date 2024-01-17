//
//  ContentView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
//            added this line and preview died :(
            if viewModel.userSession != nil{
                ProfileView()
            } else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
