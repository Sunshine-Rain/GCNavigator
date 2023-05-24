//
//  NavigatorTarget.swift
//  GCNavigator
//
//  Created by quan on 2023/5/18.
//

import UIKit

public typealias SafetyCheckClosure = (([String : Any]?) -> Bool)
public typealias CreateViewControllerClosure = (([String : Any]?) -> UIViewController)
public typealias CustomClosure = (([String : Any]?) -> ())

public enum NavigatorActionType {
    case createViewController
    case custom
}

public protocol NavigatorTarget {
    var actionType: NavigatorActionType { get }
    var viewControllerClass: UIViewController.Type { get }
    var createVCClosure: CreateViewControllerClosure? { get }
    var customClosure: CustomClosure? { get }
}

public extension NavigatorTarget {
    var customClosure: CustomClosure? {
        return nil
    }
}
