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
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.purple.withAlphaComponent(0.5), UIColor.red.withAlphaComponent(0.5)])
        greetingLabel.text = "Hello, \(userName ?? "")\nMy name is \(name ?? "")!"
    }
}
