//
//  ServiceButton.swift
//  Eva
//
//  Created by sergio hernandez on 1/24/24.
//

import SwiftUI

struct ServiceButton: View {
    @Binding var price : Int
    let cost: String
    let imageName: String
    @State private var isOn = false
    
    var body: some View {
            Button{
                Task{
                }
            }label: {
                HStack{
                    Toggle(cost, isOn: $isOn)
                        .toggleStyle(.button)
                        .tint(.blue)
                        .onChange(of: isOn) {
                            if imageName == "Wash" && isOn{
                                price = price + 40
                                print("The price is: ",price)

                            }
                            if  imageName == "Wash" && !isOn  {
                                price = price - 40
                                print("The price is: ",price)
                            }
                            if imageName == "Dry" && isOn{
                                price = price + 60
                                print("The price is: ",price)
                            }
                            if imageName == "Dry" && !isOn{
                                price = price - 60
                                print("The price is: ",price)
                            }
                        }
                }
                .foregroundColor(.black)
                .frame(width: 60,
                       height: 60)
            }
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Toggle(isOn: $isOn) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            }
            .toggleStyle(.button)
            .tint(.blue)
        }
    }

#Preview {
    ServiceButton(price: .constant(0), cost: "40", imageName: "Wash")
}
