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
    
    private let defaultUserName = "Simple"
    private let defaultUserPassword = "1111"

    @IBAction func logInButtonPressed() {
        if !isCorrectInput() {
            showWrongNamePass()
            enterPasswordTF.text = ""
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        showForgotAlert(for: sender)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.nameUser = defaultUserName
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let loginVC = segue.destination as? LoginViewController else {
            return
        }
        loginVC.enterNameTF.text = ""
        loginVC.enterPasswordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - Private Methods
extension LoginViewController {
    private func showForgotAlert(for button: UIButton) {
        button.restorationIdentifier == "ForgotNameButton"
        ? showAlert(
            title: "Ohhh...",
            message: "Your login is \n\(defaultUserName)"
        )
        : showAlert(
            title: "Ooooops...",
            message: "Your password is \n\(defaultUserPassword)"
        )
    }

    
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
        return currentName == defaultUserName
    }
    
    private func isCorrectPassword() -> Bool {
        guard let currentPassword = enterPasswordTF.text,
                currentPassword != "" else { return false}
        return currentPassword == defaultUserPassword
    }
    
    private func showAlert(
        title: String,
        message: String,
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


