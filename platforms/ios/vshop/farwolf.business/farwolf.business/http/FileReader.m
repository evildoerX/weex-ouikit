//
//  FileReader.m
//  oa
//
//  Created by 郑江荣 on 16/5/15.
//  Copyright © 2016年 郑江荣. All rights reserved.
//

#import "FileReader.h"
#import "AFNetworking.h"
#import "FileJson.h"


NSString * const _URL = @"http://doc2.renturbo.com/upload/";
@implementation FileReader

-(NSString*)getUrl
{
    return  [_URL stringByAppendingString:self.weg];
}

-(id)initWith:(NSString*)weg
{
    self=[super init];
    if(self)
    {
        self.weg=weg;
    }
    return self;
}

 

-(void)postFile
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 这行最好加上
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"multipart/form-data"];
    
    // 这里的image就是我从相册拿到的图片，压缩了一下
//    NSData *data = UIImageJPEGRepresentation(image, 0.7);
    
    
 NSString* url=[self getUrl];
    
    
    
    // 发送请求 urlstr是地址
    [manager POST:url parameters:self.param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSArray *nx= self.stream.allKeys;
        
        for(NSString *key in nx)
        {
            NSObject *o= self.stream[key];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            NSData *data = UIImageJPEGRepresentation((UIImage*)o, 1.0);
            [formData appendPartWithFileData:data name:key fileName:fileName mimeType:@"image/png"];
            
            
        }
        // 上传文件设置
//        [formData appendPartWithFileData:data name:@"image" fileName:@"image" mimeType:@"image/jpg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 成功
        
        NSLog(@"Success: %@", responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error.userInfo[@"NSLocalizedDescription"]);
    }];
}

-(Json*)getDecoder
{
    return [[FileJson alloc]init];
}


-(void)excuteFileFull:(void(^)())start
          success:(void(^)(Json*j))success
             fail:(void(^)(Json*j,NSInteger code,NSString* msg))fail
        exception:(void(^)())exception
        compelete:(void(^)())compelete

{
    start();
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString* url=[self getUrl];
    NSLog(@"url=%@",url);
    NSLog(@"param=%@",self.param);
    NSArray *n= self.param.allKeys;
    [manager POST:url parameters:self.param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSArray *nx= self.stream.allKeys;
        
        for(NSString *key in nx)
        {
            NSObject *o= self.stream[key];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            NSData *data = UIImageJPEGRepresentation((UIImage*)o, 1.0);
            [formData appendPartWithFileData:data name:key fileName:fileName mimeType:@"image/png"];
            
            
        }
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        @try {
            //            NSLog(@"Success: %@", [responseObject class]);
            NSLog(@"Success: %@", responseObject );
            
            FileJson *res=[[self getDecoder] initWithDict:responseObject];
            
            
            if([res isSuccess])
            {
                success(res);
            }
            else
            {
                
                fail(res,[res getErrorCode],[res getErrorMsg]);
                
//                [j fail:[res getErrorCode] errmsg:[res getErrorMsg] json:res];
            }
            
        }
        @catch (NSException *excep) {
            
            exception();
        }
        @finally {
            compelete();
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"%@", error.userInfo[@"NSLocalizedDescription"]);
        exception();
        compelete();
    }];

}

-(void)excuteFile:(UIViewController*)vc
success:(void(^)(Json*j))success
{
    
    if(self.p==nil)
        self.p=[[LockScreenProgress alloc]initWith:vc.view];;
    [self excuteFileFull:^{
        [self.p show];
    } success:^(Json *j) {
         success(j);
    } fail:^(Json *j, NSInteger code, NSString *msg) {
        [vc toast:msg];
    } exception:^{
         [vc toast:@"网络异常！"];
    } compelete:^{
        [self.p hide];
    }];
    
    
    
    
}
-(void)excuteFile:(id<JsonProtocol>)j
{
 
    
 
    
    
    [j start];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString* url=[self getUrl];
    NSLog(@"url=%@",url);
    NSLog(@"param=%@",self.param);
    NSArray *n= self.param.allKeys;
    [manager POST:url parameters:self.param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSArray *nx= self.stream.allKeys;
        
        for(NSString *key in nx)
        {
            NSObject *o= self.stream[key];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            NSData *data = UIImageJPEGRepresentation((UIImage*)o, 1.0);
            [formData appendPartWithFileData:data name:key fileName:fileName mimeType:@"image/png"];
 
 
        }
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        @try {
//            NSLog(@"Success: %@", [responseObject class]);
            NSLog(@"Success: %@", responseObject );
         
            FileJson *res=[[self getDecoder] initWithDict:responseObject];
        
 
            if([res isSuccess])
            {
                [j success:res];
            }
            else
            {
       
                [j fail:[res getErrorCode] errmsg:[res getErrorMsg] json:res];
            }
            
        }
        @catch (NSException *exception) {
            
            [j exception];
        }
        @finally {
            [j compelete];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"%@", error.userInfo[@"NSLocalizedDescription"]);
        [j exception];
        [j compelete];
    }];
    
}



@end
