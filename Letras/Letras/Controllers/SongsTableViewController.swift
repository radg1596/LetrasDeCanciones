//
//  SongsTableViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController, AddSongDelegate {
    
    // MARK: Propierties
    
    var songs = [Song]()
    
    // MARK: - View Fuctions

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        if let songs = StorageSong.shared.load() {
            self.songs = songs
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = songs[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSong", sender: self)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            StorageSong.shared.saveData(listof: songs)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let selectedSong = songs[indexPath.row]
        let detailSongViewController = segue.destination as? DetailSongViewController
        detailSongViewController?.song = selectedSong
    }

    
    // MARK: - Functions
    //Función del protocolo AddSongDelegate
    func added(song: Song) {
        //Se agrega una canción a TableView, se verifica que no se haya guardado antes
        if !songs.contains(song) {
            songs.append(song)
            StorageSong.shared.saveData(listof: songs)
            tableView.reloadData()
        }
    }
    

}
