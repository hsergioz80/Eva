//
//  SelectDateView.swift
//  Eva
//
//  Created by sergio hernandez on 1/24/24.
//

import SwiftUI

struct SelectDateView: View {

    @Binding var PUDate : Date
    @Binding var DODate : Date

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "Pick Up Date",
            selection: $PUDate,
            in: dateRange,
            displayedComponents: [.date, .hourAndMinute]
        )
        
        DatePicker(
            "Drop Off Date",
            selection: $DODate,
            in: dateRange,
            displayedComponents: [.date, .hourAndMinute]
        )    }
}

#Preview {
    SelectDateView(PUDate: .constant(Date()), DODate: .constant(Date()))
}
