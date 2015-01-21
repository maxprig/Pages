//
//  ViewController.h
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *myProfiles;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

