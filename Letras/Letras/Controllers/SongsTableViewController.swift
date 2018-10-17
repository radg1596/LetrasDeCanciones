//
//  SongsTableViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController, AddSongDelegate {
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
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
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let selectedSong = songs[indexPath.row]
        let detailSongVC = segue.destination as? DetailSongViewController
        detailSongVC?.song = selectedSong
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    
    // MARK: - Methods
    
    func added(song: Song) {
        //Se agrega una canción aa TableView, se verifica que no se haya guardado antes
        if !songs.contains(song) {
            songs.append(song)
            tableView.reloadData()
        }
    }
    
    

}
