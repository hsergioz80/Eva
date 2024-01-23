//
//  PUInfo.swift
//  Eva
//
//  Created by sergio hernandez on 1/7/24.
//

import SwiftUI


struct PUInfo: View {
    @State private var PUDate = Date()
    @State private var DODate = Date()
    @EnvironmentObject var viewModel: AuthViewModel
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        if let user = viewModel.currentUser{
            
            VStack(spacing: 24){
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
                )
                
                Section("Choose an Option"){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            let items = [0,1,2]
                            
                            ForEach(0..<items.count, id: \.self) {
                                if($0 == 0){
                                    Button{
                                        Task{
                                            
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
                
                Button{
                    Task{
                        try await viewModel.getDates( uid: user.id, PUDate: PUDate, DODate: DODate)
                    }
                }label: {
                    HStack{
                        //                                Text("Confirm")
                        //                                    .fontWeight(.semibold)
                        NavigationLink(destination: Services()) {
                            Text("Confirmation")
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,
                           height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
            }
        }
    }
}

#Preview {
    PUInfo()
}


