//
//  BottomView.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "BottomView.h"
#import "LineSegment.h"

/*
 
 We'll do UIBezierPath in here and draw using our fingerex
 
 */

@interface BottomView()
@property (nonatomic) NSMutableArray <LineSegment *>* line;
@end

@implementation BottomView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    _line = [NSMutableArray new];
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  // Drawing code
  // Call indirectly using setNeedDisplay
  UIBezierPath *path = [UIBezierPath bezierPath];
  path.lineWidth = 6.0;
  path.lineCapStyle = kCGLineCapRound;
  UIColor *gray = [UIColor grayColor];
  [gray setStroke];
  for (NSInteger i = 0; i < self.line.count; ++i) {
    LineSegment *segment = self.line[i];
    if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
      [path moveToPoint:segment.firstPoint];
      continue;
    }
    [path addLineToPoint:segment.firstPoint];
    [path addLineToPoint:segment.secondPoint];
  }
  [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  UITouch *touch = touches.anyObject;
  CGPoint location = [touch locationInView:self];
  LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:location secondPoint:location];
  [self.line addObject:segment];
  [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  UITouch *touch = touches.anyObject;
  CGPoint previousLocation = [touch previousLocationInView:self];
  CGPoint location = [touch locationInView:self];
  LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:previousLocation secondPoint:location];
  [self.line addObject:segment];
  [self setNeedsDisplay];
}

- (void)clear {
  [self.line removeAllObjects];
  [self setNeedsDisplay];
}


@end
