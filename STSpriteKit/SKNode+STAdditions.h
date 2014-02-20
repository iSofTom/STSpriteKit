//
//  SKNode+STAdditions.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKNode (STAdditions)

- (void)runActionsSequence:(NSArray*)actions;
- (void)runAction:(SKAction*)action afterDelay:(NSTimeInterval)delay;

@end
