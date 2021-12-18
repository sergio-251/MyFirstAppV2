//
//  MoreInfoUserViewController.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 18.12.2021.
//

import UIKit

class MoreInfoUserViewController: UIViewController {

    @IBOutlet var nameValueLabel: UILabel!
    @IBOutlet var surnameValueLabel: UILabel!
    @IBOutlet var ageValueLabel: UILabel!
    @IBOutlet var loginValueLabel: UILabel!
    
    var currentUser: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameValueLabel.text = currentUser.name
        surnameValueLabel.text = currentUser.surname
        ageValueLabel.text = String(currentUser.age)
        loginValueLabel.text = currentUser.user.login
    }
    


}
