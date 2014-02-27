//
//  SKScene+STAdditions.m
//  STSpriteKitDemo
//
//  Created by Thomas Dupont on 24/02/2014.

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

#import "SKScene+STAdditions.h"

#import "SKNode+STAdditions.h"

@implementation SKScene (STAdditions)

- (SKNode *)nodeAtPointWithUserInteractionEnabledAlgorithm:(CGPoint)p
{
    NSArray* nodesAtPoint = [self nodesAtPoint:p];
    
    nodesAtPoint = [nodesAtPoint sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        SKNode* n1 = obj1;
        SKNode* n2 = obj2;
        
        if (n1.userInteractionEnabled && !n2.userInteractionEnabled)
        {
            return NSOrderedAscending;
        }
        else if (!n1.userInteractionEnabled && n2.userInteractionEnabled)
        {
            return NSOrderedDescending;
        }
        else
        {
            CGFloat n1ZPosition = [n1 calculateAccumulatedZPosition];
            CGFloat n2ZPosition = [n2 calculateAccumulatedZPosition];
            
            if (n1ZPosition > n2ZPosition)
            {
                return NSOrderedAscending;
            }
            else if (n1ZPosition < n2ZPosition)
            {
                return NSOrderedDescending;
            }
            else
            {
                if ([n1 inParentHierarchy:n2])
                {
                    return NSOrderedAscending;
                }
                else if ([n2 inParentHierarchy:n1])
                {
                    return NSOrderedDescending;
                }
                else
                {
                    SKNode* parent = n1.parent;
                    if (n2.parent != parent)
                    {
                        return NSOrderedSame;
                    }
                    else
                    {
                        NSArray* parentChildren = parent.children;
                        
                        NSInteger n1Idx = [parentChildren indexOfObject:n1];
                        NSInteger n2Idx = [parentChildren indexOfObject:n2];
                        
                        if (n2Idx == NSNotFound)
                        {
                            return NSOrderedAscending;
                        }
                        else if (n1Idx == NSNotFound)
                        {
                            return NSOrderedDescending;
                        }
                        else
                        {
                            if (n1Idx < n2Idx)
                            {
                                return NSOrderedDescending;
                            }
                            else if (n1Idx > n2Idx)
                            {
                                return NSOrderedAscending;
                            }
                            else
                            {
                                return NSOrderedSame;
                            }
                        }
                    }
                }
            }
        }
    }];
    
    return [nodesAtPoint firstObject] ?: self;
}

@end
