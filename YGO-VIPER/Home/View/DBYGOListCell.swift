//
//  DBYGOListCell.swift
//  YGO-VIPER
//
//  Created by ddl on 14/03/22.
//

import UIKit
import Kingfisher

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
        setDisplayCell()
    }    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDisplayCell() {
        // cardName.textAlignment = .left
        cardName.numberOfLines = 0
        cardName.adjustsFontSizeToFitWidth = true
        cardName.sizeToFit()
    }
    func configureDisplay(with viewModel: Data) {
        cardName.text = viewModel.name
        cardName.font = .systemFont(ofSize: 25, weight: .heavy)
        typeCard.text = viewModel.type
        typeCard.font = .systemFont(ofSize: 16, weight: .medium)
        typeCard.numberOfLines = 0
        levelOrStar.text = "Level/Rank : \(viewModel.level ?? 0)"
        levelOrStar.font = .systemFont(ofSize: 16, weight: .medium)
        levelOrStar.numberOfLines = 0
        // add something
        // image kanan
        if let imageURL = viewModel.card_images.first?.image_url_small {
            cardImagePreview.kf.setImage(with: URL(string: imageURL))
        }
    }
}
