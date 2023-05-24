//
//  GCNavigator.swift
//  GCNavigator
//
//  Created by quan on 2023/5/23.
//

import UIKit

public typealias VCClosure = (UIViewController) -> ()

open class GCNavigator {
    public static let shared = GCNavigator()
    
    /// {
    ///  "scheme" : {
    ///               "path" : object
    ///             }
    /// }
    private var registeredURLs: [ String : [ String : NavigatorURLObject] ] = [:]
    
    open func navigate(target: NavigatorTarget, params: [String : Any]? = nil, callback: VCClosure? = nil) {
        switch target.actionType {
        case .createViewController:
            assert(target.createVCClosure != nil)
            if let callback = callback,
               let vc = target.createVCClosure?(params) {
                callback(vc)
            }
        case .custom:
            assert(target.customClosure != nil)
            target.customClosure?(params)
        }
    }
    
    @discardableResult
    open func openURL(url: URL, callback: VCClosure) -> Bool {
        guard let scheme = url.scheme,
              let map = registeredURLs[scheme] else {
            return false
        }
       
        let query: String? = url.query
        var path = url.absoluteString
        if let schemeRange = path.range(of: scheme + "://") {
            path.replaceSubrange(schemeRange, with: "")
            if let query = query,
               let queryRange = path.range(of: "?" + query) {
                path.replaceSubrange(queryRange, with: "")
            }
        }
        
        guard let urlObject = map[path] else {
            return false
        }
        
        var params: [String : String] = [:]
        if let query = query {
            query.components(separatedBy: "&").forEach { pair in
                let key = pair.components(separatedBy: "=").first ?? ""
                let value = pair
                    .components(separatedBy:"=").last?.removingPercentEncoding
                params[key] = value
            }
        }
        
        guard urlObject.safetyCheck(params) else {
            return false
        }
        
        let vc = urlObject.createClosure(params)
        callback(vc)
        return true
    }
    
    open func registerURLs(urls: [NavigatorURLObject]) {
        urls.forEach { obj in
            let scheme = obj.scheme
            var schemeMap: [ String : NavigatorURLObject] = registeredURLs[scheme] ?? [:]
            schemeMap[obj.path] = obj
            registeredURLs[scheme] = schemeMap
        }
    }
}
