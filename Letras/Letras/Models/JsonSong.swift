//
//  JsonSong.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation


/*
Modelo que nos sirve para contener el texto de la canción, se obtiene de los datos JSON
desde la API
*/
struct JsonSong: Codable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text = "lyrics"
    }
}
