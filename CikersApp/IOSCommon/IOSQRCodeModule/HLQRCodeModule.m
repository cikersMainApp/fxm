//
//  HLQRCodeModule.m
//  TeaLife
//
//  Created by administrater on 15/12/8.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLQRCodeModule.h"

@interface HLQRCodeModule ()<AVCaptureMetadataOutputObjectsDelegate>
@property (strong,nonatomic) AVCaptureDevice  * device;
@property (strong,nonatomic) AVCaptureDeviceInput * input;
@property (strong,nonatomic) AVCaptureMetadataOutput * output;
@property (strong,nonatomic) AVCaptureSession * session;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer * preview;
@end

@implementation HLQRCodeModule

- (void) generateQRCodeInView:(UIView *) mySuperView
{
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError * error = nil;
    self.input  = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    CGRect instereRect = CGRectMake((124)/kScreenHeight,((kScreenWidth-220)/2)/kScreenWidth,220/kScreenHeight,220/kScreenWidth);
    [self.output setRectOfInterest:instereRect];
//    CGSize size = mySuperView.bounds.size;
//    CGRect cropRect = CGRectMake(40, 100, 240, 240);
//    CGFloat p1 = size.height/size.width;
//    CGFloat p2 = 1920./1080.;  //使用了1080p的图像输出
//    if (p1 < p2) {
//        CGFloat fixHeight = mySuperView.bounds.size.width * 1920. / 1080.;
//        CGFloat fixPadding = (fixHeight - size.height)/2;
//        self.output.rectOfInterest = CGRectMake((cropRect.origin.y + fixPadding)/fixHeight,
//                                                  cropRect.origin.x/size.width,
//                                                  cropRect.size.height/fixHeight,
//                                                  cropRect.size.width/size.width);
//    } else {
//        CGFloat fixWidth = mySuperView.bounds.size.height * 1080. / 1920.;
//        CGFloat fixPadding = (fixWidth - size.width)/2;
//        self.output.rectOfInterest = CGRectMake(cropRect.origin.y/size.height,
//                                                  (cropRect.origin.x + fixPadding)/fixWidth,
//                                                  cropRect.size.height/size.height,
//                                                  cropRect.size.width/fixWidth);
//    }
    
    
    self.preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    if (_device.isFocusPointOfInterestSupported &&[_device isFocusModeSupported:AVCaptureFocusModeAutoFocus])
    {
        [_input.device lockForConfiguration:nil];
        [_input.device setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
        [_input.device unlockForConfiguration];
    }
    _preview.videoGravity =AVLayerVideoGravityResizeAspectFill;
    _preview.frame =mySuperView.frame;
    [mySuperView.layer insertSublayer:_preview atIndex:0];
    
    
    // Start
    [self.session startRunning];
}

- (void) restartQRView
{
    if ([self.session isRunning]) {
        return;
    }
    [self.session startRunning];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    [APSProgress showIndicatorView];
    [_session stopRunning];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [APSProgress hidenIndicatorView];
        NSString *stringValue;
        if ([metadataObjects count] >0)
        {
            //停止扫描
            
            AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
            stringValue = metadataObject.stringValue;
            [self.delegate qrCodeScanSuccess:stringValue];
        }
    });
}

- (void) dealloc
{
    
}
@end
