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
    @Published var paymentSuccess = false
    @Published var date = Date()
    @Published var price = Int()


    let paymentHandler = PaymentHandler()
    
    func pay(){
        paymentHandler.startpayment() { success in
            self.paymentSuccess = success
            self.products = ""
            self.total = 0
        }
    }
    
    func setDate(p_date: Date){
        paymentHandler.setDate(p_date: p_date)
    }
    
    func setPrice(p_price: Int){
        paymentHandler.setDate(p_price: p_price)
    }
}
