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
@end

@implementation AAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.moles = [NSMutableArray array];
}

- (void)createMoleAtLocation:(CGPoint)location velocity:(CGVector)velocity
{
    AAMoles *mole = [[AAMoles alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    mole.center = location;
    mole.velocity = velocity;
    mole.backgroundColor = [UIColor redColor];
    [self.view addSubview:mole];
    [self.moles addObject:mole];
}

CGVector velocity = CGVectorMake(arc4random()%10, arc4random()%10);

- (IBAction)handleFieldTapped:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    [self createMoleAtLocation:location];
}

@end