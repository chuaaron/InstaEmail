//
//  ACFViewController.h
//  InstaEmail
//
//  Created by  on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACFViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray* activities_;
    NSArray* feelings_;
}

@end
