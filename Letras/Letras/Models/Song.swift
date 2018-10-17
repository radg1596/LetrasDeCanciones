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
}
