//
//  ObjcHeaderExample.m
//  DynamicCellSizingApp
//
//  Created by Sanad Barjawi on 7/26/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

#import "ObjcHeaderExample.h"
#import "DynamicCellSizingApp-Swift.h"
@implementation ObjcHeaderExample
-(void)getABeautifulMessage {
    [[PassingData sharedInstance] printMessage:@"HI ALL"];
//    [[PassingData sharedInstance ]]
     
}
@end
