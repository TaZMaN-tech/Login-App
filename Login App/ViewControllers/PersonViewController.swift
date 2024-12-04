//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 04.12.2024.
//  Copyright © 2024 Alexey Efimov. All rights reserved.
//

import UIKit

final class PersonViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var birthFateLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colors: [UIColor.purple.withAlphaComponent(0.5), UIColor.red.withAlphaComponent(0.5)])

        nameLabel.text = (person.fullName)
        ageLabel.text = String(person.age)
        birthFateLabel.text = person.birthDate
        cityLabel.text = person.city
        countryLabel.text = person.country
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.title = person.fullName
        bioVC?.bio = person.bio
    }
}
