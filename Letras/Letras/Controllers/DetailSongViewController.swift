//
//  DetailSongViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class DetailSongViewController: UIViewController {
    
    @IBOutlet weak var songTextView: UITextView!
    
    var song: Song!
    var delegate: AddSongDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTextView.isEditable = false
        guard let navControllerSongTVC = tabBarController?.viewControllers?.last as? UINavigationController, let songsTableVC =  navControllerSongTVC.viewControllers.first as? SongsTableViewController else {return}
        delegate = songsTableVC
        setupUI(songsTableVC: songsTableVC)
        save()
        setupUI(songsTableVC: songsTableVC)
    }
    
    func setupUI(songsTableVC: SongsTableViewController) {
        self.title = "\(song.name)-\(song.title)"
        songTextView.text = song.text
        let songInStorage = !songsTableVC.songs.contains(song)
        navigationItem.rightBarButtonItem?.isEnabled = songInStorage
    }
    
    func save() {
        delegate?.added(song: song)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
