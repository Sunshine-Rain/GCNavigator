//
//  ModuleATarget.swift
//  ModuleA
//
//  Created by quan on 2023/5/23.
//

import Foundation
import GCNavigator
import UIKit

public enum ModuleATarget: NavigatorTarget {
    case adetail
}

extension ModuleATarget {
    public var viewControllerClass: UIViewController.Type {
        switch self {
        case .adetail:
            return ModuleADetailViewController.self
        }
    }
    
    public var actionType: NavigatorActionType {
        switch self {
        case .adetail:
            return .createViewController
        }
    }
    
    public var createVCClosure: CreateViewControllerClosure? {
        let closure: CreateViewControllerClosure = { params in
            let vc = viewControllerClass.init()
            (vc as! ModuleADetailViewController).greetingName = params?["greetingName"] as? String
            return vc
        }
        return closure
    }
    
    public var customClosure: CustomClosure? {
        return nil
    }
}
