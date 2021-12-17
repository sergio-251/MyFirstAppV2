//
//  WelcomeViewController.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 16.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var nameTF: UILabel!
    
    var nameUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = nameUser + ","
    }

}
