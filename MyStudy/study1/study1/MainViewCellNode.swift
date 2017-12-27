//
//  MainViewCellNode.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import AsyncDisplayKit

class MainViewCellNode: ASCellNode {
    
    private let titleNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let subTitleNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()

    convenience init(title: String, subTitle: String) {
        self.init()
        
        self.automaticallyManagesSubnodes = true
        
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.brown,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        titleNode.attributedText = NSMutableAttributedString(string: title, attributes: attributes)
        let attributesSubTitle = [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)]
        subTitleNode.attributedText = NSMutableAttributedString(string: subTitle, attributes: attributesSubTitle)
    }
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spec = ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .start, alignItems: .start, children: [self.titleNode,self.subTitleNode])
        let specInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: spec)
        return specInset
    }
}
