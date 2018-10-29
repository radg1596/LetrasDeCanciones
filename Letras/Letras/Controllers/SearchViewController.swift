//
//  SearchViewController.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var titleSongTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: Properties
    
    var song: Song?
    let textFieldDelegate: TextFieldDelegate = TextFieldDelegate()
    
    // MARK: - View Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegados para los textFields
        titleSongTextField.delegate = textFieldDelegate
        artistTextField.delegate = textFieldDelegate
    }

    // MARK: - Functions
    //UIAlert que nos indica cuando la consulta no arroja resultados
    func showUIAlert() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        let alertController = UIAlertController(title: "Song not found", message: "Please, retry with another one", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    /*
     Intenta obtener una canción del servicio y después muestra sus detalles, en caso de no poder obtenerla muestra un UIAlert
     */
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
    
    
    // MARK: - Navigation
    /*
     Le envía la canción obtenida del servicio a la vista que desplegará sus detalles
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let song = song else {return}
        let detailSongViewController = segue.destination as? DetailSongViewController
        detailSongViewController?.song = song
    }
    
    
}
