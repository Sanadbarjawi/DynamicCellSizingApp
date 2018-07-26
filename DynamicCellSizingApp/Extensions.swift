//
//  Extensions.swift
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/26/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    func pullToRefresh(target:UIViewController,action:Selector){
        let refreshControl = UIRefreshControl()
        self.refreshControl = refreshControl
        refreshControl.addTarget(target, action: action, for: .valueChanged)
    }
  
    func stopRefreshing(){
        self.refreshControl?.endRefreshing()
    }
}
