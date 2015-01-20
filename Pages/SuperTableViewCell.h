//
//  SuperTableViewCell.h
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@end
