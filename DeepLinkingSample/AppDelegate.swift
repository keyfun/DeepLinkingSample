//
//  AppDelegate.swift
//  DeepLinkingSample
//
//  Created by Hui Key on 11/2/2016.
//  Copyright © 2016 KeyFun. All rights reserved.
//

import UIKit
import Bolts
import DeepLinkKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var router: DPLDeepLinkRouter = DPLDeepLinkRouter()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        print("\(__FUNCTION__)")
        
        // DeepLink://host/product/abc
        // Register a class to a route using object subscripting
        self.router["/product/:sku"] = DPLProductRouteHandler.self
        
        // Register a class to a route using the explicit registration call
//        self.router.registerHandlerClass(DPLProductRouteHandler.self, forRoute: "/say/:title/:message")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        print("\(__FUNCTION__)")
        
        let parsedUrl:BFURL = BFURL(inboundURL: url, sourceApplication: sourceApplication)
        
        // DeepLink://abc?query=1234
        print("target path =  \(parsedUrl.targetURL.pathComponents?[0])")
        let targetQuery:String? = parsedUrl.targetQueryParameters["query"] as? String
        print("target query = \(targetQuery)")
        
        print("input path =  \(parsedUrl.inputURL.pathComponents?[0])")
        let inputQuery:String? = parsedUrl.inputQueryParameters["query"] as? String
        print("input query = \(inputQuery)")
        
        if(parsedUrl.appLinkExtras != nil) {
            let extra:String? = parsedUrl.appLinkExtras["extra"] as? String
            print("extra = \(extra)")
        }
        
//        return true
        return self.router.handleURL(url, withCompletion: nil)
    }


}

