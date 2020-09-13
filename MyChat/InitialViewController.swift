//
//  ViewController.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 21.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet var brandLabel: UILabel! {
        didSet {
            brandLabel.font = UIFont(name: Constants.Fonts.signPainter, size: 60)
        }
    }
    @IBOutlet var logiInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        labelAimation()
    }
    
    private func setupUI() {
        logiInButton.addBorderWith(round: 4)
        logiInButton.addShadow()
        logiInButton.titleLabel?.textColor = UIColor(named: Constants.Colors.lightGray)
        logiInButton.titleLabel?.font = UIFont(name: Constants.Fonts.signPainter, size: 40)
        
        signUpButton.addBorderWith(round: 4)
        signUpButton.addShadow()
        signUpButton.titleLabel?.textColor = UIColor(named: Constants.Colors.lightGray)
        signUpButton.titleLabel?.font = UIFont(name: Constants.Fonts.signPainter, size: 40)
    }
    
    private func labelAimation() {
        brandLabel.text = ""
        let brandText = Constants.brandName
        var charIndex = 1.0
        
        for character in brandText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) {  _ in
                self.brandLabel.text?.append(character)
            }
            charIndex += 1
        }
    }
}


//MARK: -Hiding NavigationBar
extension InitialViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
}
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

