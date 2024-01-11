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
            VStack(spacing: 24){
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
                
                Section("Choose an Option"){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            let items = [0,1,2]
                            ForEach(0..<items.count, id: \.self) {
                                if($0 == 0){
                                    Image("Wash")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 200)

                                }
                                if($0 == 1){
                                    Image("Dry")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 200)
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    
                    NavigationLink(destination: Services()) {
                        Text("Confirm")
                    }
                }.navigationBarTitle("Enter Pick Up Info")
                
                
            }
            
        }
    }
}

#Preview {
    PUInfo()
}


