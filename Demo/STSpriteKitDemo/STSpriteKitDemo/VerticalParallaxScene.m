//
//  VerticalParallaxScene.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 03/03/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "VerticalParallaxScene.h"

@interface VerticalParallaxScene ()

@property (nonatomic, strong) STParallaxNode* parallaxNode;
@property (nonatomic, strong) UITouch* touch;

@end

@implementation VerticalParallaxScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */
        
        self.backgroundColor = [UIColor colorWithRed:0.482 green:0.773 blue:0.808 alpha:1.000];
        
        self.parallaxNode = [STParallaxNode verticalParallaxNodeWithSize:sts(size.width, size.height)];
        [self addChild:self.parallaxNode];
        
        SKSpriteNode* s1 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-4"];
        SKSpriteNode* s2 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-5"];
        SKSpriteNode* s3 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-6"];
        
        [self.parallaxNode addLayerWithChilds:@[s1,s2,s3] parallaxFactor:1.0 position:STParallaxNodeChildPositionRandom policy:STParallaxNodeLayerPickingPolicyRandom];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.touch)
    {
        self.touch = [touches anyObject];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch* touch in touches)
    {
        if (touch == self.touch)
        {
            self.touch = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime
{
    [self.parallaxNode updateWithIncrement:self.touch?-2:2];
}

@end
