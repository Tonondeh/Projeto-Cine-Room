//
//  PerfilController.swift
//  CineRoom
//
//  Created by Danilo Uvara de Souza on 30/03/21.
//

import Foundation

class PerfilController {
    
   private var usuario: UserModel?
    
    func loadUserDefault() {
        guard let email = (Utils.getUserDefaults(key: "email")) as? String else { return }
        
        PerfilWorker().loadUserData(email: email) { (user) in
            if user != nil {
                self.usuario = UserModel(cpf: user?.cpf, dateBirth: user?.dateBirth, email: user?.email, nameDisplay: user?.nameDisplay, nameFull: user?.nameFull)
            }
        }
        
    }
    
    func getUser() -> UserModel? {
        return self.usuario
    }
    
    func logOut () {
        LoginWorker().logOut()
    }
    
    func updateUser(userUpdate: UserModel?) {
		PerfilWorker().updateUser(userUpdate: userUpdate)
    }
    
}
