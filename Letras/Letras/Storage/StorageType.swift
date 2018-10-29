//
//  StorageType.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct StorageType {
    
    static let shared = StorageType()
    
    //Directorio
    var searchPathDirectory: FileManager.SearchPathDirectory {
        return .documentDirectory
    }
    
    //Folder en Filemanager
    var folder: URL {
        var url = FileManager.default.urls(for: searchPathDirectory , in: .userDomainMask).first!
        let subfolder = "dgra"
        url.appendPathComponent(subfolder)
        return url
    }
    
    /*
     Se asegura de que no exista un archivo creado en el folder de la aplicación, si hay otro tipo de archivo lo elimina y crea un directorio
     */
    func ensureExists() {
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        if fileManager.fileExists(atPath: folder.path, isDirectory: &isDir) {
            if isDir.boolValue {return}
            try? fileManager.removeItem(at: folder)
        }
        try? fileManager.createDirectory(at: folder, withIntermediateDirectories: false, attributes: nil)
    }
    
}
