//
//  AddViewController.h
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *idField;
- (IBAction)doButton:(UIButton *)sender;

@end
