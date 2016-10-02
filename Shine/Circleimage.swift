//
//  Circleimage.swift
//  Shine
//
//  Created by Kiddos on 10/1/16.
//  Copyright © 2016 Kiddos. All rights reserved.
//

import UIKit

class circleImage : UIImageView {
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.size.width / 2
    }
}
