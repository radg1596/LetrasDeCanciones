//
//  StorageSongs.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct StorageSong {
    
    var filePath: URL?{
        StorageType.shared.ensureExists()
        var filePath = StorageType.shared.folder
        filePath.appendPathComponent("songs")
        return filePath
    }
    
    func load() {
    }
    
    func saveData() {
    }
    
}
