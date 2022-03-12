//
//  ViewController.swift
//  MovieProject
//
//  Created by Joshua Hurtado on 3/7/22.
//

//UI
//

import UIKit
import SafariServices

public var testVar = ""


class ViewController: UIViewController, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var movies = [Movie]()


    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        table.rowHeight = 200
        
        
        
    }
    
    //Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        movies.removeAll()
        
        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=80db887b&s=\(query)&type=movie")!,
            completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            //Convert
            var result: MovieResult?
            do {
                result = try JSONDecoder().decode(MovieResult.self, from: data)
            }
            catch {
                print("error")
            }
            
            guard let finalResult = result else {
                return
            }
            
            
            //Update our Movie array
            let newMovies = finalResult.Search
            self.movies.append(contentsOf: newMovies)
            
            
            //Refresh table
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
            
            
            
        }).resume()
        
        
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        cell.configure(with: movies[indexPath.row])
        
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
      
        button.addTarget(self, action: #selector(accessoryButtonTapped(sender:)), for: .touchUpInside)
        button.tag = indexPath.row
        
        cell.accessoryView = button
        cell.accessoryView?.isUserInteractionEnabled = true
        
          
       
        return cell

    }
    @objc func accessoryButtonTapped(sender : UIButton){
            print(sender.tag)
        print(movies[sender.tag])
            print("Tapped")
        }

        

    
    //func addButtonAction(sender: UIButton){
       // if addButton.isTouchInside {
           // print("2")
      //  }
        
    //}
    
    
    /*
    //IMDB SAFARI LOAD
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //show movie details
       // let url = "https://www.imdb.com/title/\(movies[indexPath.row].imdbID)/"
       // let vc = SFSafariViewController(url: URL(string: url)!)
        //present(vc, animated: true)
        
    }
     */
    
   
}

struct MovieResult: Codable {
    let Search: [Movie]
    
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster

    }
    

    
}
