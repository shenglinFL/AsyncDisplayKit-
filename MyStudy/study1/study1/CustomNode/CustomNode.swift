//
//  CustomNode.swift
//  study1
//
//  Created by 林盛 on 2017/12/28.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import AsyncDisplayKit

class CustomNode: ASDisplayNode {
    private let timeLineLineImage: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_left_img1")
        imageNode.isLayerBacked = true
        imageNode.contentMode = .center
        return imageNode
    }()
    
    private let timeLinePointImage: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_left_img2")
//        imageNode.backgroundColor = UIColor.blue
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
//        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1), child: timeLinePointImage)
//
//        timeLineLineImage.style.preferredSize = CGSize(width: 1, height: 100)
//        timeLineLineImage.style.layoutPosition = CGPoint(x: 100, y: 100)
//
//        let spec = ASOverlayLayoutSpec(child: self.timeLineLineImage, overlay: insetSpec)
//        let specAll = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .center, alignItems: .center, children: [spec])
        
        timeLineLineImage.style.preferredSize = CGSize(width: 3, height: 100)
        timeLineLineImage.style.layoutPosition = CGPoint(x: 0, y: 0)
        timeLinePointImage.style.preferredSize = CGSize(width: 5, height: 5)
        timeLinePointImage.style.layoutPosition = CGPoint(x: 0, y: 0)
        
//        let horTimeLineStackLayout = ASOverlayLayoutSpec(child: timeLineLineImage, overlay: timeLinePointImage)
        let horTimeLinePointImage = ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: timeLinePointImage)
        let horTimeLineStackLayout = ASOverlayLayoutSpec(child: timeLineLineImage, overlay: horTimeLinePointImage)
        
//        let allStackLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), child: horTimeLineStackLayout)
        let allStackLayout = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .center, alignItems: .center, children: [horTimeLineStackLayout])
        return allStackLayout
        
    }
}
