//
//  DetailViewController.swift
//  MovieProject
//
//  Created by Joshua Hurtado on 3/12/22.
//

//self.plotFunction()

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieID: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var typeID: UILabel!
    
    
    @IBOutlet weak var showMenuButton: UIButton!
    
        
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Add to Favorites", image: UIImage(systemName: "star.fill"), handler: { (_) in
            }),
            
          /*  UIAction(title: "Disabled item", image: UIImage(systemName: "moon"), attributes: .disabled, handler: { (_) in
            }),
            
            UIAction(title: "Delete..", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
            }) */
        ]
    }

    
    @IBAction func showMenuAction(_ sender: UIButton) {
        
        
    }
    
    
    
    

    var demoMenu: UIMenu {
        return UIMenu(title: "Add to List", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
  
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let m = movie {
            movieTitle.text = m.Title
            movieID.text = m.Year
            imageOutlet.image = UIImage(named: m.Poster.description)
            typeID.text = m._Type
            let url = m.Poster
            if let data = try? Data(contentsOf: URL(string: url)!){
                self.imageOutlet.image = UIImage(data: data)
            }
            
        }
   
        
        showMenuButton.menu = demoMenu
        showMenuButton.showsMenuAsPrimaryAction = true
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

struct individualMovieResult: Codable {
    let deepSearch: [deepMovie]
    
}

struct deepMovie: Codable {
    let Title: String
    let Plot: String
    
    
    private enum CodingKeys: String, CodingKey {
        case Title, Plot

    }
    

    
}

