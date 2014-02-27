//
//  SKNode+STAdditions.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.

/***********************************************************************************
 *
 * Copyright (c) 2014 Thomas Dupont
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 ***********************************************************************************/

#import "SKNode+STAdditions.h"

@implementation SKNode (STAdditions)

- (CGFloat)calculateAccumulatedZPosition
{
    CGFloat zPosition = self.zPosition;
    SKNode* parent = self.parent;
    
    while (parent)
    {
        zPosition += parent.zPosition;
        parent = parent.parent;
    }
    
    return zPosition;
}

- (void)runActionsSequence:(NSArray*)actions
{
    SKAction* sequence = [SKAction sequence:actions];
    [self runAction:sequence];
}

- (void)runActionsSequenceForever:(NSArray*)actions
{
    SKAction* sequence = [SKAction sequence:actions];
    SKAction* repeat = [SKAction repeatActionForever:sequence];
    [self runAction:repeat];
}

- (void)runActionsGroup:(NSArray*)actions
{
    SKAction* group = [SKAction group:actions];
    [self runAction:group];
}

- (void)runActionsGroupForever:(NSArray*)actions
{
    SKAction* group = [SKAction group:actions];
    SKAction* repeat = [SKAction repeatActionForever:group];
    [self runAction:repeat];
}

- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay
{
    SKAction* delayAction = [SKAction waitForDuration:delay];
    [self runAction:[SKAction sequence:@[delayAction, action]]];
}

@end
