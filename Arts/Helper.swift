//
//  Helper.swift
//  Arts
//
//  Created by nurboldy on 12/27/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func saveToken(token: String){
        let def = UserDefaults.standard
        def.set(token, forKey: "Token")
        def.synchronize()
    }
    
    class func getToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "Token") as? String
    }
    
    class func deleteToken(){
        let def = UserDefaults.standard
        def.removeObject(forKey: "Token")
    }
    //email
    class func saveEmail(email: String){
        let def = UserDefaults.standard
        def.set(email, forKey: "Email")
        def.synchronize()
    }
    
    class func getEmail() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "Email") as? String
    }
    
    class func deleteEmail(){
        let def = UserDefaults.standard
        def.removeObject(forKey: "Email")
    }
    //id
    class func saveIdNumber(idNumber: Int){
        let def = UserDefaults.standard
        def.set(idNumber, forKey: "IdNumber")
        def.synchronize()
    }
    
    class func getIdNumber() -> Int? {
        let def = UserDefaults.standard
        return def.object(forKey: "IdNumber") as? Int
    }
    
    class func deleteIdNumber(){
        let def = UserDefaults.standard
        def.removeObject(forKey: "IdNumber")
    }
}
