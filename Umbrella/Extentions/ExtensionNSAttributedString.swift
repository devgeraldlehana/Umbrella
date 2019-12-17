//
//  ExtensionNSAttributedString.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/13.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

extension NSAttributedString {
    convenience init(text:String, textColor:UIColor, textFont:UIFont){
        let multipleAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: textFont]
        self.init(string: text, attributes: multipleAttributes)
    }
    
    convenience init(text1:String, text2:String, textColor:UIColor, textFont1:UIFont, textFont2:UIFont){
        let multipleAttributes1: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: textFont1]
        
        let multipleAttributes2: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: textColor,
        NSAttributedString.Key.font: textFont2]
        
        let att = NSMutableAttributedString(string: text1, attributes: multipleAttributes1)
        att.append(NSAttributedString(string: text2, attributes: multipleAttributes2))
        
        self.init(attributedString:att)
    }
}
