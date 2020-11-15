//
//  KyarazukannCell.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/11/15.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class KyarazukannCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var favoriteFlag: Bool = false
        @IBOutlet weak var favoriteStar: UIButton!
        @IBAction func favoriteButton(_ sender: Any) {
            var image: UIImage?
            if favoriteFlag {
                guard let starImage = UIImage(named: "スクリーンショット 2020-11-03 14.13.19") else {return}
                image = starImage
            } else {
                guard let starImage = UIImage(named: "スクリーンショット 2020-11-03 14.13.42") else {return}
                image = starImage
            }
            favoriteStar.setImage(image, for: UIControl.State())
            favoriteFlag = !favoriteFlag
        }

}
