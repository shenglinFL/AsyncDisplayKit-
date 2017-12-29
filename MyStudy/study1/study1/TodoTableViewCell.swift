//
//  TodoTableViewCell.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import UIKit
import SnapKit
class TodoTableViewCell: UITableViewCell {
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    fileprivate let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subTitleLabel)
        
//        self.contentView.snp.leftMargin = 10
//        self.contentView.snp.rightMargin = 10
        self.contentView.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.topMargin)
//            make.left.right.equalTo(self.contentView.snp.margins)
            make.left.equalTo(self.contentView.snp.leftMargin)
            make.right.equalTo(self.contentView.snp.rightMargin)
        }
        
        self.subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
//            make.left.right.equalToSuperview()
            make.left.equalTo(self.contentView.snp.leftMargin)
            make.right.equalTo(self.contentView.snp.rightMargin)
            make.bottom.equalTo(self.contentView.snp.bottomMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setWithModel(index: Int) {
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.blue,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        
        let subTitle1 = "😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭😄😭" //"adgasfadsfadsfadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsadgasfadsfadsfadsads"//
        let subTitle2 = "😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒😒" //"adgasfadsfa"//
        let subTitle = index%2 == 0 ? subTitle1 : subTitle2
        
        titleLabel.attributedText = NSMutableAttributedString(string: "TITLE \(index)", attributes: attributes)
        subTitleLabel.attributedText = NSMutableAttributedString(string: subTitle, attributes: attributes)
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.0) { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.titleLabel.showSkeleton()
//            strongSelf.subTitleLabel.showSkeleton()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.titleLabel.hideSkeleton()
//            strongSelf.subTitleLabel.hideSkeleton()
//            strongSelf.titleLabel.attributedText = NSMutableAttributedString(string: "TITLE \(index)", attributes: attributes)
//            strongSelf.subTitleLabel.attributedText = NSMutableAttributedString(string: subTitle, attributes: attributes)
//        }
    }
}
