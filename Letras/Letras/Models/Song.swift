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
        let lhsName = lhs.name.uppercased()
        let rhsName = rhs.name.uppercased()
        let lhsTitle = lhs.title.uppercased()
        let rhsTitle = rhs.title.uppercased()
        return lhsName == rhsName && lhsTitle == rhsTitle
    }
}
