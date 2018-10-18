//
//  StorageSongs.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct StorageSong {
    
    static let shared = StorageSong()
    
    let jsonDecoder = JSONDecoder()
    let jsonEncoder = JSONEncoder()
    
    var filePath: URL?{
        StorageType.shared.ensureExists()
        var filePath = StorageType.shared.folder
        filePath.appendPathComponent("songs")
        return filePath
    }
    
    func load() -> [Song]? {
        if let data = try? Data(contentsOf: filePath!), let songs = try? jsonDecoder.decode(Array<Song>.self, from: data) {
            return songs
        }
        else {return nil}
    }
    
    func saveData(listof songs: [Song]) {
        if let data = try? jsonEncoder.encode(songs) {
            do {
                try data.write(to: filePath!)
            }
            catch let(error) {
                print("There is an error writing in storage memory: \(error)")
            }
        }
    }
    
}
