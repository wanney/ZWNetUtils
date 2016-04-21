//
//  NetConfig.m
//  ZWNetUtils
//
//  Created by Wanney on 15/8/29.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//

#import "ZWNetUtils.h"

@implementation NetConfig
+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
 andHideProgressBar:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
        andHideProgressBar:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
    andWithoutLogin:(void (^)())logoutThings
 andHideProgressBar:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
           andWithoutLogin:^{
               logoutThings();
           }
        andHideProgressBar:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
     andHideSuccessMessage:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
    andWithoutLogin:(void (^)())logoutThings
andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
           andWithoutLogin:^{
               logoutThings();
           }
     andHideSuccessMessage:isHidden];
}
+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
 andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
        andHideProgressBar:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
    andWithoutLogin:(void (^)())logoutThings
 andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
           andWithoutLogin:^{
               logoutThings();
           }
        andHideProgressBar:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
 andHideProgressBar:(BOOL) isHidden
              andVc:(UIViewController *)vc{
    [NetConfig requestWith:Urlstring andParameters:parameters andResult:^(BOOL isSuccess) {
        result(isSuccess);
    } handlerDictory:^(id dataDic) {
        id state = [dataDic objectForKey:@"code"];
        if([state isKindOfClass:[NSString class]]){
            if([state isEqualToString:@"5"]){
                UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                [vc presentViewController:loginNavi animated:YES completion:nil];
            }
        }else if([state isKindOfClass:[NSNumber class]]){
            if([state isEqualToString:@"5"]){
                UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                [vc presentViewController:loginNavi animated:YES completion:nil];
            }
        }
    }
        andHideProgressBar:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result{
    [NetConfig requestWith:Urlstring andParameters:parameters andResult:^(BOOL isSuccess) {
        result(isSuccess);
    } handlerDictory:^(id dataDic) {
        //do nothing
    }];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
    andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
           andWithoutLogin:^{
               logoutThings();
           }];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
andHideSuccessMessage: (BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
     andHideSuccessMessage:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
    andWithoutLogin:(void (^)())logoutThings
andHideSuccessMessage: (BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                //do nothing
            }
           andWithoutLogin:^{
               logoutThings();
           }
     andHideSuccessMessage:isHidden];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory
   andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory
andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
        andHideProgressBar:isHidden];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory
   andWithoutLogin:(void (^)())logoutThings
andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }
        andHideProgressBar:isHidden];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory
andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     //do nothing
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
     andHideSuccessMessage:isHidden];
}

+(void)requestWith:(NSString *)Urlstring
     andParameters:(id)parameters
    handlerDictory:(void (^)(id dataDic)) handleDictory
   andWithoutLogin:(void (^)())logoutThings
andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }
     andHideSuccessMessage:isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)( BOOL isSuccess)) result
     handlerDictory:(void (^)(id dataDic)) handleDictory{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
        andHideProgressBar:NO];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)( BOOL isSuccess)) result
     handlerDictory:(void (^)(id dataDic)) handleDictory
    andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }
        andHideProgressBar:NO];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess))result
     handlerDictory:(void (^)(id dataDic)) handleDictory
andHideSuccessMessage:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
           }
           andShowProgress:YES
              andShowError:YES
            andShowSuccess:!isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
     handlerDictory:(void (^)(id dataDic)) handleDictory
    andWithoutLogin:(void (^)())logoutThings
andHideSuccessMessage:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }
           andShowProgress:YES
              andShowError:YES
            andShowSuccess:!isHidden];
    
}
+(void) requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess))result
     handlerDictory:(void (^)(id dataDic)) handleDictory
 andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
           }
           andShowProgress:!isHidden
              andShowError:YES
            andShowSuccess:!isHidden];
    
}

+(void) requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
     handlerDictory:(void (^)(id dataDic)) handleDictory
    andWithoutLogin:(void (^)())logoutThings
 andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestWith:Urlstring
             andParameters:parameters
                 andResult:^(BOOL isSuccess) {
                     result(isSuccess);
                 }
            handlerDictory:^(id dataDic) {
                handleDictory(dataDic);
            }
           andWithoutLogin:^{
               logoutThings();
           }
           andShowProgress:!isHidden
              andShowError:YES
            andShowSuccess:!isHidden];
}

+ (void)requestWith:(NSString *)Urlstring
      andParameters:(id)parameters
          andResult:(void (^)(BOOL isSuccess)) result
     handlerDictory:(void (^)(id dataDic)) handleDictory
    andWithoutLogin:(void (^)())logoutThings
    andShowProgress:(BOOL)isShowProgress
       andShowError:(BOOL) isShowError
     andShowSuccess:(BOOL)isShowSuccess{
    MBProgressHUD *hub = [[MBProgressHUD alloc] init];
    if (isShowProgress) {
        hub = [MBProgressHUD showMessage:LoadingNote];
    }
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 请求的序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 回复序列化-JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    // 执行请求
    [manager  GET:Urlstring
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [hub removeFromSuperview];
              NSDictionary *responseDic = responseObject;
              id state = [responseDic objectForKey:@"code"];
              if([state isKindOfClass:[NSString class]]){
                  if([state isEqualToString:@"0"]){
                      if (isShowSuccess) {
                          [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                      }
                      result(YES);
                      handleDictory(responseDic);
                  }else if ([state isEqualToString:@"5"]){
                      result(NO);
                      logoutThings();
                  }else{
                      if (isShowError) {
                          [MBProgressHUD showError:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                      }
                      result(NO);
                  }
              }else{
                  if([state isKindOfClass:[NSNumber class]]){
                      if([state isEqualToNumber:@0]){
                          //字典解析－>
                          if (isShowSuccess) {
                              [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                          }
                          result(YES);
                          handleDictory(responseDic);
                      }else if([state isEqualToNumber:@5]){
                          result(NO);
                          logoutThings();
                      }else{
                          if (isShowError) {
                              [MBProgressHUD showError:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                          }
                          result(NO);
                      }
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [hub removeFromSuperview];
              if (isShowError) {
                  [MBProgressHUD showToast:@"网络连接异常，请检查网络。"];
              }
              result(NO);
          }];
}

#pragma － 以下是post的方法

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
     andHideProgressBar:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    //do nothing
                }
            andHideProgressBar:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
        andWithoutLogin:(void (^)())logoutThings
     andHideProgressBar:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
               andWithoutLogin:^{
                   logoutThings();
               }
            andHideProgressBar:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
  andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
         andHideSuccessMessage:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
        andWithoutLogin:(void (^)())logoutThings
  andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                     }
               andWithoutLogin:^{
                   logoutThings();
               }
         andHideSuccessMessage:isHidden];
}


+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
     andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                }
            andHideProgressBar:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
        andWithoutLogin:(void (^)())logoutThings
     andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                }
               andWithoutLogin:^{
                   logoutThings();
               }
            andHideProgressBar:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
     andHideProgressBar:(BOOL) isHidden
                  andVc:(UIViewController *)vc{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    id state = [dataDic objectForKey:@"code"];
                    if([state isKindOfClass:[NSString class]]){
                        if([state isEqualToString:@"5"]){
                            UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                            UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                            [vc presentViewController:loginNavi animated:YES completion:nil];
                        }
                    }else if([state isKindOfClass:[NSNumber class]]){
                        if([state isEqualToNumber:@5]){
                            UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                            UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                            [vc presentViewController:loginNavi animated:YES completion:nil];
                            
                        }
                    }
                }
            andHideProgressBar:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     } handlerDictory:^(id dataDic) {
                     }];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
        andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                }
               andWithoutLogin:^{
                   logoutThings();
               }];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
                  andVc:(UIViewController *)vc{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    id state = [dataDic objectForKey:@"code"];
                    if([state isKindOfClass:[NSString class]]){
                        if([state isEqualToString:@"5"]){
                            UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                            UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                            [vc presentViewController:loginNavi animated:YES completion:nil];
                        }
                    }else if([state isKindOfClass:[NSNumber class]]){
                        if([state isEqualToNumber:@5]){
                            UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
                            UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
                            [vc presentViewController:loginNavi animated:YES completion:nil];
                        }
                    }
                }];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)( BOOL isSuccess)) result
  andHideSuccessMessage: (BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                }
         andHideSuccessMessage:isHidden];
    
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
        andWithoutLogin:(void (^)())logoutThings
  andHideSuccessMessage: (BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                }
               andWithoutLogin:^{
                   logoutThings();
               }
         andHideSuccessMessage:isHidden];
}

+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }];
}

+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory
       andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }];
}

+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory
    andHideProgressBar:(BOOL) isHidden{
    
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
            andHideProgressBar:isHidden];
}
+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory
       andWithoutLogin:(void (^)())logoutThings
    andHideProgressBar:(BOOL) isHidden{
    
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }
            andHideProgressBar:isHidden];
}
+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory
 andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
         andHideSuccessMessage:isHidden];
}

+(void)requestPostWith:(NSString *)Urlstring
         andParameters:(id)parameters
        handlerDictory:(void (^)(id dataDic)) handleDictory
       andWithoutLogin:(void (^)())logoutThings
 andHideSuccessMessage:(BOOL)isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         //do nothing
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }
         andHideSuccessMessage:isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)( BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
            andHideProgressBar:NO];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)( BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory
        andWithoutLogin:(void (^)())logoutThings{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }
            andHideProgressBar:NO];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory
  andHideSuccessMessage:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   
               }
               andShowProgress:YES
                  andShowError:YES
                andShowSuccess:!isHidden];
    
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory
        andWithoutLogin:(void (^)())logoutThings
  andHideSuccessMessage:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }
               andShowProgress:YES
                  andShowError:YES
                andShowSuccess:!isHidden];
    
}

+(void) requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory
     andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   
               }
               andShowProgress:!isHidden
                  andShowError:YES
                andShowSuccess:!isHidden];
    
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess)) result
         handlerDictory:(void (^)(id dataDic)) handleDictory
        andWithoutLogin:(void (^)())logoutThings
     andHideProgressBar:(BOOL) isHidden{
    [NetConfig requestPostWith:Urlstring
                 andParameters:parameters
                     andResult:^(BOOL isSuccess) {
                         result(isSuccess);
                     }
                handlerDictory:^(id dataDic) {
                    handleDictory(dataDic);
                }
               andWithoutLogin:^{
                   logoutThings();
               }
               andShowProgress:!isHidden
                  andShowError:YES
                andShowSuccess:!isHidden];
}

+ (void)requestPostWith:(NSString *)Urlstring
          andParameters:(id)parameters
              andResult:(void (^)(BOOL isSuccess))result
         handlerDictory:(void (^)(id dataDic)) handleDictory
        andWithoutLogin:(void (^)())logoutThings
        andShowProgress:(BOOL)isShowProgress
           andShowError:(BOOL) isShowError
         andShowSuccess:(BOOL)isShowSuccess{
    MBProgressHUD *hub = [[MBProgressHUD alloc] init];
    if (isShowProgress) {
        hub = [MBProgressHUD showMessage:LoadingNote];
    }
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 请求的序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 回复序列化-JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    // 执行请求
    [manager   POST:Urlstring
         parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [hub removeFromSuperview];
                NSDictionary *responseDic = responseObject;
                id state = [responseDic objectForKey:@"code"];
                if([state isKindOfClass:[NSString class]]){
                    if([state isEqualToString:@"0"]){
                        if (isShowSuccess) {
                            [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                        }
                        result(YES);
                        handleDictory(responseDic);
                    }else if([state isEqualToString:@"5"]){
                        result(NO);
                        logoutThings();
                    }else{
                        if (isShowError) {
                            [MBProgressHUD showError:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                        }
                        result(NO);
                    }
                }else if([state isKindOfClass:[NSNumber class]]){
                    if([state isEqualToNumber:@0]){
                        //字典解析－>
                        if (isShowSuccess) {
                            [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                        }
                        result(YES);
                        handleDictory(responseDic);
                    }else if([state isEqualToNumber:@5]){
                        result(NO);
                        logoutThings();
                    }else{
                        if (isShowError) {
                            [MBProgressHUD showError:[NSString stringWithFormat:@"%@",[responseDic objectForKey:@"msg"]]];
                        }
                        result(NO);
                    }
                }
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [hub removeFromSuperview];
                if (isShowError) {
                    [MBProgressHUD showToast:[NSString stringWithFormat:@"网络连接异常，请检查网络。"]];
                }
                result(NO);
            }];
    
}

/*

 用于微信第三方登录时用到的网络请求封装
 */

+ (void)requestGetdata:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)(id dataDic)) handleDictory{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 请求的序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 回复序列化-JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    // 执行请求
    [manager    GET:Urlstring
         parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSDictionary *responseDic = responseObject;
                handleDictory(responseDic);
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
}

+ (void)requestWithdata:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)(id dataDic)) handleDictory{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 请求的序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 回复序列化-JSON格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    // 执行请求
    [manager   POST:Urlstring
         parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSDictionary *responseDic = responseObject;
                handleDictory(responseDic);
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
}

@end
