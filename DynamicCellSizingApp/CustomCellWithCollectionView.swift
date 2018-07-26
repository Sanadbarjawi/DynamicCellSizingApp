//
//  CustomCellWithCollectionView.swift
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/25/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit


protocol ButtonDelegate:class {//Reference Types
    func buttonTapped(imagesCount:Int)
}
protocol PrintDelegate:class {//Reference Types
    func buttonTapped(printVal:String)
}

class CustomCellWithCollectionView: UITableViewCell {
    var index : Int!
    let imagesArray = ["car1","car1","car1","ppl1"]
    
    weak var buttonTappeddelegate:ButtonDelegate?
    
    @IBOutlet weak var ImgsCollectionView: UICollectionView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var testLbl: UILabel!

    var width:CGFloat!
    var height:CGFloat = 200
    lazy var arrayOfSizes = [[height],
                             [height,height],
                             [height,height/2,height/2],
                             [height,height/3,height/3,height/3]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImgsCollectionView.dataSource = self
        ImgsCollectionView.delegate = self
        ImgsCollectionView.register(UINib(nibName: "CollectionViewCustomCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCustomCell")
    }
    
    func populateCell(txt:String,img:String){
        self.imgView.image = UIImage(named: img)
        self.testLbl.text = txt
        
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        buttonTappeddelegate?.buttonTapped(imagesCount: imagesArray.count)
    }
}

extension CustomCellWithCollectionView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImgsCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCell", for: indexPath) as! CollectionViewCustomCell
        cell.populateCell(img: imagesArray[indexPath.row])
        cell.index = indexPath.row
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select \(indexPath.row) ")
    }
}

extension CustomCellWithCollectionView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        width = collectionView.frame.size.width
        if imagesArray.count > 1 {
            width = width/2
        }
        
        
        return CGSize(width:width, height: arrayOfSizes[imagesArray.count-1][indexPath.row]-0.001)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
