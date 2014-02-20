//
//  STControlSprite.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface STControlSprite : SKSpriteNode

@property (nonatomic, assign) BOOL highlighted;

- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;
- (void)setTouchUpInsideBlock:(dispatch_block_t)touchUpInsideBlock;

- (void)setTouchUpOutsideTarget:(id)target action:(SEL)action;
- (void)setTouchUpOutsideBlock:(dispatch_block_t)touchUpOutsideBlock;

- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock;

@end
