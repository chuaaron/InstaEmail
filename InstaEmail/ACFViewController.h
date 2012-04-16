//
//  ACFViewController.h
//  InstaEmail
//
//  Created by  on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ACFViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate>

@property (retain, nonatomic) NSArray* activities;
@property (retain, nonatomic) NSArray* feelings;
@property (retain, nonatomic) IBOutlet UIPickerView* emailPicker;

- (IBAction)sendButtonTapped:(id)sender;

@end
