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
    
    var searchPathDirectory: FileManager.SearchPathDirectory {
        return .documentDirectory
    }
    
    var folder: URL {
        var url = FileManager.default.urls(for: searchPathDirectory , in: .userDomainMask).first!
        let subfolder = "dgra"
        url.appendPathComponent(subfolder)
        return url
    }
    
    func clearStorage() {
        try? FileManager.default.removeItem(at: folder)
    }
    
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
