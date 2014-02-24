//
//  SKNode+STAdditions.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKNode (STAdditions)

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
