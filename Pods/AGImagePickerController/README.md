## AGImagePickerController(iOS应用图片选择器)


AGImagePickerController is a image picker, support photos multiple choice, to support large map slipping preview, support zoom preview, support for horizontal and vertical screen, supports all iOS devices

AGImagePickerController是一个图片选择器，支持图片多选，支持大图横滑预览，支持放大预览，支持横竖屏，支持所有的iOS设备。

![Screenshot](https://dl.dropboxusercontent.com/u/59801943/Screenshots/AGImagePickerController-1.png)
![Screenshot](https://dl.dropboxusercontent.com/u/59801943/Screenshots/AGImagePickerController-2.png)
![Screenshot](https://dl.dropboxusercontent.com/u/59801943/Screenshots/AGImagePickerController-3.png)
![Screenshot](https://dl.dropboxusercontent.com/u/59801943/Screenshots/AGImagePickerController-4.png)
![Screenshot](https://dl.dropboxusercontent.com/u/59801943/Screenshots/AGImagePickerController-5.png)


### Usage(用法)

``` objective-c
    self.selectedPhotos = [NSMutableArray array];
    
    __block AGViewController *blockSelf = self;
    
    ipc = [AGImagePickerController sharedInstance:self];
    ipc.didFailBlock = ^(NSError *error) {
        NSLog(@"Fail. Error: %@", error);
        
        if (error == nil) {
            [blockSelf.selectedPhotos removeAllObjects];
            NSLog(@"User has cancelled.");
            
            [blockSelf dismissModalViewControllerAnimated:YES];
        } else {
            
            // We need to wait for the view controller to appear first.
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [blockSelf dismissModalViewControllerAnimated:YES];
            });
        }
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        
    };
    ipc.didFinishBlock = ^(NSArray *info) {
        [blockSelf.selectedPhotos setArray:info];
        
        NSLog(@"Info: %@", info);
        [blockSelf dismissModalViewControllerAnimated:YES];
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    };
```

## Contact(联系)

- [https://github.com/SpringOx](https://github.com/SpringOx)(GitHub)
- [jiachunke@gmail.com](jiachunke@gmail.com)(Email)



