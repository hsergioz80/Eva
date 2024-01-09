//
//  PUInfo.swift
//  Eva
//
//  Created by sergio hernandez on 1/7/24.
//

import SwiftUI

struct PUInfo: View {
    @State private var date = Date()
    @State private var date1 = Date()
    
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        NavigationView {
            VStack{
                DatePicker(
                    "Pick Up Date",
                    selection: $date,
                    in: dateRange,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
                DatePicker(
                    "Drop Off Date",
                    selection: $date1,
                    in: dateRange,
                    displayedComponents: [.date, .hourAndMinute]
                )
                
                Section("Pricing"){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<3) {
                                Text("Service \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(.red)
                            }
                        }
                    }
                }
                
                VStack {
                    
                    NavigationLink(destination: Services()) {
                        Text("Checkout")
                    }.navigationBarTitle("PUInfo")
                }
                
                
            }
            
        }
    }
}

#Preview {
    PUInfo()
}


