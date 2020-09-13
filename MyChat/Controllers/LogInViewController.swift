//
//  LogInViewController.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 22.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        self.addObserveKeyboardNotification()
        setupUI()
        setTagsForTextFields()
    }
    
    @IBAction func logingButtonPressed() {
        if emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {
            performSegue(withIdentifier: Constants.Segues.loginSegue, sender: nil)
        } else {
            //TODO: Alert
            print("Field is empty")
        }
    }
    
    private func setupUI() {
        emailTextField.addShadow()
        emailTextField.addBorderWith(round: 2)
        
        passwordTextField.addShadow()
        passwordTextField.addBorderWith(round: 2)
        
        logInButton.addBorderWith(round: 4)
        logInButton.titleLabel?.font = UIFont(name: Constants.Fonts.signPainter, size: 30)
        logInButton.tintColor = UIColor(named: Constants.Colors.lightGray)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

//MARK: -UITextFieldDelegate and other textfield methods
extension LogInViewController: UITextFieldDelegate {
    private func setTagsForTextFields() {
        emailTextField.tag = 0
        passwordTextField.tag = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            logingButtonPressed()
        }
        
        return true
    }
}
