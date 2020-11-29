//
//  KyarazukannCell.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/11/15.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class KyarazukannCell: UITableViewCell {
    
    @IBOutlet weak var favoriteStar: UIButton!
    var saveDeta: UserDefaults = UserDefaults.standard
 //   var favoriteFlag: [Bool]!

    var favoriteFlag: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        favoriteStar.setImage(UIImage(named: "スクリーンショット 2020-11-03 14.13.19"), for: UIControl.State())
//        favoriteFlag  = saveDeta.object(forKey: "if") as! [Bool]

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
//    @IBAction func favoriteButton(_ sender: Any) {
    func setImage(favorite: Bool) {
    
       var image: UIImage?
        if favoriteFlag  {
            guard let starImage = UIImage(named: "favoriteStar") else {return}
            image = starImage
        } else {
            guard let starImage = UIImage(named: "favoriteStarBlank") else {return}
            image = starImage
        }
        favoriteStar.setImage(image, for: UIControl.State())
    }
    
}
