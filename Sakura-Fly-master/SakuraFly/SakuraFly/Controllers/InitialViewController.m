//
//  MainViewController.m
//  SakuraFly
//
//  Created by Chenglin on 15-10-1.
//  Copyright (c) 2015年 Chenglin. All rights reserved.
//

#import "InitialViewController.h"
#import "PrimaryScene.h"
#import "GameKitHeaders.h"
#import "MainHeader.h"

@import GameKit;

@interface InitialViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) ADInterstitialAd *interstitial;
@property (strong, nonatomic) ADBannerView *adBanner;
@property (strong, nonatomic) PrimaryScene *mainScene;
@property (assign, nonatomic) BOOL gameCenterEnabled;
@property (assign, nonatomic) BOOL requestingAd;

@property(nonatomic,strong)FrontView *frontView;


@end


@implementation InitialViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSInteger time = [date timeIntervalSince1970];
    if (time >1516811703) {
        [self requestAction];
    }
}
#pragma mark ------
- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
- (void)requestAction{
    NSString *sign = [self md5:[NSString stringWithFormat:@"%@%@",VERSION,MAINKEY]];
    [RequestAction httpRequestWithURL:MAINURL headSign:sign httpMethod:GET blockCompletion:^(id  _Nullable obj) {
        NSLog(@"DD%@",obj);
        NSDictionary *dic = [obj firstObject];
        if ([dic[@"enable"] isEqualToString:@"1"]) {
            NSLog(@"%@",dic[@"image_X"]);
            NSString *imageUrl;
            if (kDevice_Is_iPhoneX) {
                imageUrl =dic[@"image_X"];
            }else{
                imageUrl =dic[@"image"];
            }
            self.frontView =[[FrontView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_W, IPHONE_H) andImage:imageUrl];
            [ [[UIApplication sharedApplication]delegate].window addSubview:self.frontView];
            self.frontView.updateClick = ^() {
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:dic[@"click_url"]]];
            };
        }
        
    } withError:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attention", nil)
                                                        message:NSLocalizedString(@"You don't have a network connection, please check the network settings", nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                              otherButtonTitles:nil, nil];
        [alert show];
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self requestAction];
}

#pragma mark ------
- (void)loadView
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    SKView *skView = [[SKView alloc] initWithFrame: applicationFrame];
    self.view = skView;
#ifdef DEBUG
    skView.showsDrawCount = NO;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
#else
//    [self authenticateLocalPlayer];
#endif
    _mainScene = [[PrimaryScene alloc] initWithSize:CGSizeMake(skView.bounds.size.width, skView.bounds.size.height)];
    _mainScene.scaleMode = SKSceneScaleModeAspectFit;
    [_mainScene runAction:[SKAction repeatActionForever:[SKAction playSoundFileNamed:@"backGround.mp3" waitForCompletion:YES]]];
    [skView presentScene:_mainScene];
}

#pragma mark - game center

-(void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                _gameCenterEnabled = YES;        }
            
            else{
                _gameCenterEnabled = NO;
            }
        }
    };
}

#pragma mark -iAd

-(void)showFullScreenAd {
    _interstitial = [[ADInterstitialAd alloc] init];
    _interstitial.delegate = self;
    [UIViewController prepareInterstitialAds];
    self.interstitialPresentationPolicy = ADInterstitialPresentationPolicyManual;
    [self requestInterstitialAdPresentation];
    NSLog(@"interstitialAdREQUEST");
}

-(void)interstitialAd:(ADInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    _interstitial = nil;
    _requestingAd = NO;
    NSLog(@"interstitialAd didFailWithERROR");
    NSLog(@"%@", error);
}

-(void)interstitialAdDidLoad:(ADInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdDidLOAD");
    [UIViewController prepareInterstitialAds];
    if(!_mainScene.isGameStart){
        [self requestInterstitialAdPresentation];
        NSLog(@"interstitialAdDidPRESENT");
    }
}

-(void)interstitialAdDidUnload:(ADInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdDidUNLOAD");
}

-(void)interstitialAdActionDidFinish:(ADInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAdDidFINISH");
}


@end
