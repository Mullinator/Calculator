//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Brad Cypert on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"


@interface CalculatorViewController()
@property (nonatomic) BOOL midEntry;
@property (nonatomic, strong) CalculatorBrain *brain; 
@end

@implementation CalculatorViewController
@synthesize display, midEntry;
@synthesize brain = _brain;

-(CalculatorBrain *)brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;        
}

- (IBAction)digitPressed:(UIButton *)sender {
    if(self.midEntry)
        self.display.text = [self.display.text stringByAppendingString:[sender currentTitle]];
    else
    {
        self.display.text = [sender currentTitle];
        self.midEntry = true;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.midEntry = NO;
}

- (IBAction)operationPressed:(id)sender {
    if(self.midEntry)
        [self enterPressed];
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}



@end
