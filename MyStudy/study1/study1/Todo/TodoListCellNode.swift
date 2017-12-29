//
//  TodoListCellNode.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import AsyncDisplayKit
import NodeExtension
import ChameleonFramework
class TodoListCellNode: ASCellNode {
    
//    private let _attributes = [NSAttributedStringKey.foregroundColor: UIColor.blue,
//                                              NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
    
    private var _contentsArray = [ASTextNode]()
    private var _circularArray = [ASImageNode]()
    private var _topLineArray = [ASImageNode]()
    private var _bottomLineArray = [ASImageNode]()
    private var length = 2
    private var bottomSpecArray = [ASLayoutSpec]()
    
    internal let dataContents: [String] = ["撒地方卡的时间福利卡都是发的说法是否撒地方卡的时间福利卡都是发的说法是否撒地方卡的时间福利卡都是发的说法是否撒地方卡的时间福利卡都是发的说法是否", "撒地方卡的时间福利卡都是发的说法是否😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭"]
    
    private var circularImage: ASImageNode { // MARK: 这里的写法 var和let？
        let circularImage = ASImageNode()
        circularImage.image = UIImage.as_resizableRoundedImage(withCornerRadius: 3.5, cornerColor: .clear, fill: HexColor("EBEBEB")!)
        circularImage.style.preferredSize = CGSize(width: 7, height: 7)
        circularImage.isLayerBacked = true
        return circularImage
    }
    
    private let titleTimeIcon: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_time_img")
        imageNode.style.preferredSize = CGSize(width: 15, height: 15)
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    private let titleTextNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let itemTreatType: ASTextNode = {
        let textNode = ASTextNode()
        textNode.isLayerBacked = true
        return textNode
    }()
    
    private let itemTodoType: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.image = UIImage.as_imageNamed("icon_back_attend_img")
        imageNode.style.preferredSize = CGSize(width: 36, height: 36)
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    private let segemtLine = DLHorizontalLineNode(direction: .vertical, color: HexColor("EBEBEB")!, width: 0.5)//DLVerticalLineNode(direction: .vertical, color: HexColor("EBEBEB")!, width: 0.5)

    convenience init(index: Int) {
        self.init()
        
        self.automaticallyManagesSubnodes = true
        
        
        
        for i in 0 ..< length {
            let itemsContent  = ASTextNode()
            itemsContent.placeholderColor = UIColor.groupTableViewBackground
//            itemsContent.placeholderInsets = UIEdgeInsetsMake(5, 5, 5, 5)
            itemsContent.placeholderFadeDuration = 100
            itemsContent.isLayerBacked = true
            itemsContent.maximumNumberOfLines = 0
            let paraph = NSMutableParagraphStyle()
            paraph.lineSpacing = 9
            let attributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),
                              NSAttributedStringKey.paragraphStyle: paraph, NSAttributedStringKey.foregroundColor: HexColor("666666")!]
            itemsContent.attributedText = NSAttributedString(string: dataContents[i], attributes: attributes)
            _contentsArray.append(itemsContent)
            
            let circularImage = self.circularImage
            circularImage.isLayerBacked = true
            _circularArray.append(circularImage)
            
            let topLine = DLVerticalLineNode(direction: .vertical, color: HexColor("EBEBEB")!, width: 1)
            topLine.isLayerBacked = true
            topLine.style.flexGrow = 0
            topLine.style.height = ASDimensionMake(10)
            _topLineArray.append(topLine)
            
            let bottomLine = DLVerticalLineNode(direction: .vertical, color: HexColor("EBEBEB")!, width: 1)
            bottomLine.isLayerBacked = true
            _bottomLineArray.append(bottomLine)
        }
        
        // test
        titleTextNode.attributedText = NSAttributedString.dl_attributedString(string: "2017-11-15 08:00", fontSize: 15)
        itemTreatType.attributedText = NSAttributedString.dl_attributedString(string: "待处理", fontSize: 14)
        

    }
    
    override init() {
        super.init()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        for i in 0 ..< length {
            let line_circular = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .center, children: [_topLineArray[i], _circularArray[i], _bottomLineArray[i]])
            line_circular.style.alignSelf = .stretch
            
            let contentSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0), child: _contentsArray[i])
            contentSpec.style.flexGrow = 1.0
            contentSpec.style.flexShrink = 1.0
            
            let bottomSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .start, children: [line_circular, contentSpec])
            bottomSpecArray.append(bottomSpec)
        }
        let bottomLayoutSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .stretch, children: bottomSpecArray)
        
        // top
        itemTreatType.style.spacingAfter = 14.0
        let titleLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [titleTimeIcon, titleTextNode])
        let topLayoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .spaceBetween, alignItems: .center, children: [titleLayoutSpec, itemTreatType])
        
        // content
        let topInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), child: topLayoutSpec)
        let bottomInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0), child: bottomLayoutSpec)
        let contentSpec = ASStackLayoutSpec(direction: .vertical, spacing: 12, justifyContent: .start, alignItems: .stretch, children: [topInsetLayoutSpec, segemtLine, bottomInsetLayoutSpec])
        
        let contentInsetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 12, left: 22, bottom: 13, right: 0), child: contentSpec)
        
        let todoTypeInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: CGFloat.infinity, right: CGFloat.infinity), child: itemTodoType)
        
        let spec = ASOverlayLayoutSpec(child: contentInsetSpec, overlay: todoTypeInset)
        
        return spec
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

