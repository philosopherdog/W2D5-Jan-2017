//
//  CoreGraphicsViewController.m
//  W2D5-Demos
//
//  Created by steve on 2017-01-19.
//  Copyright © 2017 steve. All rights reserved.
//

#import "CoreGraphicsViewController.h"
#import "TopView.h"
#import "BottomView.h"

@interface CoreGraphicsViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet BottomView *bottomView;
@property (weak, nonatomic) IBOutlet TopView *topView;
@end

@implementation CoreGraphicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clear {
  [self.bottomView clear];
}


@end
