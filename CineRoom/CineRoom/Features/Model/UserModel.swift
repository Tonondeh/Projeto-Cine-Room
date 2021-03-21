//
//  UserModel.swift
//  CineRoom
//
//  Created by Danilo Uvara de Souza on 18/03/21.
//

import Foundation

class UserModel: Codable {

    let name: String
    let fullname: String
    let email: String
    let cpf: Int
    let birthAge: String
    
}


// usar pod para validar o CPF.
