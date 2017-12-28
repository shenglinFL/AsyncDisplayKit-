//
//  TodoListCellNode.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import AsyncDisplayKit

class TodoListCellNode: ASCellNode {
    
//    private let _attributes = [NSAttributedStringKey.foregroundColor: UIColor.blue,
//                                              NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
    
    private let todoTypeImageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.contentMode = .center
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    private let timeIconImageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_time_img")
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    private let timeTextNode: ASTextNode = {
        let textNode = ASTextNode()
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        textNode.attributedText = NSMutableAttributedString(string: "--", attributes: attributes)
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let treatTypeTextNode: ASTextNode = {
        let textNode = ASTextNode()
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.brown, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        textNode.attributedText = NSMutableAttributedString(string: "--", attributes: attributes)
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let segmentLine: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.backgroundColor = UIColor.lightGray
        imageNode.isLayerBacked = true
        imageNode.style.height = ASDimensionMake(0.5)
        return imageNode
    }()
    
    private let timeLineLineImage: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_left_img1")
        imageNode.isLayerBacked = true
        imageNode.style.width = ASDimensionMake(0.5)
        return imageNode
    }()

    private let timeLinePointImage: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_left_img2")
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    private let contentTextNode1: ASTextNode = {
        let textNode = ASTextNode()
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)]
        textNode.attributedText = NSMutableAttributedString(string: "--", attributes: attributes)
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let contentTextNode2: ASTextNode = {
        let textNode = ASTextNode()
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        textNode.attributedText = NSMutableAttributedString(string: "--", attributes: attributes)
        textNode.isLayerBacked = true
        return textNode
    }()

    convenience init(index: Int) {
        self.init()
        
        self.automaticallyManagesSubnodes = true
        
        // test
        todoTypeImageNode.image = UIImage.as_imageNamed("icon_back_attend_img")
        
        timeTextNode.attributedText = NSMutableAttributedString.dl_attributedString(string: "2017-11-15 08:00", fontSize: 15, color: UIColor.gray)
        treatTypeTextNode.attributedText = NSMutableAttributedString.dl_attributedString(string: "待处理", fontSize: 14, color: UIColor.brown)
        
    }
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let specTime = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .center, alignItems: .center, children: [timeIconImageNode, timeTextNode])
        
        let specTreatType = ASRelativeLayoutSpec(horizontalPosition: .end, verticalPosition: .center, sizingOption: .minimumWidth, child: treatTypeTextNode)
        specTreatType.style.flexGrow = 1
        
        let specTitle = ASStackLayoutSpec(direction: .horizontal, spacing: 20, justifyContent: .center, alignItems: .start, children: [specTime, specTreatType])

        let specTitleAll = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 14), child: specTitle)

        let specTitleAndLine = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [specTitleAll, segmentLine])
        
        todoTypeImageNode.style.layoutPosition = CGPoint(x: 0, y: 0)
        let specTodoTypeImage = ASRelativeLayoutSpec(horizontalPosition: .start, verticalPosition: .start, sizingOption: .minimumSize, child: todoTypeImageNode)
        
        timeLinePointImage.style.layoutPosition = CGPoint(x: 25, y: 15)
        timeLinePointImage.style.preferredSize = CGSize(width: 10, height: 10)
        let specTimeLinePoint = ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: timeLinePointImage)
        
        let specleftLine1 = ASOverlayLayoutSpec(child: timeLineLineImage, overlay: specTimeLinePoint)
        let specContentLine1 = ASStackLayoutSpec(direction: .horizontal, spacing: 12, justifyContent: .center, alignItems: .start, children: [specleftLine1, contentTextNode1])
        
        let specTitleAndContent = ASStackLayoutSpec(direction: .vertical, spacing: 20, justifyContent: .center, alignItems: .start, children: [specTitleAndLine, specContentLine1])
        
        let specTitleAndContentInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 12, left: 22, bottom: 12, right: 14), child: specTitleAndContent)
        
        let specAll = ASOverlayLayoutSpec(child: specTitleAndContentInset, overlay: specTodoTypeImage)
        
        return specAll
    }
    
}

extension NSAttributedString {
    
    /// Create a NSAttributedString with some attributes
    ///
    /// - Parameters:
    ///   - string: The string for the new attributed string
    ///   - size: The font size of attributed string
    ///   - color: The color of attributed string
    /// - Returns: A NSAttributedString instance
    public static func dl_attributedString(string: String, fontSize size: CGFloat, color: UIColor = .black) -> NSAttributedString {
        return NSAttributedString.dl_attributedString(string: string, fontSize: size, color: color, firstWordColor: nil)
    }
    
    /// Create a NSAttributedString with some attributes
    ///
    /// - Parameters:
    ///   - string: The string for the new attributed string
    ///   - size: The font size of attributed string
    ///   - color: The color of attributed string
    ///   - firstWordColor: The color of frist word
    /// - Returns: A NSAttributedString instance
    public static func dl_attributedString(string: String, fontSize size: CGFloat, color: UIColor = .black, firstWordColor: UIColor? = nil) -> NSAttributedString {
        let attributes = [NSAttributedStringKey.foregroundColor: color,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: size)]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        if let firstWordColor = firstWordColor {
            let nsString = string as NSString
            let firstSpaceRange = nsString.rangeOfCharacter(from: NSCharacterSet.whitespaces)
            let firstWordRange  = NSMakeRange(0, firstSpaceRange.location)
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: firstWordColor, range: firstWordRange)
        }
        
        return attributedString
    }

}

