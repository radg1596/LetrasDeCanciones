//
//  Client.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct Client {
    
    let baseURLComponents: URLComponents
    
    func get(path: String, completion: ( (Data) -> Void )?) {
        var resquestURLComponents = baseURLComponents
        resquestURLComponents.path = path
        var resquest = URLRequest(url: resquestURLComponents.url!)
        resquest.httpMethod = "GET"
        print(resquest.url!)
        let task = URLSession.shared.dataTask(with: resquest ) { (data, response, error) in
            if let data = data, let completion = completion {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
        task.resume()
    }
}
