//
//  HorizontalParallaxScene.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 03/03/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#import "HorizontalParallaxScene.h"

@interface HorizontalParallaxScene ()

@property (nonatomic, strong) STParallaxNode* parallaxNode;
@property (nonatomic, strong) UITouch* touch;

@end

@implementation HorizontalParallaxScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */
        
        self.backgroundColor = [UIColor colorWithRed:0.482 green:0.773 blue:0.808 alpha:1.000];
        
        self.parallaxNode = [STParallaxNode horizontalParallaxNodeWithSize:sts(size.width, size.height)];
        [self addChild:self.parallaxNode];
        
        SKSpriteNode* s3 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-3"];
        [self.parallaxNode addLayerWithChild:s3 parallaxFactor:0.15 position:STParallaxNodeChildPositionLeading flip:NO];
        
        SKSpriteNode* s2 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-2"];
        [self.parallaxNode addLayerWithChild:s2 parallaxFactor:0.3 position:STParallaxNodeChildPositionLeading flip:YES];
        
        SKSpriteNode* s1 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-1"];
        [self.parallaxNode addLayerWithChild:s1 parallaxFactor:1 position:STParallaxNodeChildPositionLeading flip:NO];
        
        SKSpriteNode* s7 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-7"];
        SKSpriteNode* s8 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-8"];
        SKSpriteNode* s9 = [SKSpriteNode spriteNodeWithImageNamed:@"resource-9"];
        STParallaxNodeLayer* layer = [[STParallaxNodeLayer alloc] init];
        layer.childs = @[s7, s8, s9];
        layer.factor = 0.5;
        layer.position = STParallaxNodeChildPositionRandom;
        layer.positionRange = NSMakeRange(size.height / 2.0, size.height / 2.0 - 44);
        layer.pickingPolicy = STParallaxNodeLayerPickingPolicyRandom;
        layer.marginRange = NSMakeRange(50, 250);
        [self.parallaxNode addLayer:layer];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
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
    [self.parallaxNode updateWithIncrement:self.touch?-3:3];
}

@end
