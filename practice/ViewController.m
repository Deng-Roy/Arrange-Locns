//
//  ViewController.m
//  practice
//
//  Created by 劳一 on 16/7/25.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"
#define ImageXY 50
#define ImageCount 13

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self adjustwithimageCOL:3 get:YES];

    
   // [self setImage:@"1.png" x:35 y:133];
 
}
-(void)adjustwithimageCOL:(int)column get:(BOOL)add{
    
    CGFloat TheY= 133;
    CGFloat gap = (self.view.frame.size.width - ImageXY * column)/(column +1);
    CGFloat TheX = gap;
    
    for(int i =0 ;i<ImageCount;++i){
        int no =i%8;
        NSString *png = [NSString stringWithFormat:@"%d.png",no+1 ];
        CGFloat x = TheX +(i %column) *(gap+ImageXY);
        CGFloat y =TheY +(i/column) *(gap+ImageXY);
      //  NSLog(@"%.f,%.f",x,y);
        if(add){
        [self setImage:png x:x y:y];
           // NSLog(@"%.f,%.f",x,y);
           // NSLog(@"%@",self.class);
            if(i == ImageCount-1){
                CGFloat x = TheX +((i+1) %column) *(gap+ImageXY);
                CGFloat y =TheY +((i+1)/column) *(gap+ImageXY);
//                NSLog(@"%.f======,%.f",x,y);
                [self setButtonwithBackgroundx:x y:y];
                
            }
        }else{
          //  NSLog(@"%i",i);
            UIView *subview = self.view.subviews[i +1];
        //    NSLog(@"%@",self.view.subviews[i+1]);
            CGRect Fview= subview.frame;
            Fview.origin = CGPointMake(x, y);
//            NSLog(@"%.f,~~~~%.f",x,y);
//            NSLog(@"%@",self.view.class);
            
            subview.frame =Fview;
            if(i == ImageCount-1){
                //[self setButtonwithBackgroundx:x y:y];
               // NSLog(@"%i------",i);
                UIView *subview = self.view.subviews[ImageCount+1];
                //NSLog(@"%@",self.view.subviews[14]);

                CGRect Fview= subview.frame;
                CGFloat x = TheX +((i+1) %column) *(gap+ImageXY);
                CGFloat y =TheY +((i+1)/column) *(gap+ImageXY);
                Fview.origin = CGPointMake(x, y);
               // NSLog(@"%.f,-----%.f",x,y);
                subview.frame =Fview;
            }


        }
//        NSLog(@"%i",i);

      
    }

}
-(void)setImage:(NSString *)icon x:(CGFloat)X y:(CGFloat)Y{
 

    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake(X, Y, ImageXY, ImageXY);
    image.image = [UIImage imageNamed:icon];
    [self.view addSubview:image];

}

-(void)setButtonwithBackgroundx:(CGFloat)x y:(CGFloat)y{
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(x, y, ImageXY, ImageXY);
    UIImage *b = [UIImage imageNamed:@"12.png"];
 //   btn.backgroundColor = [UIColor colorWithPatternImage:b];
    [btn setBackgroundImage:b forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)addImage{
    NSLog(@"a a ");
    UIImage *ima = [[UIImage alloc] init];
    
}
- (IBAction)segment:(UISegmentedControl *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.33];
   // int column = sender.selectedSegmentIndex+ 3;
    [self adjustwithimageCOL:sender.selectedSegmentIndex + 3 get:NO];
        

    
    [UIView commitAnimations];

}
@end
