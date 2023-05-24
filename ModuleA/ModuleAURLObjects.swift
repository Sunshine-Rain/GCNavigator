//
//  ModuleAURLObjects.swift
//  ModuleA
//
//  Created by quan on 2023/5/24.
//

import Foundation
import GCNavigator

public let MoudleAURLObjects: [NavigatorURLObject] = [
    NavigatorURLObject(scheme: "demoapp", path: "avc", createClosure: { param in
        let vc = ModuleADetailViewController.init()
        vc.greetingName = param?["greetingName"] as? String
        return vc
    }, safetyCheck: { params in
        if params?["id"] != nil { return false }
        return true
    })
]
