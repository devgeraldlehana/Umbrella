//
//  ForecastTableViewCell.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/15.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    @IBOutlet weak var dowTitle: UILabel!
    @IBOutlet weak var dowIcon: UIImageView!
    @IBOutlet weak var dowTemp: UILabel!
    
    override func decorateUsingViewModel(viewModel: NSObject) {
        super.decorateUsingViewModel(viewModel: viewModel)

        if let tmpViewModel = viewModel as? ViewModelForecast {
            self.dowTitle.attributedText = tmpViewModel.title
            self.dowIcon.image = UIImage.init(named: tmpViewModel.icon)
            self.dowTemp.attributedText = tmpViewModel.temp
        }
    }
    
}
