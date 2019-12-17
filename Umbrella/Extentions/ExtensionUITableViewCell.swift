//
//  ExtensionUITableViewCell.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/13.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var defaultReuseIdentifier: String {
        let name = NSStringFromClass(self)
        return name.components(separatedBy: ".").last ?? "emptyCell"
    }
    
    static func dequeueCell(_ tableView:UITableView, _ indexPath: IndexPath, _ identitifier:String) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identitifier)
        if cell == nil
        {
            if identitifier == "emptyCell"{
                cell = UITableViewCell(style: .default, reuseIdentifier: identitifier)
            }
            else {
                tableView.register(UINib.init(nibName:identitifier, bundle: nil), forCellReuseIdentifier:identitifier)
            }
        }
       
        cell = tableView.dequeueReusableCell(withIdentifier: identitifier, for: indexPath)
        
        if let tmpCell = cell{
            tmpCell.selectionStyle = .none
            tmpCell.backgroundColor = .clear
            tmpCell.accessoryType = .none
        }
        return cell!
    }
    
    @objc func decorateUsingViewModel(viewModel:NSObject) {
        
    }
}
