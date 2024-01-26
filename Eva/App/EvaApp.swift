//
//  EvaApp.swift
//  Eva
//
//  Created by sergio hernandez on 12/6/23.
//

import SwiftUI
import Firebase

@main
struct EvaApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var cartManager = CartManger()

    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(cartManager)
        }
    }
}
