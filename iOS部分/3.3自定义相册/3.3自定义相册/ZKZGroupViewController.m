//
//  ZKZGroupViewController.m
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZGroupViewController.h"
#import "ZKZPickerViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
@interface ZKZGroupViewController ()
@property (nonatomic, strong) ALAssetsLibrary *library;
@end

@implementation ZKZGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //添加左侧取消按钮
    UIBarButtonItem * cancelBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelClick)];
    self.navigationItem.leftBarButtonItem = cancelBtn;
    //初始化数据
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    self.assetGroups = tempArray;
    
    ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
    self.library = assetLibrary;
    NSLog(@"assetLibrary = %@",assetLibrary);
    
    //加载本地相册数据
    //主队列开启异步任务，虽然不会开启新的线程，但是他会把异步任务降低优先级，等闲着的时候，就会在主线程上执行异步任务。
    dispatch_async(dispatch_get_main_queue(), ^{
        @autoreleasepool {
        void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group,BOOL *stop){
            if (group == nil) {
                return;
            }
            
            // added fix for camera albums order
            NSString *sGroupPropertyName = (NSString *)[group valueForProperty:ALAssetsGroupPropertyName];
            NSLog(@"sGroupPropertyName= %@",sGroupPropertyName);
            NSUInteger nType = [[group valueForProperty:ALAssetsGroupPropertyType] intValue];
            NSLog(@"nType = %u",nType);
            if ([[sGroupPropertyName lowercaseString] isEqualToString:@"camera roll"] && nType == ALAssetsGroupSavedPhotos) {
                [self.assetGroups insertObject:group atIndex:0];
            }
            else {
                [self.assetGroups addObject:group];
            }

            // Reload albums
            [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
            
        };
        // Group Enumerator Failure Block
        void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {
            
            if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied) {
                NSString *errorMessage = NSLocalizedString(@"This app does not have access to your photos or videos. You can enable access in Privacy Settings.", nil);
                [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Access Denied", nil) message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
                
            } else {
                NSString *errorMessage = [NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]];
                [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
            }
            
            [self.navigationItem setTitle:nil];
            NSLog(@"A problem occured %@", [error description]);
        };
        //遍历相册的所有内容
        [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:assetGroupEnumerator failureBlock:assetGroupEnumberatorFailure];
        }
    });
    
}
- (ALAssetsFilter *)assetFilter
{
    NSLog(@"mediaTypes = %@",self.mediaTypes);
    if([self.mediaTypes containsObject:(NSString *)kUTTypeImage] && [self.mediaTypes containsObject:(NSString *)kUTTypeMovie])
    {
        return [ALAssetsFilter allAssets];
    }
    else if([self.mediaTypes containsObject:(NSString *)kUTTypeMovie])
    {
        return [ALAssetsFilter allVideos];
    }
    else
    {
        return [ALAssetsFilter allPhotos];
    }
}




#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.assetGroups count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Get count
    ALAssetsGroup *g = (ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row];
    //设置过滤器
    [g setAssetsFilter:[self assetFilter]];
    NSInteger gCount = [g numberOfAssets];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld)",[g valueForProperty:ALAssetsGroupPropertyName], (long)gCount];
    UIImage* image = [UIImage imageWithCGImage:[g posterImage]];
    image = [self resize:image to:CGSizeMake(78, 78)];
    [cell.imageView setImage:image];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

// Resize a UIImage. From http://stackoverflow.com/questions/2658738/the-simplest-way-to-resize-an-uiimage
- (UIImage *)resize:(UIImage *)image to:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark---zkz--tableviewdeletage
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ELCAlbumPickerController
    //流式布局
    
    ZKZPickerViewController *picker = [[ZKZPickerViewController alloc] init];
    //picker.parent = self;
    
    picker.assetGroup = [self.assetGroups objectAtIndex:indexPath.row];
    [picker.assetGroup setAssetsFilter:[self assetFilter]];
    
    
    
    [self.navigationController pushViewController:picker animated:YES];
}

#pragma mark---zkz刷新tableview
- (void)reloadTableView
{
    [self.tableView reloadData];
    [self.navigationItem setTitle:NSLocalizedString(@"Select an Album", nil)];
}

#pragma mark---zkz导航栏取消按钮操作
-(void)cancelClick
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
