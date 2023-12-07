//
//  ProfileView.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack{
                    Text("MJ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72,height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Michael Jordan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("test@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray)
                        
                    }
                }
            }
            
            Section("General"){
                
            }
            
            Section("Account"){
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
