//
//  STControlNode.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

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
