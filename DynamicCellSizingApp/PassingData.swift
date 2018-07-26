//
//  PassingData.swift
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/26/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import Foundation
@objc class PassingData:NSObject{
    
    @objc static let sharedInstance = PassingData()
    
    @objc  func printMessage( _ msg:String){
        print(msg)
    }
    @objc  func printMessage2( _ msg:String){
        print(msg)
    }
}
