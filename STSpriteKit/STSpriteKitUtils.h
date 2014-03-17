//
//  STSpriteKitUtils.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.

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

#define stp(x,y)        CGPointMake(x,y)
#define stpZero         CGPointMake(0,0)

#define sts(w,h)        CGSizeMake(w,h)
#define stsZero         CGSizeMake(0,0)

#define str(x,y,w,h)    CGRectMake(x,y,w,h)
#define strZero         CGRectMake(0,0,0,0)
#define strFromSize(s)  CGRectMake(0,0,s.width,s.height)

#define stv(dx,dy)      CGVectorMake(dx,dy)
#define stvZero         CGVectorMake(0,0)
#define stvHorizontal(dx)   CGVectorMake(dx,0)
#define stvVertical(dy)     CGVectorMake(0,dy)

#define stDegreToRadian(degre) (degre * M_PI / 180)
#define stRadianToDegre(radian) (radian * 180 / M_PI)

static inline CGPoint stpNormalize(CGPoint pt)
{
    if (pt.x == 0 && pt.y == 0)
    {
        return CGPointZero;
    }
    
    float m = sqrtf(pt.x * pt.x + pt.y * pt.y);
    return CGPointMake(pt.x/m, pt.y/m);
}

static inline CGPoint stpAdd(CGPoint pt1, CGPoint pt2)
{
    return CGPointMake(pt1.x + pt2.x, pt1.y + pt2.y);
}

static inline CGPoint stpSubtract(CGPoint pt1, CGPoint pt2)
{
    return CGPointMake(pt1.x - pt2.x, pt1.y - pt2.y);
}

static inline CGPoint stpMultiply(CGPoint pt, float scalar)
{
    return CGPointMake(pt.x * scalar, pt.y * scalar);
}

static inline CGPoint strGetCenter(CGRect rect)
{
    return CGPointMake(rect.origin.x + rect.size.width/2.0, rect.origin.y + rect.size.height/2.0);
}
