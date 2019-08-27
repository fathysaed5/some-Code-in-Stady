//
//  PopUpCollectionViC.swift
//  fromFirst
//
//  Created by fathy  on 7/22/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class PopUpCollectionViC: UIViewController {
    
    @IBOutlet weak var LabelCollection: UILabel!
    var nameCollection:String?
    
    @IBOutlet weak var viewCV: UIView!
    @IBOutlet weak var imagCollectionn: UIImageView!
    var imagCollection:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelCollection.text = nameCollection
        imagCollectionn.image = imagCollection
        viewCV.layer.cornerRadius = 55
        viewCV.layer.borderWidth = 4

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToGo))
        view.addGestureRecognizer(tap)
        
    }
    @objc func tapToGo() {
        dismiss(animated: true, completion: nil)
    }
}

