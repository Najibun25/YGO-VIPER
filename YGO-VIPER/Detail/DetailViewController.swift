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

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: DetailYGOPresenterProtocol?

    @IBOutlet weak var detailImage: UIImageView!
    
    //presenter
    var viewModel: Data?
    
    //bikin image
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {
            return
        }

        setUpDetailImage(with: viewModel)

        // Do any additional setup after loading the view.
    }
    
    func setUpDetailImage(with viewModel: Data){
        if let detailImageURL = viewModel.card_images.first?.image_url {
            detailImage.kf.setImage(with: URL(string: detailImageURL))
        }
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
