//
//  ViewController.m
//  BRContainerController
//
//  Created by Bharath V on 14/08/15.
//  Copyright (c) 2015 BR. All rights reserved.
//

#import "ViewController.h"
#import "BRContainerViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (nonatomic, strong) BRContainerViewController * containerCntrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btn1 setBackgroundImage:[ViewController imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    [self.btn1 setBackgroundImage:[ViewController imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];

    [self.btn2 setBackgroundImage:[ViewController imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    [self.btn2 setBackgroundImage:[ViewController imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
    
    [self.btn3 setBackgroundImage:[ViewController imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    [self.btn3 setBackgroundImage:[ViewController imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
    
    [self.btn1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.btn2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.btn3 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
    self.btn1.selected = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embeddedCntrl"]) {
        self.containerCntrl = segue.destinationViewController;
        [self.containerCntrl showControllerWithType:BTN_CNTRL1];
    }
}

- (IBAction)btnTapped:(id)sender {
    UIButton * btn = (UIButton *)sender;
    btn.selected = YES;
    if(btn.tag == 0) {
        self.btn2.selected = NO;
        self.btn3.selected = NO;
        [self.containerCntrl showControllerWithType:BTN_CNTRL1];
    } else if(btn.tag == 1) {
        self.btn1.selected = NO;
        self.btn3.selected = NO;

        [self.containerCntrl showControllerWithType:BTN_CNTRL2];
    } else if(btn.tag == 2) {
        self.btn2.selected = NO;
        self.btn1.selected = NO;

        [self.containerCntrl showControllerWithType:BTN_CNTRL3];
    }
}


@end
