//
//  AddressPickerViewC.h
//  CikersMain
//
//  Created by fxm on 15/12/1.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol AddressPickerDelegate <NSObject>

@required

-(void)returnSelectContent:(NSString*)address;

@end

@interface AddressPickerViewC : UIViewController<UIPickerViewDelegate ,UIPickerViewDataSource>
@property (nonatomic ,strong) UIPickerView *cityPicker;
@property (nonatomic ,strong) UILabel *cityLabel;
@property (nonatomic ,strong) id<AddressPickerDelegate>delegate;
@end
