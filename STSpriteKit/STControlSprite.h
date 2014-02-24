//
//  STControlSprite.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface STControlSprite : SKSpriteNode

/**
 * This boolean will be set to YES if a touch is down and inside the receiver's area,
 * and will be set to NO if a touch is up or outside the receiver's area.
 */
@property (nonatomic, assign) BOOL highlighted;

/**
 *  The action message will be send to the target if a touchUpInside event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param target The object to whom this message will be sent
 *  @param action The selector representing the message
 */
- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;

/**
 *  The block will be executed if a touchUpInside event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param touchUpInsideBlock The block that will be executed.
 */
- (void)setTouchUpInsideBlock:(dispatch_block_t)touchUpInsideBlock;

/**
 *  The action message will be send to the target if a touchUpOutside event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param target The object to whom this message will be sent
 *  @param action The selector representing the message
 */
- (void)setTouchUpOutsideTarget:(id)target action:(SEL)action;

/**
 *  The block will be executed if a touchUpOutside event is recognised on the receiver.
 *  The userInteractionEnabled property will be set to YES by invoking that method.
 *  @param touchUpOutsideBlock The block that will be executed.
 */
- (void)setTouchUpOutsideBlock:(dispatch_block_t)touchUpOutsideBlock;

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
