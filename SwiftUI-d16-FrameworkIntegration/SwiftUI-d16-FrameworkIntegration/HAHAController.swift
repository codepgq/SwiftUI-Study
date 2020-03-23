//
//  HAHAController.swift
//  SwiftUI-d16-FrameworkIntegration
//
//  Created by pgq on 2020/3/23.
//  Copyright © 2020 pq. All rights reserved.
//

import UIKit

class HAHAController: UIViewController {

    var haha: String = "aaaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.text = haha
        label.textColor = .blue
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
