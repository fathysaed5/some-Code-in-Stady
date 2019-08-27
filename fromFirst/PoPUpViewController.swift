//
//  PoPUpViewController.swift
//  fromFirst
//
//  Created by fathy  on 7/22/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class PoPUpViewController: UIViewController {
    @IBOutlet weak var labelView: UILabel!
    
    @IBOutlet weak var viewVC: UIView!
    var nameView: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.text = "PopUp: \(nameView!)"
        viewVC.layer.cornerRadius = 50
        viewVC.layer.borderWidth = 7
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToClose))
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapToClose() {
        dismiss(animated: true, completion: nil)
    }


}
