//
//  HttpUiltiy.swift
//  Register
//
//  Created by manish on 10/08/21.
//

import Foundation
import UIKit

class HttpUility {
    
    static let sharedInstance = HttpUility()
    func getApiData<T:Decodable>(requestUrl:URL,resultType: T.Type,completionHandler:@escaping(_ result: T) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) {(reponsedata,httpUrlResponse,error) in
            if(error == nil && reponsedata != nil && reponsedata?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result =  try decoder.decode(T.self, from: reponsedata!)
                    _=completionHandler(result)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
}
