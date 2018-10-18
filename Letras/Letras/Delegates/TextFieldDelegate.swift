//
//  TextFieldDelegate.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/17/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import UIKit

class TextFieldDelegate: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
