//
//  RXAFSecurityPolicy.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>


// TODOAFN_M_1
typedef NS_ENUM(NSUInteger, RXAFSSLPinningMode) {
    RXAFSSLPinningModeNone,
    RXAFSSLPinningModePublicKey,
    RXAFSSLPinningModeCertificate,
};

// TODOAFN_M_1_K_1: nonnull相关
// 如果去掉这个,会出现Pointer is missing a nullability type specifier  警告
// https://baijiahao.baidu.com/s?id=1591982073136556768&wfr=spider&for=pc
NS_ASSUME_NONNULL_BEGIN

@interface RXAFSecurityPolicy : NSObject <NSSecureCoding, NSCopying>


/**
 The criteria by which server trust should be evaluated against the pinned SSL certificates. Defaults to `AFSSLPinningModeNone`.
 */
// TODOAFN_M_1_K_2: 属性的readonly与readwrite
@property (readonly, nonatomic, assign) RXAFSSLPinningMode SSLPinningMode;

/**
 The certificates used to evaluate server trust according to the SSL pinning mode.
 
 By default, this property is set to any (`.cer`) certificates included in the target compiling AFNetworking. Note that if you are using AFNetworking as embedded framework, no certificates will be pinned by default. Use `certificatesInBundle` to load certificates from your target, and then create a new policy by calling `policyWithPinningMode:withPinnedCertificates`.
 
 Note that if pinning is enabled, `evaluateServerTrust:forDomain:` will return true if any pinned certificate matches.
 */
@property (nonatomic, strong, nullable) NSSet <NSData *> *pinnedCertificates;
/**
 Whether or not to trust servers with an invalid or expired SSL certificates. Defaults to `NO`.
 */
@property (nonatomic, assign) BOOL allowInvalidCertificates;

/**
 Whether or not to validate the domain name in the certificate's CN field. Defaults to `YES`.
 */
@property (nonatomic, assign) BOOL validatesDomainName;

///-----------------------------------------
/// @name Getting Certificates from the Bundle
///-----------------------------------------

/**
 Returns any certificates included in the bundle. If you are using AFNetworking as an embedded framework, you must use this method to find the certificates you have included in your app bundle, and use them when creating your security policy by calling `policyWithPinningMode:withPinnedCertificates`.
 
 @return The certificates included in the given bundle.
 */
+ (NSSet <NSData *> *)certificatesInBundle:(NSBundle *)bundle;

///-----------------------------------------
/// @name Getting Specific Security Policies
///-----------------------------------------

/**
 Returns the shared default security policy, which does not allow invalid certificates, validates domain name, and does not validate against pinned certificates or public keys.
 
 @return The default security policy.
 */
+ (instancetype)defaultPolicy;

///---------------------
/// @name Initialization
///---------------------

/**
 Creates and returns a security policy with the specified pinning mode.
 
 @param pinningMode The SSL pinning mode.
 
 @return A new security policy.
 */
+ (instancetype)policyWithPinningMode:(RXAFSSLPinningMode)pinningMode;

/**
 Creates and returns a security policy with the specified pinning mode.
 
 @param pinningMode The SSL pinning mode.
 @param pinnedCertificates The certificates to pin against.
 
 @return A new security policy.
 */
+ (instancetype)policyWithPinningMode:(RXAFSSLPinningMode)pinningMode withPinnedCertificates:(NSSet <NSData *> *)pinnedCertificates;

///------------------------------
/// @name Evaluating Server Trust
///------------------------------

/**
 Whether or not the specified server trust should be accepted, based on the security policy.
 
 This method should be used when responding to an authentication challenge from a server.
 
 @param serverTrust The X.509 certificate trust of the server.
 @param domain The domain of serverTrust. If `nil`, the domain will not be validated.
 
 @return Whether or not to trust the server.
 */
- (BOOL)evaluateServerTrust:(SecTrustRef)serverTrust
                  forDomain:(nullable NSString *)domain;


@end

// TODOAFN_M_1_K_1
NS_ASSUME_NONNULL_END

///----------------
/// @name Constants
///----------------

/**
 ## SSL Pinning Modes
 
 The following constants are provided by `AFSSLPinningMode` as possible SSL pinning modes.
 
 enum {
 AFSSLPinningModeNone,
 AFSSLPinningModePublicKey,
 AFSSLPinningModeCertificate,
 }
 
 `AFSSLPinningModeNone`
 Do not used pinned certificates to validate servers.
 
 `AFSSLPinningModePublicKey`
 Validate host certificates against public keys of pinned certificates.
 
 `AFSSLPinningModeCertificate`
 Validate host certificates against pinned certificates.
 */

