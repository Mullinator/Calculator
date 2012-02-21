//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Brad Cypert on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack;

-(NSMutableArray *)operandStack
{
    if(!operandStack)
        operandStack = [[NSMutableArray alloc] init];
    return operandStack;
}

//Left off on page 175

-(double)popOperand{
    NSNumber *num = [self.operandStack lastObject];
    if(num) [self.operandStack removeLastObject];
    return [num doubleValue];
}

-(void)pushOperand:(double)operand{
    
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)performOperation:(NSString *)operation{
    double result = 0;
    if([operation isEqualToString:@"+"])
        result = [self popOperand] + [self popOperand];
    else if([operation isEqualToString:@"*"])
        result = [self popOperand] * [self popOperand];
    else if([operation isEqualToString:@"-"])
    {
        double sub = [self popOperand];
        result = [self popOperand] - sub;
    }
    else if([operation isEqualToString:@"/"])
    {
        double div = [self popOperand];
        if(div) result = [self popOperand] / div;
    }
    
    [self pushOperand:result];
    return result;
}

@end
