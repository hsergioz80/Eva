//
//  Services.swift
//  Eva
//
//  Created by sergio hernandez on 1/9/24.
//

import SwiftUI

struct Services: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser{
            HStack(alignment: .top){
                VStack(alignment: .listRowSeparatorLeading){
                    Text("Billing Contact: \n\n")
                    Text("Pick up Info:")

                    
                }
                VStack(alignment: .listRowSeparatorLeading){
                    Text(user.fullname + "\n" + user.email + "\n")
                    Text(user.address)
                }
            }
        }
        
        VStack {
            
            NavigationLink(destination: Payment()) {
                Text("Proceed to Payment")
            }.navigationBarTitle("Confimation Page")
        }
    }
}





#Preview {
    Services()
}
