//
//  SearchViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var song: Song?

    override func viewDidLoad() {
        super.viewDidLoad()
        SongService.shared.getSongText(name: "Coldplay", title: "Adventure of a Lifetime") { (text) in
            guard let text = text else {return}
            let song = Song(name: "Coldplay", title: "Adventure of a Lifetime", text: text)
            self.song = song
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "downloadSong", sender: self)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let song = song else {return}
        let detailSongVC = segue.destination as? DetailSongViewController
        detailSongVC?.song = song
    }
    

}
