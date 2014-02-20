//
//  STControlNode.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface STControlNode : SKNode

@property (nonatomic, assign) BOOL highlighted;

- (void)setTouchUpTarget:(id)target action:(SEL)action;
- (void)setTouchUpBlock:(dispatch_block_t)touchUpBlock;

- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock;

@end
