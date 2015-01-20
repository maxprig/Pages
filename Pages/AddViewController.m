//
//  AddViewController.m
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import "AddViewController.h"
#import "Profile.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doButton:(UIButton *)sender {
    [self addToCoreData];
}

#pragma mark -CoreData-
//context
-(NSManagedObjectContext*)giveMeContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)addToCoreData{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.vk.com/method/users.get?user_id=%@&fields=photo_max", self.idField.text]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *responseArr = json[@"response"];
    
    NSManagedObjectContext *context = [self giveMeContext];
    Profile *newProfile = [NSEntityDescription insertNewObjectForEntityForName:@"Profile"
                                                        inManagedObjectContext:context];
    
    if (newProfile != nil) {
        for (NSDictionary *obj in responseArr) {
        newProfile.name = [obj valueForKey:@"first_name"];
        newProfile.lastname = [obj valueForKey:@"last_name"];
        newProfile.photo = [obj valueForKey:@"photo_max"];
        }
        NSError *error = nil;
        
        if ([context save:&error]) {
            NSLog(@"OK");
        }
        else
        {
            NSLog(@":c");
        }
    }
    
}
@end
