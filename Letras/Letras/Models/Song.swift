//
//  Song.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

/*
 Modelo que nos representa una canción
 Tiene nombre, titulo y texto
*/

struct Song: Codable {
    let name: String
    let title: String
    let text: String
    
    init(name: String, title: String, text: String) {
        self.name = name
        self.title = title
        self.text = text
    }
}

/*
 Extensión de Song para conformar el protocolo de igualdad.
 Una canción es igual a otra cuando sus títulos y nombres son iguales.
 Sirve para evitar agregar a "Mis canciones" la misma canción dos o más veces.
 */
extension Song: Equatable {
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.name == rhs.name && lhs.title == rhs.title
    }
}
