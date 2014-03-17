//
//  AAMoles.m
//  WhackAMoles
//
//  Created by Jordan Ng on 3/17/14.
//  Copyright (c) 2014 Agency Agency. All rights reserved.
//

#import "AAMoles.h"

@implementation AAMoles

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)move
{
    CGVector vel = self.velocity;
    
    self.velocity = vel;
    
    CGPoint loc = self.center;
    loc.x += self.velocity.dx;
    loc.y +=self.velocity.dy;
    self.center = loc;
}

@end
