//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Sergey Efimov on 16.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var enterNameTF: UITextField!
    @IBOutlet var enterPasswordTF: UITextField!
    
    private let currentPerson = Person.getAnyPerson()

    @IBAction func logInButtonPressed() {
        if !isCorrectInput() {
            showWrongNamePass()
            enterPasswordTF.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.nameUser = currentPerson.user.login
            } else if let navigationVC = viewController as? UINavigationController {
                let infoUserVC = navigationVC.topViewController as? InfoUserViewController
                viewController.tabBarItem.title = "\(currentPerson.name) \(currentPerson.surname)"
                infoUserVC?.currentPerson = currentPerson
            }
        }
    }
    
   
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        var resultMessage = ""
        if sender.restorationIdentifier == "ForgotNameButton" {
            resultMessage = "Your login is \n\(currentPerson.user.login)"
        } else {
            resultMessage = "Your password is \n\(currentPerson.user.password)"
        }
        showAlert(title: "Oooops...", message: resultMessage)
        }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        enterNameTF.text = ""
        enterPasswordTF.text = ""
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showWrongNamePass() {
            showAlert(
                title: "Wrong name or password",
                message: "Please, enter correct name or password"
            )
    }
    
    private func isCorrectName() -> Bool {
        guard let currentName = enterNameTF.text, currentName != "" else {
            return false
        }
        return currentName == currentPerson.user.login
    }
    
    private func isCorrectPassword() -> Bool {
        guard let currentPassword = enterPasswordTF.text,
                currentPassword != "" else { return false}
        return currentPassword == currentPerson.user.password
    }
    
    private func showAlert(
        title: String = "",
        message: String = "",
        buttonType: String = "OK"
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        present(alert, animated: true)
        let okAction = UIAlertAction(title: buttonType, style: .default)
        alert.addAction(okAction)
    }
    
    private func isCorrectInput() -> Bool {
        isCorrectName() && isCorrectPassword()
    }
}

// MARK: - UITextViewDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == enterNameTF {
            enterPasswordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}



