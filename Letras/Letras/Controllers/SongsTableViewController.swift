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
    //Contiene las canciones de la tabla
    var songs = [Song]()
    
    // MARK: - View Fuctions

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        //Carga los datos de la memoria persistente
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
    
    /*
     Cuando se presiona una celda, se muestran los detalles
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSong", sender: self)
    }
    
    // Eliminar una canción de la tabla
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            StorageSong.shared.saveData(listof: songs)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    //Le envía la canción seleccionada a la vista que mostrará sus detalles
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let selectedSong = songs[indexPath.row]
        let detailSongViewController = segue.destination as? DetailSongViewController
        detailSongViewController?.song = selectedSong
    }

    
    // MARK: - Functions
    //Función del protocolo AddSongDelegate, agrega una canción a la lista
    func added(song: Song) {
        //Se agrega una canción a TableView, se verifica que no se haya guardado antes
        if !songs.contains(song) {
            songs.append(song)
            StorageSong.shared.saveData(listof: songs)
            tableView.reloadData()
        }
    }
    

}
