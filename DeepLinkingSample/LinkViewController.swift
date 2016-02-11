//
//  LinkViewController.swift
//  DeepLinkingSample
//
//  Created by Hui Key on 11/2/2016.
//  Copyright © 2016 KeyFun. All rights reserved.
//

import UIKit
import Bolts
import DeepLinkKit

class LinkViewController: UIViewController, DPLTargetViewController {
    
    var returnToRefererController:BFAppLinkReturnToRefererController?
    var returnToRefererView:BFAppLinkReturnToRefererView?
    var openedAppLinkURL:NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.returnToRefererController = BFAppLinkReturnToRefererController()
        self.returnToRefererController?.view = self.returnToRefererView
        
        // If you have a UINavigationController in the view, then the bar must be shown above it.
        [self.returnToRefererController]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show only if you have a back AppLink.
        self.returnToRefererController?.showViewForRefererURL(self.openedAppLinkURL)
    }
    
    func configureWithDeepLink(deepLink: DPLDeepLink!) {
        let sku:String? = deepLink.routeParameters["sku"] as? String
        print("sku = \(sku)")
    }
    
}
