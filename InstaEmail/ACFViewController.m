//
//  ACFViewController.m
//  InstaEmail
//
//  Created by  on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ACFViewController.h"

@implementation ACFViewController

@synthesize activities = activities_;
@synthesize feelings = feelings_;
@synthesize emailPicker = emailPicker_;

#pragma mark - Actions
- (IBAction)sendButtonTapped:(id)sender
{
    NSString* theMessage = [NSString stringWithFormat:@"I’m %@ and feeling %@ about it.",
                            [activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]], [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",theMessage);
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Hello Renee!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
    } else {
        NSLog(@"Sorry, you need to setup mail first!");
    }
    NSLog(@"Dood, I'm tapped!");
}

#pragma mark Mail composer delegate method
- (void)mailComposeController:(MFMailComposeViewController*) controller
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Picker delegate protocol
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [activities_ objectAtIndex:row];
    else
        return [feelings_ objectAtIndex:row];
}

#pragma mark - Picker datasource protocol
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [activities_ count];
    else
        return [feelings_ count];
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    activities_ = [[NSArray alloc] initWithObjects:  @"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    feelings_ = [[NSArray alloc] initWithObjects: @"awesome", @"sad", @"happy", @"ambivalent", @"nauseous", @"psyched", @"confused", @"hopeful", @"anxious", nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
