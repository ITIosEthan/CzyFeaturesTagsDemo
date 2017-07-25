//
//  CzyFeatureTags.swift
//  CzyFeaturesTagsDemo
//
//  Created by macOfEthan on 17/7/25.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

class CzyFeatureTags: UIView {

    let leftMargin:CGFloat = 10
    let rightMargin:CGFloat = 10
    let padding:CGFloat = 10
    let tagH:CGFloat = 30
    
    
    //模型数组
    var tagsModelArr:[TagsModel]? = [TagsModel]()
    //外边传进来的字符串数组
    var tagsArr:[String]?{
    
        didSet{
            
            for s:String in tagsArr! {
                
                //将外界传进来的数组转化成模型 并缓存宽度
                let model:TagsModel = TagsModel()
                model.tagTitle = s
                model.tagWidth = self.tagWidthCalculated(string: s)
                
                tagsModelArr?.append(model)
            }
            
            for model:TagsModel in tagsModelArr! {
                
                print("model.width = \(model.tagWidth), model.title = \(model.tagTitle)")
            }
            
            self.addSubTags()
        }
    }
    
    func addSubTags() -> Void {
        
        //总长度
        var totalWidth:CGFloat = 0
        //换行的次数
        var enterTimes:Int = 0
        
        
        for i in 0..<(tagsModelArr?.count)! {
            
            let model:TagsModel = tagsModelArr![i]
            
            //换行 totalWidth = 0 enterTimes +1
            if totalWidth+leftMargin+rightMargin > UIScreen.main.bounds.size.width-model.tagWidth! {
                totalWidth = 0
                enterTimes += 1
            }

            let tag:UIButton = UIButton.init(frame: CGRect.init(x: leftMargin+totalWidth, y: 20+(CGFloat)(enterTimes)*(tagH+padding), width: model.tagWidth!, height: tagH))
            
            tag.setTitle(model.tagTitle, for: .normal)
            
            tag.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            
            tag.backgroundColor = self.randonColor()
            
            self.addSubview(tag)
            
            totalWidth += model.tagWidth!+padding
        }
    }
    
    
    func randonColor() -> UIColor {
        
        let red:CGFloat = (CGFloat)(arc4random_uniform(255))/(CGFloat)(255.0)
        let green:CGFloat = (CGFloat)(arc4random_uniform(255))/(CGFloat)(255.0)
        let blue:CGFloat = (CGFloat)(arc4random_uniform(255))/(CGFloat)(255.0)

        return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 计算文字长度
    func tagWidthCalculated(string targetStr:String?) -> CGFloat {
        
        let btn_W = targetStr?.boundingRect(with: CGSize.init(width: UIScreen.main.bounds.size.width, height: btn_H),
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSForegroundColorAttributeName:UIColor.red, NSFontAttributeName:UIFont.systemFont(ofSize: 16)],
                                            context: nil).size.width
        
        return btn_W!
    }

}
