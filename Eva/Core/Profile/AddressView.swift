//
//  AddressView.swift
//  Eva
//
//  Created by sergio hernandez on 1/27/24.
//

import SwiftUI

struct AddressView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        SearchBar(viewModel: ContentViewModel())
    }
}

#Preview {
    AddressView()
}
