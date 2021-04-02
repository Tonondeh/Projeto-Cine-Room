//
//  LoginWorker.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 21/03/21.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn


class LoginWorker: NSObject {
    
    private let handle = Auth.auth()
    
    
    func createUserFirebase(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
        
        // Verificar o que retornar para Controller
        // Dados do User.
        
        guard let _email = email, let _password = password else {
            return completion(false)
        }
        
        handle.createUser(withEmail: _email, password: _password) { (authResult, error) in
            
            if error != nil {
                completion(false)
            }
            
            if authResult == nil {
                completion(false)
            } else {
                completion(true)
            }
            
        }
        
    }
    
    func signInCredential(credential: AuthCredential, completion: @escaping(_ success: Bool) -> Void) {
        
        handle.signIn(with: credential) { (authResult, error) in
            //		Auth.auth().signIn(with: credential) { (authResult, error) in
            
            if error != nil {
                print("Error> \(String(describing: error?.localizedDescription))")
                completion(false)
            } else {
                
                if authResult == nil {
                    print("Error> \(String(describing: error?.localizedDescription))")
                    completion(false)
                } else {
                    completion(true)
                }
                
            }
        }
        
    }
    
    func signIn(email: String?, password: String?, completion: @escaping(_ success: Bool) -> Void) {
        
        // Verificar o que retornar para Controller
        // Dados do User.
        
        guard let _email = email, let _password = password else {
            return completion(false)
        }
        
        handle.signIn(withEmail: _email, password: _password) { (authResult, error) in
            if error != nil {
                completion(false)
            } else {
                
                if authResult == nil {
                    completion(false)
                } else {
                    completion(true)
                }
                
            }
        }
        
    }
    
    func logOut() {
        
        do {
            try handle.signOut()
        }  catch{
            print("erro ao sair") }
        
        
        
        
    }
    
    func addStateDidChangeListener(completion: @escaping(_ success: User?) -> Void) {
        
        // Verificar o que retornar para Controller
        // Dados do User.
        
        handle.addStateDidChangeListener { (auth, user) in
            if user == nil {
                completion(nil)
            } else {
                
                completion(user)
            }
        }
    }
    
    func removeStateDidChangeListener() {
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func signInFacebook(viewController: UIViewController, completion: @escaping(_ success: AuthCredential?) -> Void) {
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { (loginResult, error) in
            
            if let _error = error {
                print("Erro no LogIn Facebook")
                print(_error.localizedDescription)
                completion(nil)
                return
            }
            
            if let _token = loginResult?.token {
                let credential = FacebookAuthProvider.credential(withAccessToken: _token.tokenString)
                completion(credential)
            } else {
                completion(nil)
            }
            
        }
        
        
    }
    
    func sendPasswordReset(withEmail email: String? , _ callback: ((Error?) -> ())? = nil){
        handle.sendPasswordReset(withEmail: email ?? "" ) { error in
            callback?(error)
        }
        
    }
}
