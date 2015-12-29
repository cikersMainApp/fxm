//
//  ARSegmentPageControllerHeaderProtocol.h
//  Board
//
//  Created by August on 15/5/5.
//
//

#import <Foundation/Foundation.h>

@protocol ARSegmentPageControllerHeaderProtocol <NSObject>

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *img_left;
@property (nonatomic,strong) UIImageView *img_right;

-(void)hideUI;
-(void)showUI;

-(void)updateUI:(id)sender;

@end
