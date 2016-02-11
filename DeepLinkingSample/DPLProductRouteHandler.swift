//
//  DPLProductRouteHandler.swift
//  DeepLinkingSample
//
//  Created by Hui Key on 11/2/2016.
//  Copyright © 2016 KeyFun. All rights reserved.
//

import Foundation
import DeepLinkKit

public class DPLProductRouteHandler: DPLRouteHandler {
    
    public override func targetViewController() -> UIViewController! {
        print("\(__FUNCTION__)")
        if let storyboard = UIApplication.sharedApplication().keyWindow?.rootViewController?.storyboard {
            return storyboard.instantiateViewControllerWithIdentifier("LinkViewController") as! LinkViewController
        }
        return UIViewController()
    }
    
//    public override func shouldHandleDeepLink(deepLink: DPLDeepLink!) -> Bool {
//        if let title = deepLink.routeParameters["title"] as? String,
//            message = deepLink.routeParameters["message"] as? String {
//                UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK").show()
//        }
//        return false
//    }
}
