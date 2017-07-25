//
//  ViewController.swift
//  CzyFeaturesTagsDemo
//
//  Created by macOfEthan on 17/7/2.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

import UIKit

let nums:Int = 20
let leftMargin:CFloat = 12
let rightMaigth:CGFloat = 12
let btn_H:CGFloat = 20

class ViewController: UIViewController {

    // MARK: - 懒加载初始长度不一的标签
    lazy var tags:[String]? = { () -> [String] in
        
        var tags:[String]? = [String]()
        
        var arr:[String]? = ["懒加载初始长度不一的标签", "Objective-C", "Swift", "HTML 5", "CSS", "JavaScript",  "JQuery",  "AJAX", "Node.js", "JSX", "React-Native", "ASP.Net", "Java", "懒加载初始长度不一的标签", "none"]
        
        for i in 0..<arr!.count{
            
            var content:String = ""
            
//            for j in 0..<i+1{
//                content = content + (String)(i)
//            }
            
            content = arr![i]
            
            tags?.append(content)
        }
    
        return tags!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.tags ?? "")
        
        let tagsView:CzyFeatureTags = CzyFeatureTags(frame: self.view.bounds)
        
        tagsView.tagsArr = tags
        
        self.view.addSubview(tagsView)
    }

}

