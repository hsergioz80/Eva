//
//  Payment.swift
//  Eva
//
//  Created by sergio hernandez on 1/9/24.
//

import SwiftUI
import PassKit

struct Payment: View {
    
    
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var cartManger: CartManger
    
    var body: some View {
        if cartManger.paymentSuccess{
            Text("Thanks for your purchase :)")
            NavigationLink(destination: ProfileView() ) {
                
                Text("Continue")
            }.navigationBarBackButtonHidden(true)

        }
        else{
            if let user = viewModel.currentUser{
                HStack(alignment: .top){
                    VStack(alignment: .listRowSeparatorLeading){
                        Text("Billing Contact: \n\n")
                        Text("Pick up Info: \n\n\n")
                        Text("Drop off Info: \n\n")
                        Text("Total: $ \(user.price)").bold()
                    }
                    VStack(alignment: .listRowSeparatorLeading){
                        Text(user.fullname + "\n" + user.email + "\n")
                        Text("\(user.address)")
                        Text("\(user.PUDate) \n")
                        Text("\(user.address)")
                        Text("\(user.DODate) \n")
                    }
                }
                VStack {
                    PaymentButton(action: cartManger.pay)
                }
            }
        }
    }
}

#Preview {
    Payment()
}
