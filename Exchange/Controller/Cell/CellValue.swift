//
//  File.swift
//  Exchange
//
//  Created by Nikita Molodorya on 03.11.2023.
//

import UIKit
import Foundation


class CellValue: UITableViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleValue: UILabel!
    @IBOutlet weak var promptValue: UILabel!
    
    @IBOutlet weak var priceValue: UILabel!
    
  
    override func awakeFromNib() {
       super.awakeFromNib()
        img.layer.cornerRadius = img.frame.width / 2
    }
    
   
    
}
