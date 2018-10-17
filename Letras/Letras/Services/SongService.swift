//
//  SongService.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct SongService {
    
    static let shared = SongService()
    
    let client = Client(baseURLComponents: URLComponents(string: "https://api.lyrics.ovh")!)
    let jsonDecoder = JSONDecoder()
    
    func getSongText(name: String, title: String, completion: @escaping (String?) -> Void) {
        let path = "/v1/" + name + "/" + title
        client.get(path: path) { (data) in
            guard let jsonSong = try? self.jsonDecoder.decode(JsonSong.self, from: data) else {print("Cant decode");return}
            completion(jsonSong.text)
        }
    }
    
}
