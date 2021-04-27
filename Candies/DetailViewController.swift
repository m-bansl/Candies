//
//  DetailViewController.swift
//  Candies
//
//  Created by Mehak Bansal on 11/04/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var candlyLabel: UILabel!
    
    @IBOutlet weak var candyImage: UIImageView!
    
    
    var detailCandy: String = ""
    var candyImg:String = ""
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        candlyLabel.text = detailCandy
        candyImage.image = UIImage(named: candyImg)
    }
    

    

}
