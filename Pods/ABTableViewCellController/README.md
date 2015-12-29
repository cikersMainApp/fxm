# ABTableViewCellController

Simple to use approach to handle your update cell related code outside of ```tableView:cellForRowAtIndexPath:```. Especially helpfull when you need to handle multiple cell types.

## Integration

* Install via cocoapods (just add pod ```'ABTableViewCellController', '~> 1.0'```), or clone this repository and drag the content of ```ABTableViewCellController``` folder to your project.  
* To use you need to create your cell controller object that implements ```ABTableViewCellController``` protocol:

```objective-c
#import "ABTableViewCellController.h"

@interface CustomCellController : NSObject <ABTableViewCellController>

@end


@implementation CustomCellController

- (void)updateCell:(UITableViewCell *)cell withObject:(NSDictionary *)object {
    cell.textLabel.text = [object objectForKey:@"name"];
    cell.detailTextLabel.text = [object objectForKey:@"email"];
}

@end
```

* Now you just instantiate your cell controller and assign it to your cell, then update the cell. And you're ready to go!

```objective-c
#import "UITableViewCell+CellController.h"
#import "CustomCellController.h"

@implementation YourViewController {
    CustomCellController *_cellController;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellController = [[CustomCellController alloc] init];
    }

    return self;
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"DefaultCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.cellController = _cellController;
    }

    [cell updateCellWithObject:[_dataSource objectAtIndex:indexPath.row]];

    return cell;
}

@end

```

## Compatibility

* iOS 7 and iOS 8

## Credits

ABTableViewCellController was created by [Alex Bumbu](https://github.com/alexbumbu).

## License

ABTableViewCellController is available under the MIT license. See the LICENSE file for more info.
For usage without attribution contact [Alex Bumbu](mailto:alex.bumbu@gmail.com).