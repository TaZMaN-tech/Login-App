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
    
    private var userName: String?
    private var password: String?
    private var person: Person?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.red.withAlphaComponent(0.5),
                                            UIColor.orange.withAlphaComponent(0.5),
                                            UIColor.cyan.withAlphaComponent(0.5)]
        )
        
        let user = User.getUser()
        userName = user.username
        password = user.password
        person = user.person
        
        userTextField.text = userName
        passwordTextField.text = password
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
                message: "Invalid username or password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tapBarVC = segue.destination as? UITabBarController
        
        tapBarVC?.viewControllers?.forEach { viewController in
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.userName = userName
                greetingVC.name = person?.fullName ?? ""
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as? PersonViewController
                personVC?.title = person?.fullName ?? ""
                personVC?.person = person
            }
        }
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }

    
    @IBAction func userNameButtonAction() {
        showAlert(title: "Ooops", message: "Your username is \(userName ?? "")")
    }
    @IBAction func passwordButtonAction() {
        showAlert(title: "Ooops", message: "Your password is \(password ?? "")")
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

