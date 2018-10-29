//
//  TextFieldDelegate.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/17/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class TextFieldDelegate: UIViewController, UITextFieldDelegate {
    /*Se encarga de terminar el "modo edición" cuando el usuario presiona "return" mientras escribe
     en un TextField
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
