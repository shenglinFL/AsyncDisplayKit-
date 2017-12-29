//
//  DLNDataPass.h
//  DLNFoundation
//
//  Created by Linzh on 12/28/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DLNDataPassDelegate <NSObject>

@optional
- (void)dataPassResult:(id)data;
- (void)dataPassToDo:(BOOL)doIt;
- (void)dataPassType:(NSInteger)type;

@end

@interface DLNDataPass : NSObject

@end
