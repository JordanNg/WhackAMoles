//
//  AAMoles.m
//  WhackAMoles
//
//  Created by Jordan Ng on 3/17/14.
//  Copyright (c) 2014 Agency Agency. All rights reserved.
//

#import "AAMoles.h"

@interface AAMoles ()
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@end

@implementation AAMoles

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addGestureRecognizer:self.tapGesture];
    }
    return self;
}

//How we delete the Mole
- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    }
    return _tapGesture;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"tap mole!");
}

//How we move the Mole:
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
