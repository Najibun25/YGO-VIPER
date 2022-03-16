//
//  DetailViewController.swift
//  YGO-VIPER
//
//  Created by ddl on 14/03/22.
//

import UIKit
import Kingfisher

protocol DetailViewProtocol {
    var presenter: DetailYGOPresenterProtocol? {get set}
}

class DetailViewController: UIViewController, DetailViewProtocol, UIScrollViewDelegate {
    var presenter: DetailYGOPresenterProtocol?

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var attributeCard: UILabel!
    @IBOutlet weak var levelOrRank: UILabel!
    @IBOutlet weak var typeRace: UILabel!
    @IBOutlet weak var cardDesc: UILabel!
    @IBOutlet weak var cardArctype: UILabel!
    @IBOutlet weak var atkAndDeff: UILabel!
    // presenter
    var viewModel: Data?
    // bikin image
    // belum dibuat viper style
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            return
        }

        setUpDetailImage(with: viewModel)

        // Do any additional setup after loading the view.
    }
    func setUpDetailImage(with viewModel: Data) {
        if let detailImageURL = viewModel.card_images.first?.image_url {
            detailImage.kf.setImage(with: URL(string: detailImageURL))
        }
        cardName.text = viewModel.name
        cardName.font = .systemFont(ofSize: 25, weight: .bold)
        cardName.numberOfLines = 0
        attributeCard.text = "Attribute: \(viewModel.attribute ?? "-")"

        levelOrRank.text = "Level/Rank : \(viewModel.level ?? 0)"
//
        typeRace.text = "[\(viewModel.race ?? "")/\(viewModel.type)]"
        typeRace.font = .systemFont(ofSize: 16, weight: .medium)
//
        cardDesc.text = viewModel.desc
        cardDesc.numberOfLines = 0
        cardDesc.font = .systemFont(ofSize: 11, weight: .medium)
//
        atkAndDeff.text = "ATK/\(viewModel.atk ?? 0) DEF/\(viewModel.def ?? 0)"
//
        cardArctype.text = "Archtype : \(viewModel.archetype ?? "")"
        cardArctype.font = .systemFont(ofSize: 13, weight: .regular)
//
//        viewCard.layer.cornerRadius = 10
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
