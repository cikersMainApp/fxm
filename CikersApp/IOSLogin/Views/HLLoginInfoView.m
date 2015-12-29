//
//  HLInputView.m
//  LeRong
//
//  Created by administrater on 15/11/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLLoginInfoView.h"
#import "HLRoundButton.h"
#import <objc/runtime.h>
static void * maxLength = (void *)@"maxLength";

@interface HLLoginInfoView()<UITextFieldDelegate>
@property (nonatomic,strong) UIView * onlyVeriView;
@property (nonatomic,strong) UIButton * onlyVeriButton;
@property (nonatomic,strong) UITextField * veriCodeTF;
@property (nonatomic,strong) NSMutableArray * fieldArray;
@end
@implementation HLLoginInfoView

/**
 *  param格式
 [
    @""
    @""
 ]
 */

- (void) initInputViewByParam:(NSMutableArray *) param
{
    if (!self.fieldArray) {
        self.fieldArray = [[NSMutableArray alloc] init];
    }
    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1/self.contentScaleFactor)];
    line1.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
    [self addSubview:line1];
    for (NSString * placeHolder in param) {
        NSInteger  index = [param indexOfObject:placeHolder];
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, index*(40), [UIScreen mainScreen].applicationFrame.size.width, 40)];
        bgView.backgroundColor = [UIColor clearColor];
        [self addSubview:bgView];
        
        CGFloat tfWidth = [UIScreen mainScreen].applicationFrame.size.width  - 30;
        
        UITextField * valueTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, tfWidth, 40)];
        valueTF.tag           = 100;
        objc_setAssociatedObject(valueTF, maxLength, [NSNumber numberWithInt:11], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        valueTF.placeholder   = placeHolder;
        valueTF.font          = [UIFont systemFontOfSize:14];
        valueTF.textColor     = [UIColor colorWithHexString:@"666666"];
        valueTF.borderStyle   = UITextBorderStyleNone;
        valueTF.keyboardType  = UIKeyboardTypePhonePad;
        if ([placeHolder isEqualToString:@"请输入验证码"]) {
            objc_setAssociatedObject(valueTF, maxLength, [NSNumber numberWithInt:4], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.veriCodeTF = valueTF;
            valueTF.keyboardType  = UIKeyboardTypeNumberPad;
        }
        valueTF.delegate = self;
        [bgView addSubview:valueTF];
        
        [self.fieldArray addObject:valueTF];
        
//        if (index != param.count - 1) {
//            UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(15, 40 - 1/self.contentScaleFactor, [UIScreen mainScreen].applicationFrame.size.width - 15, 1/self.contentScaleFactor)];
//            line2.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
//            [bgView addSubview:line2];
//        }
//        else
        {
            UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 40 - 1/self.contentScaleFactor, [UIScreen mainScreen].applicationFrame.size.width, 1/self.contentScaleFactor)];
            line2.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
            [bgView addSubview:line2];
        }
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginButtonControl:)name:UITextFieldTextDidChangeNotification object:nil];
}

-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSNumber * tfMaxLength = objc_getAssociatedObject(textField,maxLength);
    
    if (![string isEqualToString:@""]) {
        NSString * afterString = [textField.text stringByAppendingString:string];
        if (afterString.length > tfMaxLength.intValue) {
            return NO;
        }
    }
    return YES;
}

- (void) loginButtonControl:(id)sender
{
    NSNotification * noti = sender;
    UITextField * text = noti.object;
    if (text != self.veriCodeTF) {
        if (text.text.length == 11) {
            [self.delegate recallForCanGetVericode:YES];
            [self.delegate sendPhone:text.text];
            return;
        }
        [self.delegate recallForCanGetVericode:NO];
    }
    else
    {
        UITextField * phoneTF = [self.fieldArray firstObject];
        if (text.text.length == 4 && phoneTF.text.length == 11) {
            [self.delegate autoLoginWithVericode:text.text];
        }
    }
}

- (void) resetVericodeTF
{
    if (self.veriCodeTF) {
        self.veriCodeTF.text = @"";
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
