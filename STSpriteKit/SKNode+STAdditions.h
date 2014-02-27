//
//  SKNode+STAdditions.h
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

#import <SpriteKit/SpriteKit.h>

@interface SKNode (STAdditions)

/**
 *  Calculate the accumulated zPosition of the receiver: the receiver's zPosition plus the accumulated zPosition of its parent.
 *  @return the accumulated zPosition
 */
- (CGFloat)calculateAccumulatedZPosition;

/**
 *  Run the actions in sequence.
 *  It's equivalent to do: [xxx runAction:[SKAction sequence:array]]
 *  @param actions An array containing all the action
 */
- (void)runActionsSequence:(NSArray*)actions;

/**
 *  Run the actions in sequence and repeat that sequence forever.
 *  It's equivalent to do: [xxx runAction:[SKAction repeatActionForever:[SKAction sequence:array]]]
 *  @param actions An array containing all the action
 */
- (void)runActionsSequenceForever:(NSArray*)actions;

/**
 *  Run the actions in a group.
 *  It's equivalent to do: [xxx runAction:[SKAction group:array]]
 *  @param actions An array containing all the action
 */
- (void)runActionsGroup:(NSArray*)actions;

/**
 *  Run the actions in a group and repeat that group forever.
 *  It's equivalent to do: [xxx runAction:[SKAction repeatActionForever:[SKAction group:array]]]
 *  @param actions An array containing all the action
 */
- (void)runActionsGroupForever:(NSArray*)actions;

/**
 *  Run the action after a delay.
 *  It's equivalent to do: [xxx runAction:[SKAction sequence:[SKAction waitForDuration:delay],action]]
 *  @param action The action that will be run after a delay
 *  @param delay The duration to wait before running the action
 */
- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay;

@end
