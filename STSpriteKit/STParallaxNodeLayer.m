//
//  STParallaxNodeLayer.m
//  STSpriteKit
//
//  Created by Thomas Dupont on 27/02/2014.

/***********************************************************************************
 *
 * Copyright (c) 2014 Thomas Dupont
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 ***********************************************************************************/

#import "STParallaxNodeLayer.h"

#import "STParallaxNodeLayer_private.h"

@implementation STParallaxNodeLayer

- (id)init
{
    self = [super init];
    if (self)
    {
        self.actualChilds = [[NSMutableArray alloc] init];
        self.actualChildsFlips = [[NSMutableArray alloc] init];
        self.factor = 1.0;
        self.position = STParallaxNodeChildPositionLeading;
        self.positionRange = NSMakeRange(NSNotFound, 0);
        self.flip = NO;
        self.pickingPolicy = STParallaxNodeLayerPickingPolicyCircular;
        self.marginRange = NSMakeRange(0, 0);
        self.nextMarginValue = 0;
    }
    return self;
}

- (SKNode*)createFirstChild
{
    if (self.child)
    {
        SKNode* node = [self.child copy];
        node.zPosition = self.zPosition;
        [self.actualChilds addObject:node];
        [self.actualChildsFlips addObject:@NO];
        return node;
    }
    else
    {
        SKNode* node = [[self.childs firstObject] copy];
        node.zPosition = self.zPosition;
        [self.actualChilds addObject:node];
        return node;
    }
}

- (void)setMarginRange:(NSRange)marginRange
{
    _marginRange = marginRange;
    
    [self computeNextMarginValue];
}

- (void)computeNextMarginValue
{
    if (self.marginRange.length == 0)
    {
        self.nextMarginValue = self.marginRange.location;
    }
    else
    {
        self.nextMarginValue = self.marginRange.location + arc4random() % (int)(self.marginRange.length);
    }
}

- (SKNode*)createNeighbour:(STParallaxNodeLayerNeighbour)neighbour forChild:(SKNode*)child
{
    SKNode* node = nil;
    
    if (self.child)
    {
        NSUInteger index = [self.actualChilds indexOfObject:child];
        if (index != NSNotFound)
        {
            node = [self.child copy];
            node.zPosition = self.zPosition;
            
            BOOL nodeFlip = NO;
            
            if (self.flip)
            {
                BOOL previousFlipped = [[self.actualChildsFlips objectAtIndex:index] boolValue];
                nodeFlip = !previousFlipped;
                
                if (nodeFlip)
                {
                    if ([self isHorizontal])
                    {
                        node.xScale = -1;
                    }
                    else
                    {
                        node.yScale = -1;
                    }
                }
            }
            
            if (neighbour == STParallaxNodeLayerNeighbourLeading)
            {
                [self.actualChilds insertObject:node atIndex:0];
                [self.actualChildsFlips insertObject:@(nodeFlip) atIndex:0];
            }
            else
            {
                [self.actualChilds addObject:node];
                [self.actualChildsFlips addObject:@(nodeFlip)];
            }
        }
    }
    else
    {
        NSInteger index = 0;
        
        if (self.pickingPolicy == STParallaxNodeLayerPickingPolicyCircular)
        {
            if (neighbour == STParallaxNodeLayerNeighbourLeading)
            {
                index = self.currentChildIndex + 1;
                
                if (index == [self.childs count])
                {
                    index = 0;
                }
            }
            else if (neighbour == STParallaxNodeLayerNeighbourTrailing)
            {
                index = self.currentChildIndex - 1;
                
                if (index < 0)
                {
                    index = [self.childs count] - 1;
                }
            }
        }
        else if (self.pickingPolicy == STParallaxNodeLayerPickingPolicyRandom)
        {
            index = arc4random_uniform((uint32_t)[self.childs count]);
        }
        
        self.currentChildIndex = index;
        
        if (index != NSNotFound)
        {
            SKNode* modelNode = [self.childs objectAtIndex:index];
            
            node = [modelNode copy];
            node.zPosition = self.zPosition;
            
            if (neighbour == STParallaxNodeLayerNeighbourLeading)
            {
                [self.actualChilds insertObject:node atIndex:0];
            }
            else
            {
                [self.actualChilds addObject:node];
            }
        }
    }
    
    [self computeNextMarginValue];
    
    return node;
}

- (void)removeChild:(SKNode*)child
{
    NSUInteger index = [self.actualChilds indexOfObject:child];
    
    if (index != NSNotFound)
    {
        [self.actualChilds removeObjectAtIndex:index];
        if (self.child)
        {
            [self.actualChildsFlips removeObjectAtIndex:index];
        }
        [child removeFromParent];
    }
}

@end
