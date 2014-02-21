//
//  STSpriteKitUtils.h
//  STSpriteKit
//
//  Created by Thomas Dupont on 20/02/2014.
//  Copyright (c) 2014 iSofTom. All rights reserved.
//

#define stp(x,y) CGPointMake(x,y)
#define sts(w,h) CGSizeMake(w,h)

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
