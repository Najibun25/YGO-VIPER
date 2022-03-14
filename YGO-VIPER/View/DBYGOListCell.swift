//
//  DBYGOListCell.swift
//  YGO-VIPER
//
//  Created by ddl on 14/03/22.
//

import UIKit

class DBYGOListCell: UITableViewCell {
    
    @IBOutlet weak var levelIconPreview: UIImageView!
    @IBOutlet weak var cardImagePreview: UIImageView!
    @IBOutlet weak var levelOrStar: UILabel!
    @IBOutlet weak var typeCard: UILabel!
    @IBOutlet weak var cardName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
