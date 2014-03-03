//
//  ControlScene.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 03/03/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "ControlScene.h"

@implementation ControlScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        STControlNode* node = [STControlNode node];
        [node setTouchDownBlock:^{
            NSLog(@"node touch");
        }];
        [self addChild:node];

        STControlSprite* sprite = [STControlSprite spriteNodeWithColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:1] size:sts(100, 100)];
        sprite.position = stp(50, 50);
        [sprite setTouchDownBlock:^{
            NSLog(@"sprite touch");
        }];
        [node addChild:sprite];

        SKSpriteNode* sprite2 = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:1] size:sts(100, 100)];
        sprite2.position = stp(100, 100);
        [node addChild:sprite2];

        SKNode* node2 = [SKNode node];
        [self addChild:node2];

        SKSpriteNode* sprite3 = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:1] size:sts(100, 100)];
        sprite3.position = stp(50, 150);
        [node2 addChild:sprite3];

        NSLog(@"node : %@", NSStringFromCGRect([node calculateAccumulatedFrame]));
        NSLog(@"node2 : %@", NSStringFromCGRect([node2 calculateAccumulatedFrame]));
    }
    return self;
}

- (SKNode*)nodeAtPoint:(CGPoint)p
{
    return [self nodeAtPointWithUserInteractionEnabledAlgorithm:p];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"scene touch");
}

@end
