//
//  CartManger.swift
//  Eva
//
//  Created by sergio hernandez on 1/21/24.
//

import Foundation

class CartManger: ObservableObject{
    @Published private(set) var total: Int = 40
    @Published private(set) var products: String = "Wash"
    
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    func pay(){
        paymentHandler.startpayment() { success in
            self.paymentSuccess = success
            self.products = ""
            self.total = 0
        }
    }
}
