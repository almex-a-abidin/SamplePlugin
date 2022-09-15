/********* SamplePlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <CoreNFC/CoreNFC.h>
#import <Foundation/Foundation.h>
@interface SamplePlugin : CDVPlugin {
  // Member variables go here.
}

@end

@implementation SamplePlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// セッション開始メソッド
- (void)beginScan {
    // セッションの作成
    // self.session = [[NFCTagReaderSession new]
    //             initWithPollingOption: (NFCPollingISO14443 | NFCPollingISO15693)
    //             delegate: self
    //             queue:dispatch_get_main_queue()
    // ];
    // // アラートメッセージの設定
    // self.session.alertMessage = @"かざしてください";
    // // セッション開始
    // [self.session beginSession];
}


@end
