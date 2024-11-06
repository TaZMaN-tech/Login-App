//
//  GreetingViewController.swift
//  Login App
//
//  Created by Тадевос Курдоглян on 30.10.2024.
//

import UIKit

final class GreetingViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.red, UIColor.blue])
        greetingLabel.text = "Hello, \(userName ?? "")!"
    }
}
