/********* SamplePlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
@interface SamplePlugin : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod;
@end

@implementation SamplePlugin

- (void)coolMethod
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:"hello world"];
}


@end
