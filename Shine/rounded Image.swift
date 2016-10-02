//
//  rounded Image.swift
//  Shine
//
//  Created by Kiddos on 10/2/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit

class roundedImage : UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = 3
        clipsToBounds = true
    }
}
