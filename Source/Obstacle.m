//
//  Obstacle.m
//  FlappyBird
//
//  Created by John Lee on 7/1/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Obstacle.h"
@implementation Obstacle {
    CCNode *_topPipe;
    CCNode *_bottomPipe;
}
#define ARC4RANDOM_MAX      0x100000000
// visibility on a 3,5-inch iPhone ends a 88 points and we want some meat
static const CGFloat minimumYPositionTopPipe = 128.f;
// visibility ends at 480 and we want some meat
static const CGFloat maximumYPositionBottomPipe = 440.f;
// distance between top and bottom pipe
static const CGFloat pipeDistance = 142.f;
// calculate the end of the range of top pipe
static const CGFloat maximumYPositionTopPipe = maximumYPositionBottomPipe - pipeDistance;

- (void)setupRandomPosition {
    // value between 0.f and 1.f
    CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
    CGFloat range = maximumYPositionTopPipe - minimumYPositionTopPipe;
    _topPipe.position = ccp(_topPipe.position.x, minimumYPositionTopPipe + (random * range));
    _bottomPipe.position = ccp(_bottomPipe.position.x, _topPipe.position.y + pipeDistance);
}


- (void)didLoadFromCCB {
    _topPipe.physicsBody.collisionType = @"level";
    _topPipe.physicsBody.sensor = TRUE;
    _bottomPipe.physicsBody.collisionType = @"level";
    _bottomPipe.physicsBody.sensor = TRUE;
}
@end
