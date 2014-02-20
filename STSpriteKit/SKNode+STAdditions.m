//
//  SKNode+STAdditions.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "SKNode+STAdditions.h"

@implementation SKNode (STAdditions)

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

- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay
{
    SKAction* delayAction = [SKAction waitForDuration:delay];
    [self runAction:[SKAction sequence:@[delayAction, action]]];
}

@end
