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
    [self runAction:[SKAction sequence:actions]];
}

- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay
{
    SKAction* delayAction = [SKAction waitForDuration:delay];
    [self runAction:[SKAction sequence:@[delayAction, action]]];
}

@end
