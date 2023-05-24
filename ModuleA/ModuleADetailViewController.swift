//
//  ModuleADetailViewController.swift
//  ModuleA
//
//  Created by quan on 2023/5/23.
//

import UIKit

class ModuleADetailViewController: UIViewController {
    var greetingName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let label = UILabel()
        label.text = "ModuleADetailViewController:\(greetingName ?? "--")"
        label.frame = CGRect(x: 0, y: 100, width: 300, height: 100)
        self.view.addSubview(label)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
