//
//  ViewController.swift
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/25/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellContentArray = ["Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead.","Just another label, or maybe a messages","mmmm another stupid message passing by from an unknown user."]
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.register(UINib(nibName: "CustomCellWithCollectionView", bundle: nil), forCellReuseIdentifier: "CustomCellWithCollectionView")

        
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        tableView.reloadData()
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellWithCollectionView", for: indexPath) as! CustomCellWithCollectionView
        cell.ImgsCollectionView.reloadData()
        cell.testLbl.text = cellContentArray[indexPath.row]
        cell.imgView.image = UIImage(named: "Account")
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContentArray.count
    }
}
