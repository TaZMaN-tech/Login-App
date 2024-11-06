//
//  ViewController.swift
//  Login App
//
//  Created by Тадевос Курдоглян on 30.10.2024.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.red, UIColor.orange, UIColor.cyan])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userTextField.text == "User", passwordTextField.text == "Password" else {
            showAlert(
                title: "Ooops",
                message: "Invalid username or password",
                textFields: userTextField,
                passwordTextField
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greetingVC = segue.destination as! GreetingViewController
        greetingVC.userName = userTextField.text
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }

    
    @IBAction func userNameButtonAction() {
        showAlert(title: "Ooops", message: "Your username is User", textFields: userTextField)
    }
    @IBAction func passwordButtonAction() {
        showAlert(title: "Ooops", message: "Your password is Password", textFields: passwordTextField)
    }
    
    private func showAlert(title: String, message: String, textFields: UITextField?...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
             textFields.compactMap { $0 }.forEach { $0.text = "" }
         })
        present(alert, animated: true, completion: nil)
    }
}

