//
//  CustomViewController.swift
//  study1
//
//  Created by 林盛 on 2017/12/28.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CustomViewController: UIViewController {
    
    private let customNode = CustomNode()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.customNode.frame = self.view.bounds
        self.view.addSubnode(self.customNode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
