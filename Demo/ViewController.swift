//
//  ViewController.swift
//  Demo
//
//  Created by quan on 2023/5/23.
//

import UIKit
import GCNavigator
import ModuleA

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GCNavigator.shared.registerURLs(urls: MoudleAURLObjects)
        
        GCNavigator.shared.navigate(target: ModuleATarget.adetail, params: ["greetingName": "你好啊"]) { vc in
            DispatchQueue.main.async {
                self.present(vc, animated: true)
            }
        }
    }


}

