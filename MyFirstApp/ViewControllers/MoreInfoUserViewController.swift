//
//  MoreInfoUserViewController.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 18.12.2021.
//

import UIKit

class MoreInfoUserViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameValueLabel: UILabel!
    
    var name: String!
    var nameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        nameValueLabel.text = nameValue
    
    }
    


}
