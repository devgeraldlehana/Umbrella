//
//  ExtensionUIFont.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/16.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

fileprivate enum APPFONT: String {
    case Bold = "HelveticaNeue-Bold"
    case SemiBold = "HelveticaNeue-Medium"
    case Regular = "HelveticaNeue"
    case Light = "HelveticaNeue-Light"
    case RegularItalic = "HelveticaNeue-Italic"
}

extension UIFont {
    fileprivate static func staticFont(type fontType:APPFONT, size fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: fontType.rawValue, size: fontSize)!
        
        return font
    }
    
    fileprivate static func dynamicFont(type fontType:APPFONT,style fontStyle: UIFont.TextStyle ,size fontSize:CGFloat = 0) -> UIFont {
        let sytemDynamicFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: fontStyle)
        let size = sytemDynamicFontDescriptor.pointSize + fontSize
        let font = UIFont(name: fontType.rawValue, size: size)
        return font!
    }
    
    struct general {
        static let title = UIFont.dynamicFont(type: .SemiBold, style: UIFont.TextStyle.headline, size: 40)
        static let subTitle = UIFont.dynamicFont(type: .Regular, style: UIFont.TextStyle.subheadline, size:10)
        static let tempHeading = UIFont.dynamicFont(type: .SemiBold, style: UIFont.TextStyle.footnote)
        static let tempSubHeading = UIFont.dynamicFont(type: .Regular, style: UIFont.TextStyle.caption1)
        static let forecast = UIFont.dynamicFont(type: .Regular, style: UIFont.TextStyle.callout)
    }
}
