//
//  BioViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 04.12.2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit

final class BioViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var bio: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.purple.withAlphaComponent(0.5), UIColor.red.withAlphaComponent(0.5)])
        bioLabel.text = bio
    }
}
