//
//  DetailSongViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class DetailSongViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var songTextView: UITextView!
    
    // MARK: - Propierties
    
    var song: Song!
    var delegate: AddSongDelegate?
    
    var songsTableViewController: SongsTableViewController? {
        let navigationControllerSongTVC = tabBarController?.viewControllers?.last as? UINavigationController
        let songsTableViewController = navigationControllerSongTVC?.viewControllers.first as? SongsTableViewController
        return songsTableViewController
    }
    
    // MARK: - View Fuctions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        delegate = songsTableViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateSaveButtonStatus()
    }
    
    // MARK: Functions
    
    func setupUI() {
        title = "\(song.name)-\(song.title)"
        songTextView.isEditable = false
        songTextView.text = song.text
        updateSaveButtonStatus()
    }
    
    func updateSaveButtonStatus() {
        guard let songsTableViewController = songsTableViewController else {return}
        let songInStorage = !songsTableViewController.songs.contains(song)
        navigationItem.rightBarButtonItem?.isEnabled = songInStorage
    }
    
    // MARK: - Actions
    
    @IBAction func saveSong() {
        delegate?.added(song: song)
        updateSaveButtonStatus()
    }

}
