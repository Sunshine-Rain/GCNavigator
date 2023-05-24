//
//  NavigatorURLTarget.swift
//  GCNavigator
//
//  Created by quan on 2023/5/23.
//

import Foundation

public struct NavigatorURLObject {
    public var scheme: String
    public var path: String
    public var createClosure: CreateViewControllerClosure
    public var safetyCheck: SafetyCheckClosure
    
    public init(scheme: String, path: String, createClosure: @escaping CreateViewControllerClosure, safetyCheck: @escaping SafetyCheckClosure) {
        self.scheme = scheme
        self.path = path
        self.createClosure = createClosure
        self.safetyCheck = safetyCheck
    }
}
