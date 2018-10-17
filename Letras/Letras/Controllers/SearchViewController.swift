//
//  SearchViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var titleSongTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var song: Song?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let song = song else {return}
        let detailSongVC = segue.destination as? DetailSongViewController
        detailSongVC?.song = song
    }
    
    
    
    @IBAction func searchSongText(_ sender: UIButton) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let name = self.artistTextField.text ?? ""
        let title = self.titleSongTextField.text ?? ""
        SongService.shared.getSongText(name: name, title: title) { (text) in
            guard let text = text else {return
                print("UIAlert")
            }
            //"Coldplay" "Adventure of a Lifetime"
            let song = Song(name: name , title: title , text: text)
            self.song = song
            print(song == song)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.performSegue(withIdentifier: "downloadSong", sender: self)
            }
        }
    }
    
}
