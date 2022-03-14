//
//  DBYGOListCell.swift
//  YGO-VIPER
//
//  Created by ddl on 14/03/22.
//

import UIKit
import Kingfisher

class DBYGoListCellViewModel {
//    let title: String
//    let subtitle: String
//    let imageURL: URL?
//    //biar galk download2 terus
//    var imageData: Data? = nil
//
//    init(title: String, subtitle: String, imageURL: URL?) {
//        self.title = title
//        self.subtitle = subtitle
//        self.imageURL = imageURL
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
    
    
    func configureDisplay(with viewModel: Data){
        cardName.text = viewModel.name
        
        //image
        if let imageURL = viewModel.card_images.first?.image_url_small {
            cardImagePreview.kf.setImage(with: URL(string: imageURL))
        }
    }
    
}
