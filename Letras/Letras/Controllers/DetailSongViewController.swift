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
    
    //Se obtiene el SongsTableViewController
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
    
    //Actualiza el estado del botón "guardar" cada vez que aparece la vista
    override func viewWillAppear(_ animated: Bool) {
        updateSaveButtonStatus()
    }
    
    // MARK: Functions
    /*
     Se configura la interfaz:
        -Se le pone el título a la vista
        -Se carga la letra de la canción y se hace no editable el textView
        -Se actualiza el estado del botón "Guardar"
     */
    func setupUI() {
        title = "\(song.name)-\(song.title)"
        songTextView.isEditable = false
        songTextView.text = song.text
        updateSaveButtonStatus()
    }
    
    /*
     Se encarga de verificar si la canción actual está o no en disco, dependiendo de eso ajusta el botón "Guardar"
     */
    func updateSaveButtonStatus() {
        guard let songsTableViewController = songsTableViewController else {return}
        let songInStorage = !songsTableViewController.songs.contains(song)
        navigationItem.rightBarButtonItem?.isEnabled = songInStorage
    }
    
    // MARK: - Actions
    
    //Le indica al delegado la canción a guardar
    @IBAction func saveSong() {
        delegate?.added(song: song)
        updateSaveButtonStatus()
    }

}
