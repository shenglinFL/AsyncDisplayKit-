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
        return imageNode
    }()
    
//    private let timeLineLineImage: ASImageNode = {
//        let imageNode = ASImageNode()
//        imageNode.image = UIImage.as_imageNamed("icon_left_img1")
//        imageNode.isLayerBacked = true
//        return imageNode
//    }()
//
//    private let timeLinePointImage: ASImageNode = {
//        let imageNode = ASImageNode()
//        imageNode.image = UIImage.as_imageNamed("icon_left_img2")
//        imageNode.isLayerBacked = true
//        return imageNode
//    }()

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
        let specTime = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .center, alignItems: .start, children: [timeIconImageNode, timeTextNode])
//        let specTitle = ASStackLayoutSpec(direction: .horizontal, spacing: 20, justifyContent: .start, alignItems: .start, children: [specTime, treatTypeTextNode])
        
        let specTreatType = ASRelativeLayoutSpec(horizontalPosition: .end, verticalPosition: .center, sizingOption: .minimumWidth, child: treatTypeTextNode)
        let specTitle = ASStackLayoutSpec(direction: .horizontal, spacing: 20, justifyContent: .start, alignItems: .start, children: [specTime, specTreatType])
        
       
        
        let specTitleAll = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 12, left: 22, bottom: 12, right: 14), child: specTitle)
        //let specAll = ASOverlayLayoutSpec(child: specTitleAll, overlay: todoTypeImageNode)
        
        specTreatType.style.flexShrink = 1
        specTreatType.style.flexGrow = 1
        
        todoTypeImageNode.style.layoutPosition = CGPoint(x: 0, y: 0)
        
        
        let specAll = ASAbsoluteLayoutSpec(children: [specTitleAll, todoTypeImageNode])
        
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

