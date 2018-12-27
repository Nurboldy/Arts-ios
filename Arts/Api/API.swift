//
//  API.swift
//  Arts
//
//  Created by nurboldy on 12/27/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class API: NSObject {
    
    class func getAllSong(completion: @escaping (_ error: Error?, _ arts: [Art]? )->Void ) {
        let url = "http://localhost:3000/songs"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let value):
                let json = JSON(value)
                let arrayString = json[].arrayValue
                var arts = [Art]()
                for item in arrayString {
                    let art = Art(artName: item["title"].string ?? "", artImage: item["imageURL"].string ?? "", artDesc: item["artist"].string ?? "")
                    arts.append(art)
                    completion(nil,arts)
                }
            }
        }
    }
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void ) {
        let url = "http://localhost:3000/login"
        let headers = [
            "Content-Type": "application/json"
        ]
        let parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<600).responseJSON { response in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let token = json["token"].string {
                    Helper.saveToken(token: token)
                    completion(nil,true)
                }
                if let email = json["user"]["email"].string {
                    Helper.saveEmail(email: email)
                }
                if let idNumber = json["user"]["id"].int {
                    Helper.saveIdNumber(idNumber: idNumber)
                }

            }
        }
    }
    
}
