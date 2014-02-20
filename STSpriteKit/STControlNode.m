//
//  STControlNode.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "STControlNode.h"

@interface STControlNode ()

@property (nonatomic, assign) SEL touchUpAction;
@property (nonatomic, weak) id touchUpTarget;
@property (nonatomic, strong) dispatch_block_t touchUpBlock;

@property (nonatomic, assign) SEL touchDownAction;
@property (nonatomic, weak) id touchDownTarget;
@property (nonatomic, strong) dispatch_block_t touchDownBlock;

@property (nonatomic, weak) UITouch* touch;

@end

@implementation STControlNode

- (void)setTouchUpTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    self.touchUpTarget = target;
    self.touchUpAction = action;
}

- (void)setTouchUpBlock:(dispatch_block_t)touchUpBlock
{
    self.userInteractionEnabled = YES;
    _touchUpBlock = touchUpBlock;
}

- (void)setTouchDownTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    self.touchDownTarget = target;
    self.touchDownAction = action;
}

- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock
{
    self.userInteractionEnabled = YES;
    _touchDownBlock = touchDownBlock;
}

#pragma mark - UIResponder Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.touch)
    {
        UITouch* touch = [touches anyObject];
        self.touch = touch;
        self.highlighted = YES;
        
        if (self.touchDownTarget)
        {
            [self warnTarget:self.touchDownTarget action:self.touchDownAction];
        }
        if (self.touchDownBlock)
        {
            self.touchDownBlock();
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* touch in touches)
    {
        if (touch == self.touch)
        {
            self.highlighted = NO;
            self.touch = nil;
            
            if (self.touchUpTarget)
            {
                [self warnTarget:self.touchUpTarget action:self.touchUpAction];
            }
            if (self.touchUpBlock)
            {
                self.touchUpBlock();
            }
            
            break;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)warnTarget:(id)target action:(SEL)action
{
    NSString* selectorStr = NSStringFromSelector(action);
    if ([selectorStr hasSuffix:@":"])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:self];
#pragma clang diagnostic pop
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action];
#pragma clang diagnostic pop
    }
}

@end
