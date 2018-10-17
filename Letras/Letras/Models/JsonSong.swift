//
//  JsonSong.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation


/*
Modelo que nos sirve para contener el texto de la canción, el cual se obtiene de los datos JSON
desde la API
 texto cancion = JSON["lyrics"]
*/
struct JsonSong: Codable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text = "lyrics"
    }
}
