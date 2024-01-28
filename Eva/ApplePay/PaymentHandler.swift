//
//  PaymentHandler.swift
//  Eva
//
//  Created by sergio hernandez on 1/21/24.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject{
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    var date = Date()
    var price = Int()
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .visa,
        .masterCard
    ]
    
    func setDate(p_date: Date){
        date = p_date
    }
    
    func setDate(p_price: Int){
        price = p_price
    }
    
    func shippingMethodCalculator() -> [PKShippingMethod]{
        print("///////DEBUG:: This is the date passed: ", date)
        print("/////DEBUG: This is the price passed: ", price)
        let today = Date()
        let calendar = Calendar.current
        
        let shippingStart = calendar.date(byAdding: .day, value: 0, to: date)
        let shippingEnd = calendar.date(byAdding: .day, value: 0, to: date)
        
        if let shippingEnd = shippingEnd, let shippingStart = shippingStart {
            let startComponents = calendar.dateComponents([.calendar,.year,.month,.day], from: shippingStart)
            let endComponents = calendar.dateComponents([.calendar,.year,.month,.day], from: shippingEnd)

            let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
            shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
            shippingDelivery.detail = "Sweeter is send to your address"
            shippingDelivery.identifier = "DELIVERY"
            
            return [shippingDelivery]
        }
        return []
    }
    
    func startpayment( completion:@escaping PaymentCompletionHandler){
        completionHandler = completion
        paymentSummaryItems = []
        
        if price == 40{
            let item = PKPaymentSummaryItem(label: "Wash", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(item)
            
            let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(total)
        }
        else if price == 60{
            let item = PKPaymentSummaryItem(label: "Dry Cleaing", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(item)
            
            let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(total)
        }
        else{
            let item = PKPaymentSummaryItem(label: "Dry Cleaing + Wash", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(item)
            
            let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: String(price)), type: .final)
            paymentSummaryItems.append(total)

        }
    
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.com.sergiohernandez.Eva"
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shippingMethodCalculator()
//        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        
        paymentController?.present(completion: { presented in
            if presented{
                debugPrint("Presented payment controller")
            }else{
                debugPrint("Failed to present payment controller")
            }
        })
    }
}

extension PaymentHandler: PKPaymentAuthorizationControllerDelegate{
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let errors = [Error]()
        let status = PKPaymentAuthorizationStatus.success
        
        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
        
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss{
            DispatchQueue.main.async {
                if self.paymentStatus == .success{
                    if let completionHandler = self.completionHandler{
                        completionHandler(true)
                    }
                }else{
                    if let completionHandler = self.completionHandler{
                        completionHandler(false)
                    }
                }
            }
        }
    }
}
