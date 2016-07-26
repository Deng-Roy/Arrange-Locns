//
//  ViewController.m
//  practice
//
//  Created by 劳一 on 16/7/25.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"
#define ImageXY 50

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    int column = 3;
    CGFloat TheY= 133;
    CGFloat gap = (self.view.frame.size.width - ImageXY * column)/(column +1);
    CGFloat TheX = gap;
    
    for(int i =0 ;i<13;i++){
        int no =i%8;
        NSString *png = [NSString stringWithFormat:@"%d.png",no+1 ];
        CGFloat x = TheX + (i %column) *(gap+ImageXY);
        CGFloat y =TheY +(i/column) *(gap+ImageXY);
           [self setImage:png x:x y:y];
        NSLog(@"%.f,%.f",x,y);

    }
   // [self setImage:@"1.png" x:35 y:133];
 
}
-(void)setImage:(NSString *)icon x:(CGFloat)X y:(CGFloat)Y{
 

    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake(X, Y, ImageXY, ImageXY);
    image.image = [UIImage imageNamed:icon];
    [self.view addSubview:image];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segment:(UISegmentedControl *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.77];
    int column = sender.selectedSegmentIndex+ 3;
    CGFloat TheY= 133;
    CGFloat gap = (self.view.frame.size.width - ImageXY * column)/(column +1);

    CGFloat TheX = gap;
    
    for(int i =0 ;i<13;i++){
        CGFloat x = TheX + (i %column) *(gap+ImageXY);
        CGFloat y =TheY +(i/column) *(gap+ImageXY);
         UIView *subview = self.view.subviews[i +1];
        CGRect Fview= subview.frame;
        
        Fview.origin = CGPointMake(x, y);
        
        subview.frame =Fview;
        

    }
    [UIView commitAnimations];

}
@end
