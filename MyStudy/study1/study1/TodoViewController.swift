//
//  TodoViewController.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TodoViewController: UIViewController ,ASTableDelegate ,ASTableDataSource{
    
    let tableNode: ASTableNode = ASTableNode(style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.tableNode.frame = self.view.bounds
        self.tableNode.delegate = self;
        self.tableNode.dataSource = self;
        self.view.addSubnode(self.tableNode)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//
//    func numberOfSections(in tableNode: ASTableNode) -> Int {
//        return 1
//    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1000//Int(INT16_MAX)
    }
    
    private var indexPathesToBeReloaded: [IndexPath] = []
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let node = TodoCellNode(index: indexPath.row)
//            node.neverShowPlaceholders = true
//            node.placeholderEnabled = false
//            node.placeholderShouldPersist()

            return node
        }
    }
    
//    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
//        let cell = TodoCellNode(index: indexPath.row)
//
////        cell.neverShowPlaceholders = false
////        if indexPathesToBeReloaded.contains(indexPath) {
////            let oldCellNode = tableNode.nodeForRow(at: indexPath)
////            cell.neverShowPlaceholders = true
////            oldCellNode?.neverShowPlaceholders = true
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
////                cell.neverShowPlaceholders = false
////                if let indexP = self.indexPathesToBeReloaded.index(of: indexPath) {
////                    self.indexPathesToBeReloaded.remove(at: indexP)
////                }
////            })
////        }
//        cell.neverShowPlaceholders = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            cell.neverShowPlaceholders = false
//        }
//        return cell
//    }
    
    
    func reloadDataActionHappensHere() {

        let count = tableNode.dataSource?.tableNode?(tableNode, numberOfRowsInSection: 0) ?? 0
        if count > 2 {
            // 将肉眼可见的cell添加进indexPathesToBeReloaded中
            indexPathesToBeReloaded.append(IndexPath(row: 0, section: 0))
            indexPathesToBeReloaded.append(IndexPath(row: 1, section: 0))
            indexPathesToBeReloaded.append(IndexPath(row: 2, section: 0))
        }
        tableNode.reloadData()

    }
    

//    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
//        return {
//            let node = TodoCellNode()
//            return node
//        }
//
//    }
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let min = CGSize(width: UIScreen.main.bounds.size.width, height: 10)
        let max = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        return ASSizeRange(min: min, max: max)
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        tableNode.reloadData()
        self.reloadDataActionHappensHere()
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
