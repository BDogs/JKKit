//
//  JKHTTPSessionManager.m
//  YoCar
//
//  Created by Futao on 15/9/29.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import "AFNetworking.h"
#import "JKHTTPSessionManager.h"
#import "JKHTTPSessionManagerRequestSerializer.h"
#import "JKHTTPSessionManagerResponseSerializer.h"

@interface JKHTTPSessionManager ()
@property(nonatomic, strong) NSURL *baseURL;
@property(nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;
@property(nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation JKHTTPSessionManager

#pragma mark - Init

+ (instancetype)manager {
  return [[[self class] alloc] initWithBaseURL:nil sessionConfiguration:nil];
}
- (instancetype)init {
  return [self initWithBaseURL:nil sessionConfiguration:nil];
}
- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration;
{
  self = [super init];
  if (self) {
    self.baseURL = url;
    self.sessionConfiguration = configuration;
    if (!self.sessionConfiguration) {
      self.sessionConfiguration =
          [NSURLSessionConfiguration defaultSessionConfiguration];
    }
    self.sessionManager = [[AFHTTPSessionManager alloc]
             initWithBaseURL:self.baseURL
        sessionConfiguration:self.sessionConfiguration];
    [self setupSessionManagerConfiguration];
  }
  return self;
}

- (void)setupSessionManagerConfiguration {
  self.sessionManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
  self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
  self.sessionManager.responseSerializer =
      [AFJSONResponseSerializer serializer];
  self.requestSerializer = [[JKHTTPSessionManagerRequestSerializer alloc] init];
  self.responseSerializer =
      [[JKHTTPSessionManagerResponseSerializer alloc] init];
  ((AFJSONResponseSerializer *)self.sessionManager.responseSerializer)
      .removesKeysWithNullValues = YES;
  self.sessionManager.requestSerializer.HTTPShouldHandleCookies = YES;
  self.sessionManager.requestSerializer.allowsCellularAccess = YES;
}

///---------------------------
/// @name Making HTTP Requests
///---------------------------
- (NSURLSessionDataTask *)
       GET:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {

  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager GET:URLString
      parameters:encodedParameters
      progress:NULL
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}
- (NSURLSessionDataTask *)
       GET:(NSString *)URLString
parameters:(id)parameters
  progress:(void (^)(NSProgress *progress))downloadProgress
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {

  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager GET:URLString
      parameters:encodedParameters
      progress:^(NSProgress *progress) {
        if (downloadProgress) {
          dispatch_async(dispatch_get_main_queue(), ^{
            downloadProgress(progress);
          });
        }
      }
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}
- (NSURLSessionDataTask *)HEAD:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task))success
                       failure:(void (^)(NSURLSessionDataTask *task,
                                         NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager HEAD:URLString
      parameters:encodedParameters
      success:^(NSURLSessionDataTask *task) {
        if (success) {
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}
- (NSURLSessionDataTask *)
      POST:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager POST:URLString
      parameters:encodedParameters
      progress:NULL
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}
- (NSURLSessionDataTask *)
      POST:(NSString *)URLString
parameters:(id)parameters
  progress:(void (^)(NSProgress *))uploadProgress
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager POST:URLString
      parameters:encodedParameters
      progress:^(NSProgress *progress) {
        if (uploadProgress) {
          dispatch_async(dispatch_get_main_queue(), ^{
            uploadProgress(progress);
          });
        }
      }
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block
                      progress:(void (^)(NSProgress *progress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task,
                                         id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task,
                                         NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager POST:URLString
      parameters:encodedParameters
      constructingBodyWithBlock:block
      progress:^(NSProgress *progress) {
        if (uploadProgress) {
          dispatch_async(dispatch_get_main_queue(), ^{
            uploadProgress(progress);
          });
        }
      }
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}

- (NSURLSessionDataTask *)
       PUT:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager PUT:URLString
      parameters:encodedParameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}

- (NSURLSessionDataTask *)
     PATCH:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager PATCH:URLString
      parameters:encodedParameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}

- (NSURLSessionDataTask *)
    DELETE:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
  NSDictionary *encodedParameters =
      [self encodeTheParameters:parameters error:NULL];
  return [self.sessionManager DELETE:URLString
      parameters:encodedParameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
          __block NSDictionary *decodedResponseObject =
              [self decodeTheParameters:responseObject error:NULL];
          dispatch_async(dispatch_get_main_queue(), ^{
            success(task, decodedResponseObject);
          });
        }
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
          dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
          });
        }
      }];
}

#pragma mark - Encode / Decode

- (NSDictionary *)encodeTheParameters:(NSDictionary *)parameters
                                error:(NSError *__autoreleasing *)error {
  if ([self.requestSerializer
          respondsToSelector:@selector(encodeParametersByDecodedParameters:
                                                                     error:)]) {
    return
        [self.requestSerializer encodeParametersByDecodedParameters:parameters
                                                              error:error];
  }
  return parameters;
}

- (NSDictionary *)decodeTheParameters:(NSDictionary *)parameters
                                error:(NSError *__autoreleasing *)error {
  if ([self.responseSerializer
          respondsToSelector:@selector(decodeParametersByEncodedParameters:
                                                                     error:)]) {
    return
        [self.responseSerializer decodeParametersByEncodedParameters:parameters
                                                               error:error];
  }
  return parameters;
}
#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding {
  return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
  self = [super init];
  self.sessionManager = [decoder
      decodeObjectOfClass:[JKHTTPSessionManager class]
                   forKey:NSStringFromSelector(@selector(sessionManager))];
  self.sessionConfiguration = [decoder
      decodeObjectForKey:NSStringFromSelector(@selector(sessionConfiguration))];
  self.requestSerializer = [decoder
      decodeObjectForKey:NSStringFromSelector(@selector(requestSerializer))];
  self.responseSerializer = [decoder
      decodeObjectForKey:NSStringFromSelector(@selector(responseSerializer))];
  self.baseURL =
      [decoder decodeObjectForKey:NSStringFromSelector(@selector(baseURL))];

  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:self.sessionManager
               forKey:NSStringFromSelector(@selector(sessionManager))];
  [coder encodeObject:self.sessionConfiguration
               forKey:NSStringFromSelector(@selector(sessionConfiguration))];
  [coder encodeObject:self.requestSerializer
               forKey:NSStringFromSelector(@selector(requestSerializer))];
  [coder encodeObject:self.responseSerializer
               forKey:NSStringFromSelector(@selector(responseSerializer))];
  [coder encodeObject:self.baseURL
               forKey:NSStringFromSelector(@selector(baseURL))];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
  JKHTTPSessionManager *httpSessionManager = [[self class] allocWithZone:zone];
  httpSessionManager.sessionManager = [self.sessionManager copyWithZone:zone];
  httpSessionManager.sessionConfiguration = self.sessionConfiguration;
  httpSessionManager.requestSerializer =
      [self.requestSerializer copyWithZone:zone];
  httpSessionManager.responseSerializer =
      [self.responseSerializer copyWithZone:zone];
  httpSessionManager.baseURL = self.baseURL;
  return httpSessionManager;
}

- (void)invalidateAndCancelAllSession {
}

@end
