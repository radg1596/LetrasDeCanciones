//
//  Client.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct Client {
    
    //Url base de la API
    let baseURLComponents: URLComponents
    
    /*
     -Recibe un clusure y un path como parámetro (String)
        Ejemplo de path: "/v1/name/title"
     -Se encarga de crea un request (método GET) a partir de este path y la URL base
     -Después obtiene los datos de la API en el backgraound, una vez
     obtenidos, ejecuta el closure recibido en el hilo principal.
     */
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
