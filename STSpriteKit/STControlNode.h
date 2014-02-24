//
//  STControlNode.h
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

@interface STControlNode : SKNode

/**
 * This boolean will be set to YES if a touch is down,
 * and will be set to NO if a touch is up.
 */
@property (nonatomic, assign) BOOL highlighted;

/**
 *  The action message will be send to the target if a touchUp event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param target The object to whom this message will be sent
 *  @param action The selector representing the message
 */
- (void)setTouchUpTarget:(id)target action:(SEL)action;

/**
 *  The block will be executed if a touchUp event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param touchUpBlock The block that will be executed.
 */
- (void)setTouchUpBlock:(dispatch_block_t)touchUpBlock;

/**
 *  The action message will be send to the target if a touchDown event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param target The object to whom this message will be sent
 *  @param action The selector representing the message
 */
- (void)setTouchDownTarget:(id)target action:(SEL)action;

/**
 *  The block will be executed if a touchDown event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param touchDownBlock The block that will be executed.
 */
- (void)setTouchDownBlock:(dispatch_block_t)touchDownBlock;

@end
