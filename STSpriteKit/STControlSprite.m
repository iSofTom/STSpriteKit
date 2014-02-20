//
//  STControlSprite.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "STControlSprite.h"

@interface STControlSprite ()

@property (nonatomic, assign) SEL touchUpInsideAction;
@property (nonatomic, weak) id touchUpInsideTarget;
@property (nonatomic, strong) dispatch_block_t touchUpInsideBlock;

@property (nonatomic, assign) SEL touchUpOutisdeAction;
@property (nonatomic, weak) id touchUpOutsideTarget;
@property (nonatomic, strong) dispatch_block_t touchUpOutsideBlock;

@property (nonatomic, assign) SEL touchDownAction;
@property (nonatomic, weak) id touchDownTarget;
@property (nonatomic, strong) dispatch_block_t touchDownBlock;

@property (nonatomic, weak) UITouch* touch;

@end

@implementation STControlSprite

- (void)setTouchUpInsideTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    self.touchUpInsideTarget = target;
    self.touchUpInsideAction = action;
}

- (void)setTouchUpInsideBlock:(dispatch_block_t)touchUpInsideBlock
{
    self.userInteractionEnabled = YES;
    _touchUpInsideBlock = touchUpInsideBlock;
}

- (void)setTouchUpOutsideTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    self.touchUpOutsideTarget = target;
    self.touchUpOutisdeAction = action;
}

- (void)setTouchUpOutsideBlock:(dispatch_block_t)touchUpOutsideBlock
{
    self.userInteractionEnabled = YES;
    _touchUpOutsideBlock = touchUpOutsideBlock;
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

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* touch in touches)
    {
        if (touch == self.touch)
        {
            BOOL containsPoint = [self containsTouchPoint:touch];
            
            if (containsPoint && !self.highlighted)
            {
                self.highlighted = YES;
            }
            else if (!containsPoint && self.highlighted)
            {
                self.highlighted = NO;
            }
            
            break;
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
            
            BOOL containsPoint = [self containsTouchPoint:touch];
            
            if (containsPoint)
            {
                if (self.touchUpInsideTarget)
                {
                    [self warnTarget:self.touchUpInsideTarget action:self.touchUpInsideAction];
                }
                if (self.touchUpInsideBlock)
                {
                    self.touchUpInsideBlock();
                }
            }
            else if (!containsPoint)
            {
                if (self.touchUpOutsideTarget)
                {
                    [self warnTarget:self.touchUpOutsideTarget action:self.touchUpOutisdeAction];
                }
                if (self.touchUpOutsideBlock)
                {
                    self.touchUpOutsideBlock();
                }
            }
            
            break;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (BOOL)containsTouchPoint:(UITouch*)touch
{
    CGPoint point = [touch locationInNode:self.parent];
    BOOL containsPoint = [self containsPoint:point];
    return containsPoint;
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
