//
//  CollectionViewCustomCell.swift
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/25/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class CollectionViewCustomCell: UICollectionViewCell {
 
    @IBOutlet weak var imgView: UIImageView!
    var index:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func populateCell(img:String){
        self.imgView.image = UIImage(named: img)
    }
}

