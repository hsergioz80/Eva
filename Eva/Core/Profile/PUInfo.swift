//
//  PUInfo.swift
//  Eva
//
//  Created by sergio hernandez on 1/7/24.
//

import SwiftUI

struct PUInfo: View {
    var body: some View {
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
                
                NavigationLink(destination: Services()) {
                    Text("Confirmation")
                }
            }
        }
    }


#Preview {
    PUInfo()
}


