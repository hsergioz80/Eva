//
//  SearchBar.swift
//  Eva
//
//  Created by sergio hernandez on 1/27/24.
//
//
//import SwiftUI
//
//struct SearchBar: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//


import SwiftUI

struct SearchBar: View {
    
    @StateObject var viewModel: ContentViewModel
    @FocusState private var isFocusedTextField: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Enter Pick Up Address", text: $viewModel.searchableText)
                    .padding()
                    .autocorrectionDisabled()
                    .focused($isFocusedTextField)
                    .font(.title)
                    .onReceive(
                        viewModel.$searchableText.debounce(
                            for: .seconds(1),
                            scheduler: DispatchQueue.main
                        )
                    ) {
                        viewModel.searchAddress($0)
                    }
                    .background(Color.init(uiColor: .systemBackground))
                    .overlay {
                        ClearButton(text: $viewModel.searchableText)
                            .padding(.trailing)
                            .padding(.top, 8)
                    }
                    .onAppear {
                        isFocusedTextField = true
                    }
                List(self.viewModel.results) { address in
                    AddressRow(address: address)
                        .listRowBackground(backgroundColor)
                }
                .listStyle(.plain)
//                .scrollContentBackground(.hidden)
            }
            .background(backgroundColor)
//            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    var backgroundColor: Color = Color.init(uiColor: .white)
}

#Preview {
    SearchBar(viewModel: ContentViewModel())
}

