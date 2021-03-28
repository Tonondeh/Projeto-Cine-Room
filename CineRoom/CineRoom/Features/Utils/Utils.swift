//
//  Utils.swift
//  CineRoom
//
//  Created by Lucas Munho on 28/03/21.
//

import Foundation

class Utils{
    
    class  func saveUserDefaults(value:Any?,key:String){
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    class  func getUserDefaults(key:String)-> Any?{
        return UserDefaults.standard.object(forKey: key)
    }
}
