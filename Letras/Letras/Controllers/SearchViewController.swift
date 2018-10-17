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
    }
    
    @IBAction func searchSongText(_ sender: UIButton) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let name = self.artistTextField.text ?? ""
        let title = self.titleSongTextField.text ?? ""
        SongService.shared.getSong(name: name, title: title) { (song) in
            guard let song = song else {
                self.showUIAlert()
                return
            }
            self.song = song
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.performSegue(withIdentifier: "downloadSong", sender: self)
        }
    }
    
    
    func showUIAlert() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        let alertController = UIAlertController(title: "Song not found", message: "Please, retry with another one", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let song = song else {return}
        let detailSongVC = segue.destination as? DetailSongViewController
        detailSongVC?.song = song
    }
    
    
}
