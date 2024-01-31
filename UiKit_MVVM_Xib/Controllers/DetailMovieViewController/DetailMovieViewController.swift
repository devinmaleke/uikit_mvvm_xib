//
//  DetailMovieViewController.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 24/01/24.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    //View Model:
    var viewModel: DetailMovieViewModel
    
    init(viewModel: DetailMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
    }
    
    func configView () {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descLabel.text = viewModel.movieDesc
        imageView.sd_setImage(with: viewModel.movieImage)
    }


}
