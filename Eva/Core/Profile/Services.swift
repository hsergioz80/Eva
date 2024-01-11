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
            Text("Hello, \(user.fullname) \nThis is you confirmation screen")
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
