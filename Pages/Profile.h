//
//  Profile.h
//  Pages
//
//  Created by Максим on 20.01.15.
//  Copyright (c) 2015 Prigozhenkov Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Profile : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * photo;

@end
