//
//  DataManager.swift
//  CineRoom
//
//  Created by Alexandre Cardoso on 28/03/21.
//

import UIKit
import CoreData

class DataManager {
	
	/// Reference to Managed Object Context
	let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
	
	
	func createUser(nameDisplay: String?, nameFull: String?, email: String?, cpf: Int64, dateBrith: Date?) {
		let newUser: UserData = UserData(context: self.managedContext)
		
		newUser.nameDisplay	= nameDisplay
		newUser.nameFull 		= nameFull
		newUser.email 			= email
		newUser.cpf          = cpf
		newUser.dateBirth 	= dateBrith
		
		self.saveUser()
	}
	
	func saveUser() {
		do {
			try self.managedContext.save()
			
		} catch let error as NSError {
			print("Erro no salvar")
			print(error.localizedDescription)
		}
	}
	
}
