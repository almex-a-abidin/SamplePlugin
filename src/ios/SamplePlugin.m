/********* SamplePlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "NfcSessionAtOBJC.h"
@interface SamplePlugin : CDVPlugin {
  // Member variables go here.
}

@property (nonatomic, assign) BOOL shouldUseTagReaderSession;
@property (nonatomic, assign) BOOL sendCallbackOnSessionStart;
@property (nonatomic, assign) BOOL returnTagInCallback;
@property (nonatomic, assign) BOOL returnTagInEvent;
@property (nonatomic, assign) BOOL keepSessionOpen;
@property (strong, nonatomic) NFCReaderSession *nfcSession API_AVAILABLE(ios(11.0));

@property (strong,nonatomic) NFCTagReaderSession *session API_AVAILABLE(ios(13.0));
@property (nonatomic) TagDataAtOBJC *tagOBJC;

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)beginScan:(CDVInvokedUrlCommand*)command;

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
- (void)beginScan:(CDVInvokedUrlCommand*)command
 {
    // 返却データの初期化
    self.tagOBJC = [[TagDataAtOBJC alloc] init];
    // セッションの作成
    self.session = [[NFCTagReaderSession new]
                initWithPollingOption: (NFCPollingISO14443 | NFCPollingISO15693)
                delegate: self
                queue:dispatch_get_main_queue()
    ];
    // アラートメッセージの設定
    self.session.alertMessage = @"かざしてください";
    // セッション開始
    [self.session beginSession];
}

@end
