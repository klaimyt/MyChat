//
//  SignUpViewController.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 23.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addObserveKeyboardNotification()
        setupUI()
        setTagsForTextFields()
        setDelegatesForTextFields()
    }
    
    @IBAction func signUpButtonPressed() {
        if emailTextField.text?.isEmpty == false && checkPassword() == true { //For better reading
            performSegue(withIdentifier: Constants.Segues.signupSegue, sender: nil)
        }
    }
    
    //MARK: - UI settings
    private func setupUI() {
        emailTextField.addBorderWith(round: 2)
        emailTextField.addShadow()
        
        passwordTextField.addBorderWith(round: 2)
        passwordTextField.addShadow()
        
        confirmPasswordTF.addBorderWith(round: 2)
        confirmPasswordTF.addShadow()
        
        signUpButton.addBorderWith(round: 4)
        signUpButton.titleLabel?.font = UIFont(name: Constants.Fonts.signPainter, size: 30)
        signUpButton.tintColor = UIColor(named: Constants.Colors.lightGray)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func checkPassword() -> Bool {
        guard let password = passwordTextField.text, password.isEmpty == false,
            let repeatedPassword = confirmPasswordTF.text else {
                print("Passwords text fields is nil")
                return false
        }
        
        if password == repeatedPassword {
            return true
        }
        //TODO: Alert password missmatch
        print("Password mismatch")
        return false
    }
}

//MARK: -UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    private func setTagsForTextFields() {
        emailTextField.tag = 0
        passwordTextField.tag = 1
        confirmPasswordTF.tag = 2
    }
    
    private func setDelegatesForTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            
            signUpButtonPressed()
            return false
        }
        
        return true
    }
}
