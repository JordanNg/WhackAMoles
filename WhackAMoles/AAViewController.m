//
//  AAViewController.m
//  WhackAMoles
//
//  Created by Jordan Ng on 3/17/14.
//  Copyright (c) 2014 Agency Agency. All rights reserved.
//

#import "AAViewController.h"
#import "AAMoles.h"

@interface AAViewController ()
@property (strong, nonatomic) NSMutableArray *moles;
@property (assign, nonatomic) CGPoint velocity;

@property (strong, nonatomic) CADisplayLink *displayLink;
@end

@implementation AAViewController

-(void)tick:(CADisplayLink *)sender
{
    for (AAMoles *mole in self.moles) {
        [mole move];
    }
    [self removeDeadMoles];
    NSLog(@"mole count: %i", [self.moles count]);
}

- (void)removeDeadMoles
{
    NSMutableArray *discardedMoles = [NSMutableArray array];
    for (AAMoles *mole in self.moles) {
        if (!CGRectIntersectsRect(self.view.bounds, mole.frame) || !mole.superview) {
            [mole removeFromSuperview];
            [discardedMoles addObject:mole];
        }
    }
    
    [self.moles removeObjectsInArray:discardedMoles];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.moles = [NSMutableArray array];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(tick:)];
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];

}

- (void)createMoleAtLocation:(CGPoint)location velocity:(CGVector)velocity
{
    AAMoles *mole = [[AAMoles alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    mole.center = location;
    mole.velocity = velocity;
    mole.backgroundColor = [UIColor colorWithHue:((arc4random()%10)/10.0) saturation:arc4random() brightness:arc4random() alpha:1];
    [self.view addSubview:mole];
    [self.moles addObject:mole];
}

- (IBAction)handleFieldTapped:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    [self createMoleAtLocation:location velocity:CGVectorMake(0, -1.0 * (arc4random()%10 + 1.0))];
}

@end