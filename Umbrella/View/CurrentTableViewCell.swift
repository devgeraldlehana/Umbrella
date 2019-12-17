//
//  CurrentTableViewCell.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/13.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

class CurrentTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var dowMin: UILabel!
    @IBOutlet weak var dowCurrent: UILabel!
    @IBOutlet weak var dowMax: UILabel!
    @IBOutlet weak var weather: UIImageView!
    
    override func decorateUsingViewModel(viewModel: NSObject) {
        super.decorateUsingViewModel(viewModel: viewModel)

        if let tmpViewModel = viewModel as? ViewModelCurrent {

            self.title.attributedText = tmpViewModel.title
            self.subTitle.attributedText = tmpViewModel.subTitle
            self.dowMin.attributedText = tmpViewModel.minTemp
            self.dowCurrent.attributedText = tmpViewModel.currentTemp
            self.dowMax.attributedText = tmpViewModel.maxTemp
            self.weather.image = UIImage.init(named: tmpViewModel.weatherImage)
        }
    }
    
}
