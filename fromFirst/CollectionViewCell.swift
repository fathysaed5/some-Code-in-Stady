//
//  CollectionViewCell.swift
//  fromFirst
//
//  Created by fathy  on 7/22/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagCollection: UIImageView!
    
    @IBOutlet weak var labelCollection: UILabel!
    
    var PopUP: (()->())?
    var Closure: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func ClickClose(_ sender: Any) {
        Closure?()
    }
    
    
    @IBAction func ClickPopUP(_ sender: Any) {
        PopUP?()
    }
}
