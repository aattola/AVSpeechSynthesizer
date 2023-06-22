//
//  TESTSpeech.m
//  ClientX
//
//  Created by Leevi Aattola on 30.5.2023.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"
@interface RCT_EXTERN_MODULE(TESTSpeech, RCTEventEmitter)
  RCT_EXTERN_METHOD(increment)
  RCT_EXTERN_METHOD(puhu)
@end
