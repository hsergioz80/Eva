//
//  UserInfoView.swift
//  Eva
//
//  Created by sergio hernandez on 1/23/24.
//

import SwiftUI

struct UserInfoView: View {
    let initials: String
    let fullname: String
    let email: String
    
    var body: some View {
        HStack{
            Text(initials)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 72,height: 72)
                .background(Color(.systemGray3))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                Text(fullname)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.top, 4)
                
                Text(email)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }    }
}

#Preview {
    UserInfoView(initials: "JB", fullname: "Ed", email: "test@gmail.com")
}
