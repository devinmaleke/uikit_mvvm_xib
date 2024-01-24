//
//  MainMovieCellTableViewCell.swift
//  UiKit_MVVM_Xib
//
//  Created by Devin Maleke on 24/01/24.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    
    //IBOutlets:
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
            
    }

    
}