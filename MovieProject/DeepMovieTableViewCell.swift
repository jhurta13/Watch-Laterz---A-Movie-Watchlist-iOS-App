//
//  DeepMovieTableViewCell.swift
//  MovieProject
//
//  Created by Joshua Hurtado on 3/12/22.
//

import UIKit

class DeepMovieTableViewCell: UITableViewCell {
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var moviePlot: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    static let identifier = "DeepMovieTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DeepMovieTableViewCell",
                     bundle: nil)
    }
    
    func configure(with model: deepMovie) {
        //self.movieTitleLabel.text = model.Title
        //self.movieYearLabel.text = model.Year
        //let url = model.Poster
        //if let data = try? Data(contentsOf: URL(string: url)!){
          //  self.moviePosterImageView.image = UIImage(data: data)
       // }
        
    }
}
