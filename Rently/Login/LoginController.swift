//
//  LoginController.swift
//  Rently
//
//  Created by Rafał Dycha on 08/10/2019.
//  Copyright © 2019 Rafał Dycha. All rights reserved.
//

import UIKit


class LoginController: UIViewController {
    
    
    let emailTextField: UITextField = {
        let e = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "email", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            e.textColor = .white
            e.attributedPlaceholder = attributedPlaceholder
            e.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "password", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            p.textColor = .white
            p.attributedPlaceholder = attributedPlaceholder
            p.isSecureTextEntry = true
            p.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return p
    }()
    
    
    
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(.white, for: .normal)
            l.setTitle("Log in", for: .normal)
            l.layer.cornerRadius = 10
        l.backgroundColor = UIColor.rgb(r: 89, g: 156, b: 120)
        return l
    }()
    
    
    
    let haveAnAccountButton: UIButton = {
        let color = UIColor.rgb(r: 89, g: 156, b: 120)
        let font = UIFont.systemFont(ofSize: 16)
        
        let h = UIButton(type: .system)
            h.backgroundColor = MAIN_THEME
        
        let attributedTitle = NSMutableAttributedString(string:
            "Don't have an account?  ", attributes: [NSAttributedString.Key.foregroundColor: color,
                                                   NSAttributedString.Key.font: font ])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: font]))
        
        h.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        
        h.setAttributedTitle(attributedTitle, for: .normal)
        
        return h
    }()
    
    
    
    let forgotPasswordButton: UIButton = {
           let f = UIButton(type: .system)
               f.setTitleColor(.white, for: .normal)
               f.setTitle("Forgot Password?", for: .normal)
        f.backgroundColor = MAIN_THEME
           return f
       }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = MAIN_THEME
        
        navigationController?.isNavigationBarHidden = true
        
        setupTextFieldComponents()
        setupLoginButton()
        setupForgotPasswordButton()
        setupHaveAnAccountButton()
        
        // Dismiss keyboard by tapping on the storyboard
               let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
               view.addGestureRecognizer(tap)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {       // Hide the navigation bar
        return .lightContent
    }
    
    @objc func signupAction() {
        print("LETS SIGN UP!")
        let signupcontroller = SignupController()
        navigationController?.pushViewController(signupcontroller, animated: true)
    }
    
    
    
    
    
    
    fileprivate func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
    }
    
    fileprivate func setupEmailField() {
        view.addSubview(emailTextField)
        
        emailTextField.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0,
                               left: view.leftAnchor, leftPad: 24, right: view.rightAnchor, rightPad: 24,
                               height: 30, width: 0)

        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func setupPasswordField() {
        view.addSubview(passwordTextField)
        
        passwordTextField.anchors(top: emailTextField.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0,
                                  left: emailTextField.leftAnchor, leftPad: 0, right: emailTextField.rightAnchor, rightPad: 0,
                                  height: 30, width: 0)
    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.anchors(top: passwordTextField.bottomAnchor, topPad: 12, bottom: nil, bottomPad: 0,
                            left: passwordTextField.leftAnchor, leftPad: 0, right: passwordTextField.rightAnchor, rightPad: 0,
                            height: 50, width: 0)
    }
    
    fileprivate func setupForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.anchors(top: loginButton.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0,
                                     left: loginButton.leftAnchor, leftPad: 0, right: loginButton.rightAnchor, rightPad: 0,
                                     height: 30, width: 0)
    }
    
    fileprivate func setupHaveAnAccountButton(){
        view.addSubview(haveAnAccountButton)
        
        haveAnAccountButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 8,
                                    left: view.leftAnchor, leftPad: 12, right: view.rightAnchor, rightPad: 12,
                                    height: 30, width: 0)
        
    }
    
    
    
    
}

