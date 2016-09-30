//
//  MaterialTextField.swift
//  Shine
//
//  Created by Kiddos on 9/30/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(displayP3Red: SHAWDOW_COLOR, green: SHAWDOW_COLOR, blue: SHAWDOW_COLOR, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
        
    }
    
    // For placeholder
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // For editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}

