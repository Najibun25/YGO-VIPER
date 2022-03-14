//
//  DBYGOListCell.swift
//  YGO-VIPER
//
//  Created by ddl on 14/03/22.
//

import UIKit

class DBYGoListCellViewModel {
    
}


class DBYGOListCell: UITableViewCell {
    
    @IBOutlet weak var levelIconPreview: UIImageView!
    @IBOutlet weak var cardImagePreview: UIImageView!
    @IBOutlet weak var levelOrStar: UILabel!
    @IBOutlet weak var typeCard: UILabel!
    @IBOutlet weak var cardName: UILabel!
    
    static let cellIdentifier = "ReusableYGOCell"
    static let nibName = "DBYGOListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        SetDisplaycell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func SetDisplaycell(){
        //cardName.textAlignment = .left
        cardName.numberOfLines = 0
        cardName.adjustsFontSizeToFitWidth = true
        cardName.sizeToFit()
    }
    
}
