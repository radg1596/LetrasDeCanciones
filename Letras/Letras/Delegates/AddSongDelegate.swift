//
//  AddSongDelegate.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

/*
 Se utiliza para que el SongsTableViewController se encargue
 de agregar canciones
 */
protocol AddSongDelegate {
    func added(song: Song)
}
