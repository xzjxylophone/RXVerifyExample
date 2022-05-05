//
//  RXDeviceUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/5/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXDeviceUtil.h"
#import "sys/utsname.h"

@implementation RXDeviceUtil
+ (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSDictionary *dic = @{
                          //iPhone
                          @"iPhone1,1": @"iPhone 2G (A1203)",
                          @"iPhone1,2": @"iPhone 3G (A1241/A1324)",
                          @"iPhone2,1": @"iPhone 3GS (A1303/A1325)",
                          @"iPhone3,1": @"iPhone 4 (A1332)",
                          @"iPhone3,2": @"iPhone 4 (A1332)",
                          @"iPhone3,3": @"iPhone 4 (A1349)",
                          @"iPhone4,1": @"iPhone 4S (A1387/A1431)",
                          @"iPhone5,1": @"iPhone 5 (A1428)",
                          @"iPhone5,2": @"iPhone 5 (A1429/A1442)",
                          @"iPhone5,3": @"iPhone 5c (A1456/A1532)",
                          @"iPhone5,4": @"iPhone 5c (A1507/A1516/A1526/A1529)",
                          @"iPhone6,1": @"iPhone 5s (A1453/A1533)",
                          @"iPhone6,2": @"iPhone 5s (A1457/A1518/A1528/A1530)",
                          @"iPhone7,2": @"iPhone 6 (A1549/A1586)",
                          @"iPhone7,1": @"iPhone 6 Plus (A1522/A1524)",
                          @"iPhone8,1": @"iPhone 6s (A1633/A1688/A1691/A1700)",
                          @"iPhone8,2": @"iPhone 6s Plus (A1634/A1687/A1690/A1699)",
                          @"iPhone8,4": @"iPhone SE (A1662/A1723/A1724)",
                          @"iPhone9,1": @"iPhone 7 (A1660/A1779/A1780)",
                          @"iPhone9,3": @"iPhone 7 (A1778)",
                          @"iPhone9,2": @"iPhone 7 Plus (A1661/A1785/A1786)",
                          @"iPhone9,4": @"iPhone 7 Plus (A1784)",
                          @"iPhone10,1": @"iPhone 8 (A1863/A1906/A1907)",
                          @"iPhone10,4": @"iPhone 8 (A1905)",
                          @"iPhone10,2": @"iPhone 8 Plus (A1864/A1898/A1899)",
                          @"iPhone10,5": @"iPhone 8 Plus (A1897)",
                          @"iPhone10,3": @"iPhone X (A1865/A1902)",
                          @"iPhone10,6": @"iPhone X (A1901)",
                          @"iPhone11,8": @"iPhone XR (A1984/A2105/A2106/A2108)",
                          @"iPhone11,2": @"iPhone XS (A1920/A2097/A2098/A2100)",
                          @"iPhone11,6": @"iPhone XS Max (A1921/A2101/A2102/A2104)",
                          
                          //iPod Touch
                          @"iPod1,1": @"iPod Touch (A1213)",
                          @"iPod2,1": @"iPod Touch 2G (A1288)",
                          @"iPod3,1": @"iPod Touch 3G (A1318)",
                          @"iPod4,1": @"iPod Touch 4G (A1367)",
                          @"iPod5,1": @"iPod Touch 5G (A1421/A1509)",
                          @"iPod7,1": @"iPod Touch 6G (A1574)",
                          
                          //iPad
                          @"iPad1,1": @"iPad (A1219/A1337)",
                          @"iPad2,1": @"iPad 2 (A1395)",
                          @"iPad2,2": @"iPad 2 (A1396)",
                          @"iPad2,3": @"iPad 2 (A1397)",
                          @"iPad2,4": @"iPad 2 (A1395+New Chip)",
                          @"iPad3,1": @"iPad 3 (A1416)",
                          @"iPad3,2": @"iPad 3 (A1403)",
                          @"iPad3,3": @"iPad 3 (A1430)",
                          @"iPad3,4": @"iPad 4 (A1458)",
                          @"iPad3,5": @"iPad 4 (A1459)",
                          @"iPad3,6": @"iPad 4 (A1460)",
                          @"iPad6,11": @"iPad 5 (A1822)",
                          @"iPad6,12": @"iPad 5 (A1823)",
                          @"iPad7,5": @"iPad 6 (A1893)",
                          @"iPad7,6": @"iPad 6 (A1954)",
                          
                          //iPad Air
                          @"iPad4,1": @"iPad Air (A1474)",
                          @"iPad4,2": @"iPad Air (A1475)",
                          @"iPad4,3": @"iPad Air (A1476)",
                          @"iPad5,3": @"iPad Air 2 (A1566)",
                          @"iPad5,4": @"iPad Air 2 (A1567)",
                          @"iPad11,3": @"iPad Air 3 (A2152)",
                          @"iPad11,4": @"iPad Air 3 (A2123/A2153/A2154)",
                          
                          // iPad Pro
                          @"iPad6,7": @"iPad Pro (12.9-inch) (A1584)",
                          @"iPad6,8": @"iPad Pro (12.9-inch) (A1652)",
                          @"iPad6,3": @"iPad Pro (9.7-inch) (A1673)",
                          @"iPad6,4": @"iPad Pro (9.7-inch) (A1674/A1675)",
                          @"iPad7,1": @"iPad Pro 2 (12.9-inch) (A1670)",
                          @"iPad7,2": @"iPad Pro 2 (12.9-inch) (A1671/A1821)",
                          @"iPad7,3": @"iPad Pro (10.5-inch) (A1701)",
                          @"iPad7,4": @"iPad Pro (10.5-inch) (A1709)",
                          @"iPad8,1": @"iPad Pro (11-inch) (A1980)",
                          @"iPad8,2": @"iPad Pro (11-inch) (A1980)",
                          @"iPad8,3": @"iPad Pro (11-inch) (A1934/A1979/A2013)",
                          @"iPad8,4": @"iPad Pro (11-inch) (A1934/A1979/A2013)",
                          @"iPad8,5": @"iPad Pro 3 (12.9-inch) (A1876)",
                          @"iPad8,6": @"iPad Pro 3 (12.9-inch) (A1876)",
                          @"iPad8,7": @"iPad Pro 3 (12.9-inch) (A1895/A1983/A2014)",
                          @"iPad8,8": @"iPad Pro 3 (12.9-inch) (A1895/A1983/A2014)",
                          
                          //iPad mini
                          @"iPad2,5": @"iPad mini 1G (A1432)",
                          @"iPad2,6": @"iPad mini 1G (A1454)",
                          @"iPad2,7": @"iPad mini 1G (A1455)",
                          @"iPad4,4": @"iPad mini 2 (A1489)",
                          @"iPad4,5": @"iPad mini 2 (A1490)",
                          @"iPad4,6": @"iPad mini 2 (A1491)",
                          @"iPad4,7": @"iPad mini 3 (A1599)",
                          @"iPad4,8": @"iPad mini 3 (A1600)",
                          @"iPad4,9": @"iPad mini 3 (A1601)",
                          @"iPad5,1": @"iPad mini 4 (A1538)",
                          @"iPad5,2": @"iPad mini 4 (A1550)",
                          @"iPad11,1": @"iPad mini 5 (A2133)",
                          @"iPad11,2": @"iPad mini 5 (A2124/A2125/A2126)",
                          
                          @"i386": @"Simulator",
                          @"x86_64": @"Simulator"
                          };
    NSString *value = dic[platform];
    if (value.length > 0) {
        return value;
    } else {
        NSLog(@"NOTE: Unknown device type: %@", platform);
        return platform;
    }
}
@end
