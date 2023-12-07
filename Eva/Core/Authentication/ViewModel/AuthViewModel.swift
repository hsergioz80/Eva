//
//  AuthViewModel.swift
//  Eva
//
//  Created by sergio hernandez on 12/7/23.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        print("Sign in")
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{//this allows us to write asycrnous code without completion blocks
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch{
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        
    }
}
