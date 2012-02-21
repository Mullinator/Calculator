//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Brad Cypert on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end
