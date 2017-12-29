//
//  DLNSettings.m
//  DLNFoundation
//
//  Created by Linzh on 12/23/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "DLNSysSettings.h"

//About — prefs:root=General&path=About
//Accessibility — prefs:root=General&path=ACCESSIBILITY
//Airplane Mode On — prefs:root=AIRPLANE_MODE
//Auto-Lock — prefs:root=General&path=AUTOLOCK
//Brightness — prefs:root=Brightness
//Bluetooth — prefs:root=General&path=Bluetooth
//Date & Time — prefs:root=General&path=DATE_AND_TIME
//FaceTime — prefs:root=FACETIME
//General — prefs:root=General
//Keyboard — prefs:root=General&path=Keyboard
//iCloud — prefs:root=CASTLE
//iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
//International — prefs:root=General&path=INTERNATIONAL
//Location Services — prefs:root=LOCATION_SERVICES
//Music — prefs:root=MUSIC
//Music Equalizer — prefs:root=MUSIC&path=EQ
//Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
//Network — prefs:root=General&path=Network
//Nike + iPod — prefs:root=NIKE_PLUS_IPOD
//Notes — prefs:root=NOTES
//Notification — prefs:root=NOTIFICATIONS_ID
//Phone — prefs:root=Phone
//Photos — prefs:root=Photos
//Profile — prefs:root=General&path=ManagedConfigurationList
//Reset — prefs:root=General&path=Reset
//Safari — prefs:root=Safari
//Siri — prefs:root=General&path=Assistant
//Sounds — prefs:root=Sounds
//Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
//Store — prefs:root=STORE
//Twitter — prefs:root=TWITTER
//Usage — prefs:root=General&path=USAGE
//VPN — prefs:root=General&path=Network/VPN
//Wallpaper — prefs:root=Wallpaper
//Wi-Fi — prefs:root=WIFI
//Setting —prefs:root=INTERNET_TETHERING

@implementation DLNSysSettings
#pragma mark - Public
+ (void)phoneCall:(NSString *)phoneNumber {
    [self openURL:[NSString stringWithFormat:@"telprompt://%@", phoneNumber]];
}

+ (void)openAbout {
    [self openURL:@"prefs:root=General&path=About"];
}

+ (void)openWiFi {
    [self openURL:@"prefs:root=WIFI"];
}

+ (void)openNotification {
    [self openURL:@"prefs:root=NOTIFICATIONS_ID"];
}

+ (void)openAppSelfSettings {
    [self openURL:UIApplicationOpenSettingsURLString];
}

#pragma mark - Private
+ (void)openURL:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
