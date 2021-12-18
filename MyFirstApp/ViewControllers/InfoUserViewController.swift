//
//  InfoUserViewController.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 18.12.2021.
//

import UIKit

class InfoUserViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    
    var descriptionUser: String!
    var currentPerson: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionUser
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let moreInfoVC = segue.destination as! MoreInfoUserViewController
        moreInfoVC.currentUser = currentPerson
    }

}
