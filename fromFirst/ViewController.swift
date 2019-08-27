//
//  ViewController.swift
//  fromFirst
//
//  Created by fathy  on 7/22/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var imagView: UIImageView!
    var imag = UIImagePickerController()
    @IBOutlet weak var textPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imag.delegate = self
        imagView.layer.cornerRadius = 25
        imagView.layer.borderWidth = 4
        imagView.layer.borderColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        //let tap = UITapGestureRecognizer(target: self, action: #selector(taptopane))
        //imagView.addGestureRecognizer(tap)

    }
    
    
@IBAction func ClickMe(_ sender: Any) {
        if textView.text?.isEmpty == true {
        let allert = UIAlertController(title: "Error", message: "please type name and pasword", preferredStyle: .alert)
            let ok = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            allert.addAction(ok)
            let delet = UIAlertAction(title: "delet", style: .destructive, handler: nil)
            allert.addAction(delet)
            
            present(allert, animated: true, completion: nil)
        } else if textPassword.text?.isEmpty == true {
            let allert = UIAlertController(title: "Error", message: "please chek your password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            allert.addAction(ok)
            let delet = UIAlertAction(title: "delet", style: .destructive, handler: nil)
            allert.addAction(delet)
            present(allert, animated: true, completion: nil)
        } //else {
            //if    //let homePag = storyboard?.instantiateViewController(withIdentifier: "TabelViewController") as?TabelViewController {
                //homePag.nameCome = textView.text
            
            //navigationController?.pushViewController(homePag, animated: true)
        }
        }
    

    
        

    //@objc func taptopane() {
        //present(imag, animated: true, completion: nil)






extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagPaker = info[.originalImage] as! UIImage
        imagView.image = imagPaker
        dismiss(animated: true, completion: nil)
    }
}

