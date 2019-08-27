//
//  CollectionViewController.swift
//  fromFirst
//
//  Created by fathy  on 7/22/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import UIKit
protocol DataBackDelegat {
    func NameDat(name:String)
}

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var delegat:DataBackDelegat?
    @IBOutlet weak var textFieldBacj: UITextField!
    
    
    var arraynames = ["Egy","Moroco","Medel","usa"]
    var arrayimages:[UIImage] = [#imageLiteral(resourceName: "900x450_uploads,2019,07,06,151fa4e31f"),#imageLiteral(resourceName: "1645-12"),#imageLiteral(resourceName: "5148514391549400031"),#imageLiteral(resourceName: "5085ecc52524efb10412e924a916dbeeb7c704cdr1-810-350v2_hq")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let longtap = UILongPressGestureRecognizer(target: self, action: #selector(handelCollectionView(gesture:)))
        
        collectionView.addGestureRecognizer(longtap)
        
        

    }
    @objc func handelCollectionView(gesture:UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            let indx = collectionView.indexPathForItem(at: gesture.location(in: collectionView))
            collectionView.beginInteractiveMovementForItem(at: indx!)
        case.changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case.ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
        
    }
 
    @IBAction func ClickSginUp(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func ClickDataBack(_ sender: Any) {
        delegat?.NameDat(name: textFieldBacj.text!)
        
navigationController?.popViewController(animated: true)    }
    
}
extension CollectionViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let ItemMove = arraynames.remove(at: sourceIndexPath.item)
        let MoveImag = arrayimages.remove(at: sourceIndexPath.row)
        arraynames.insert(ItemMove, at: destinationIndexPath.row)
        arrayimages.insert(MoveImag, at: destinationIndexPath.row)
    }
    
}
extension CollectionViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraynames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as?CollectionViewCell
        
    
        item?.PopUP = { let PopUp = self.storyboard!.instantiateViewController(withIdentifier: "PopUpCollectionViC") as?PopUpCollectionViC
            PopUp?.nameCollection = self.arraynames[indexPath.row]
            PopUp?.imagCollection = self.arrayimages[indexPath.row]
            self.present(PopUp!, animated: true, completion: nil)
            
         }
        
        item?.labelCollection.text = arraynames[indexPath.item]
        item?.imagCollection.image = arrayimages[indexPath.item]
        item?.Closure = {
            self.arraynames.remove(at: indexPath.row)
            self.arrayimages.remove(at: indexPath.row)
            self.collectionView.reloadData()
        }
        
        return item!
    
}
}
extension CollectionViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 15, height: 200)
    }
}
