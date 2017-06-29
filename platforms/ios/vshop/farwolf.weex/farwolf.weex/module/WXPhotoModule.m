//
//  WXPhotoModule.m
//  Pods
//
//  Created by 郑江荣 on 2017/5/19.
//
//

#import "WXPhotoModule.h"

@implementation WXPhotoModule

@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(open:aspY:themeColor:titleColor:cancelColor:callback:))
WX_EXPORT_METHOD(@selector(openCamera:aspY:themeColor:callback:))
WX_EXPORT_METHOD(@selector(openPhoto:aspY:themeColor:titleColor:cancelColor:callback:))

-(void)open:(int)aspX aspY:(int)aspY themeColor:(NSString*)themeColor titleColor:(NSString*)titleColor cancelColor:(NSString*)cancelColor callback: (WXModuleKeepAliveCallback)callback
{
   
    [self initUploader:themeColor titleColor:titleColor cancelColor:cancelColor];
    [self.uploadImage setAsp:aspX aspY:aspY];
    self.callback =callback;
    [self.uploadImage showPickImage:[themeColor toColor] titleColor:[titleColor toColor] cancelColor:[cancelColor toColor]];
    
    
}

-(void)initUploader:(NSString*)themeColor titleColor:(NSString*)titleColor cancelColor:(NSString*)cancelColor
{
    if(self.uploadImage==nil)
    {
        self.uploadImage=[UploadImage new];
        self.uploadImage.delegate=self;
        self.uploadImage.frame=CGRectMake(0, 0, 0, 0);
        [self.weexInstance.viewController.view addSubview: self.uploadImage];
        self.uploadImage.themeColor=[themeColor toColor];
        self.uploadImage.titleColor=[titleColor toColor];
        self.uploadImage.cancelColor=[cancelColor toColor];
    }
}



-(void)openCamera:(int)aspX aspY:(int)aspY themeColor:(NSString*)themeColor  callback:(WXModuleKeepAliveCallback)callback
{
    self.callback =callback;

    [self initUploader:@"#ffffff" titleColor:@"#ffffff" cancelColor:@"#ffffff"];
      [self.uploadImage setAsp:aspX aspY:aspY];
    [self.uploadImage openCamera];
}

-(void)openPhoto:(int)aspX aspY:(int)aspY themeColor:(NSString*)themeColor titleColor:(NSString*)titleColor cancelColor:(NSString*)cancelColor callback:(WXModuleKeepAliveCallback)callback
{
    self.callback =callback;
    [self initUploader:themeColor titleColor:titleColor cancelColor:cancelColor];
      [self.uploadImage setAsp:aspX aspY:aspY];
    [self.uploadImage openPhoto];

}
-(void)imageSelect:(UIImage*)img
{
    
    NSString *encodedString = [self image2DataURL:img];
    encodedString=[@"base64===" add:encodedString];
    NSMutableDictionary *d=[NSMutableDictionary new];
    [d setValue:encodedString forKey:@"base64"];
    self.callback(d,true);
}

- (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
- (NSString *) image2DataURL: (UIImage *) image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [imageData base64EncodedStringWithOptions: 0]];
}

-(void)imageUploadSuccess:(NSString*)url
{
    
    NSMutableDictionary *d=[NSMutableDictionary new];
    [d setValue:url forKey:@"url"];
    self.callback(d,true);
}



@end
