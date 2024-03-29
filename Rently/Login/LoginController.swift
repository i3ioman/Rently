//
//  LoginController.swift
//  Rently
//
//  Created by Rafał Dycha on 08/10/2019.
//  Copyright © 2019 Rafał Dycha. All rights reserved.
//

import UIKit


class LoginController: UIViewController {
    
    let logoField: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RentlyLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.centerXAnchor.constraint(lessThanOrEqualTo: imageView.superview!.centerXAnchor).isActive = true
        return imageView
    }()
    
    
    
    let emailTextField: UITextField = {
        let e = UITextField()
        
        e.setRightPaddingPoints(10)
        
        let attributedPlaceholder = NSAttributedString(string: "  email", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
            e.tintColor = UIColor.white
            e.setIcon(UIImage(named: "mail")!)
            e.textColor = .white
            e.attributedPlaceholder = attributedPlaceholder
            e.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "  password", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            p.setIcon(UIImage(named: "lock")!)
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
        
        l.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
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
        
        // Listen for keyboard events
        
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // Dismiss keyboard by tapping on the storyboard
               let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
               view.addGestureRecognizer(tap)
    }
    
    deinit {
           // Stop listening for keyboard hide/show events
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

       }
       
       // Move the UI with the keyboard
       @objc func keyboardWillChange(notification: Notification) {
           guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
               return
           }
           if notification.name == UIResponder.keyboardWillShowNotification ||
               notification.name == UIResponder.keyboardWillChangeFrameNotification {
               
               view.frame.origin.y = -30
           } else {
               view.frame.origin.y = 0
           }
           
           
           
           
       }
       
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           let nextTag = textField.tag + 1
           // Try to find next responder
           let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?

           if nextResponder != nil {
               // Found next responder, so set it
               nextResponder?.becomeFirstResponder()
           } else {
               // Not found, so remove keyboard
               textField.resignFirstResponder()
           }

           return false
       }
       

    override var preferredStatusBarStyle: UIStatusBarStyle {       // Hide the navigation bar
        return .lightContent
    }
    
    @objc func loginAction() {
        print("Logged in")
        let loggedcontroller = LoggedController()
        navigationController?.pushViewController(loggedcontroller, animated: true)
    }
    
    @objc func signupAction() {
        print("LETS SIGN UP!")
        let signupcontroller = SignupController()
        navigationController?.pushViewController(signupcontroller, animated: true)
    }
    
    
    
    
    
    
    fileprivate func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
        setupLogoField()
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
    
    fileprivate func setupLogoField() {
        view.addSubview(logoField)
        
        logoField.anchors(top: nil, topPad: 0, bottom: emailTextField.topAnchor, bottomPad: 10, left: view.safeAreaLayoutGuide.leftAnchor, leftPad: 55, right: nil, rightPad: 0, height: 300, width: 300)
        
        
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

