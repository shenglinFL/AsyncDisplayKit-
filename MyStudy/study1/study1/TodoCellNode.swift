//
//  TodoCellNode.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import AsyncDisplayKit

class TodoCellNode: ASCellNode {
    
    fileprivate let titleLabel: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()
    fileprivate let subTitleLabel: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()
    
    
    convenience init(index: Int) {
        self.init()
        
        self.automaticallyManagesSubnodes = true
        
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.blue,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        
        let subTitle1 = "😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭" //"adgasfadsfadsfadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsads"//
        let subTitle2 = "😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒" //"adgasfadsfa"//
        let subTitle = index%2 == 0 ? subTitle1 : subTitle2
        
        titleLabel.attributedText = NSMutableAttributedString(string: "TITLE \(index)", attributes: attributes)
        subTitleLabel.attributedText = NSMutableAttributedString(string: subTitle, attributes: attributes)
        
        //print(index)

    }
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        let spec = ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .center, children: [self.titleLabel, self.subTitleLabel])
        let specInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: spec)
        return specInset
    }
    
    
}
