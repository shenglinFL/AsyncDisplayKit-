//
//  ViewController.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import KMCGeigerCounter
import SkeletonView

extension UIView {
    
    @objc public func showWaitingLoader() {
        
        let gradient = SkeletonGradient(baseColor: UIColor(red:0.9, green:0.9, blue:0.9, alpha:1))
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: GradientDirection.leftRight)
        self.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
    }
    
    @objc public func hideWaitingLoader(){
        
        self.hideSkeleton(reloadDataAfter: true)
    }
}


class ViewController: UIViewController ,ASTableDelegate ,ASTableDataSource{
    
    let tableNode: ASTableNode = {
        let node = ASTableNode(style: .plain)
        return node
    }()
    
    var datas: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setFPSDebug(bool: true)
        
        self.datas = ["ASTableNode","UITableView","TodoListDemo","CustomNode"]
        
        self.createTableNode()
//
//        let btn = ASButtonNode()
//        btn.setTitle("ASTableNode", with: nil, with: UIColor.brown, for: .normal)
//        btn.addTarget(self, action: #selector(push), forControlEvents: .touchUpInside)
//        self.view.addSubnode(btn)
//
//
//        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
//
//        //
//        let btn2 = ASButtonNode()
//        btn2.setTitle("UITableView", with: nil, with: UIColor.brown, for: .normal)
//        btn2.addTarget(self, action: #selector(pushToUITableView), forControlEvents: .touchUpInside)
//        self.view.addSubnode(btn2)
//
//
//        btn2.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        
    }
    
    private func setFPSDebug(bool: Bool) {
        #if !TARGET_IPHONE_SIMULATOR
            KMCGeigerCounter.shared().isEnabled = bool
        #endif
    }
    
    private func createTableNode() {
        self.tableNode.delegate = self
        self.tableNode.dataSource = self
        self.tableNode.frame = self.view.bounds
        self.view.addSubnode(self.tableNode)
    }
    
    
    
    @objc func pushToASTableNode() {
        let todoVC = TodoViewController()
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @objc func pushToUITableView() {
        let todoVC = TodoTestViewController()
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    
    // MARK: - ASTableDataSource
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let title = datas[indexPath.row]
        return {
            let node = MainViewCellNode(title: title, subTitle: "\(indexPath.row)")
            return node
        }
    }
    
//    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
//        let min = CGSize(width: UIScreen.main.bounds.size.width, height: 10)
//        let max = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
//        return ASSizeRange(min: min, max: max)
//    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        
        let str = datas[indexPath.row]
        switch str {
        case "ASTableNode":
            self.pushToASTableNode()
            break
        case "UITableView":
            self.pushToUITableView()
            break
        case "TodoListDemo":
            let todoVC = TodoListViewController()
            self.navigationController?.pushViewController(todoVC, animated: true)
            break
        case "CustomNode":
            let customVC = CustomViewController()
            self.navigationController?.pushViewController(customVC, animated: true)
            break
            
        default:
            
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



