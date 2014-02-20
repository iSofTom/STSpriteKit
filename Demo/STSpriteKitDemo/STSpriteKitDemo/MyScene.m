//
//  MyScene.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size
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
        
        STControlSprite* sprite = [STControlSprite spriteNodeWithColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:1] size:CGSizeMake(100, 100)];
        sprite.position = CGPointMake(50, 50);
        [sprite setTouchDownBlock:^{
            NSLog(@"sprite touch");
        }];
        [node addChild:sprite];
        
        STControlSprite* sprite2 = [STControlSprite spriteNodeWithColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:1] size:CGSizeMake(100, 100)];
        sprite2.position = CGPointMake(100, 100);
//        [sprite2 setTouchDownBlock:^{
//            NSLog(@"sprite2 touch");
//        }];
        [node addChild:sprite2];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"scene touch");
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
