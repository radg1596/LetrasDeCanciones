//
//  Client.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct ClientText {
    
    //Url base de la API
    let baseURLComponents: URLComponents
    
    let jsonDecoder = JSONDecoder()
    
    /*
     -Recibe un clusure y un path como parámetro (String)
        Ejemplo de path: "/v1/name/title"
     -Se encarga de crea un request (método GET) a partir de este path y la URL base
     -Después obtiene los datos de la API en el background, una vez
     obtenidos, los decodifica para obtener el texto de la canción, después ejecuta el closure recibido en el hilo principal.
     */
    func get(path: String, completion: @escaping ( (String?) -> Void )) {
        var resquestURLComponents = baseURLComponents
        resquestURLComponents.path = path
        var resquest = URLRequest(url: resquestURLComponents.url!)
        resquest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: resquest ) { (data, response, error) in
            if let data = data, let jsonSong = try? self.jsonDecoder.decode(JsonSong.self, from: data) {
                DispatchQueue.main.async {completion(jsonSong.text)}
            }
            else {
                DispatchQueue.main.async {completion(nil)}
                print("We can not get the song text...")
            }
        }
        task.resume()
    }
}
