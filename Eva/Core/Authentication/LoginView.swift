//
//  LoginView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("Basket")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                //form fields
                //sign in
                Spacer()
                //sign up
            }
        }
    }
}

#Preview {
    LoginView()
}
