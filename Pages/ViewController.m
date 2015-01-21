//
//  ViewController.m
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import "ViewController.h"
#import "Profile.h"
#import "SuperTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    myTableView.delegate = self;
    myTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -TableDataSource-

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self giveMeMyProfiles] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSManagedObjectContext *context = [self giveMeContext];
    NSEntityDescription *ent = [NSEntityDescription entityForName:@"Profile" inManagedObjectContext:context];
    [fetchRequest setEntity:ent];
    
    NSArray *tmp = [context executeFetchRequest:fetchRequest error:nil];
    
    NSManagedObject *obj = [tmp objectAtIndex:indexPath.row];
    
    static NSString *idnt = @"Cell";
    SuperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idnt forIndexPath:indexPath];
    if (cell != nil) {
        cell.name.text = [obj valueForKey:@"name"];
        cell.lastName.text = [obj valueForKey:@"lastname"];
        cell.profileImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[obj valueForKey:@"photo"]]]];
    }
    return cell;
}


#pragma mark -CoreData-
//Context
-(NSManagedObjectContext*)giveMeContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(NSArray*)giveMeMyProfiles{
    NSFetchRequest *frequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Profile" inManagedObjectContext:[self giveMeContext]];
    [frequest setEntity:entity];
    NSArray *tmp = [[self giveMeContext] executeFetchRequest:frequest error:nil];
    return tmp;
}


//---



@end
