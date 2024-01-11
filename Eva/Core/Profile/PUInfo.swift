//
//  PUInfo.swift
//  Eva
//
//  Created by sergio hernandez on 1/7/24.
//

import SwiftUI

class HighlightedButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .red : .green
        }
    }
}

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
                            let selected = 0
                            
                            ForEach(0..<items.count, id: \.self) {
                                if($0 == 0){
                                    Button{
                                        Task{
//                                            try await viewModel.signIn(withEmail: email,
//                                                                       password: password)
                                        }
                                    }label: {
                                        HStack{
                                            Text("$40")
                                        }
                                        .foregroundColor(.white)
                                        .frame(width: 50,
                                               height: 50)
                                    }
                                    .background(Color(.systemBlue))
                                    
//                                    .disabled(!formIsValid)
//                                    .opacity(formIsValid ? 1.0: 0.5)
                                    .cornerRadius(10)
                                    .padding(.top, 24)

                                    
                                    Image("Wash")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 200, height: 200)
                                        .onTapGesture {
                                            print("//// DEBUG:Selected wash")
                                        }
                                        

                                }
                                if($0 == 1){
                                    Text("$40")
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


