//
//  SignupController.swift
//  Rently
//
//  Created by Rafał Dycha on 09/10/2019.
//  Copyright © 2019 Rafał Dycha. All rights reserved.
//

import UIKit

class SignupController: UIViewController {
    
    
    
    let emailTextField: UITextField = {
        let e = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "email address", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            e.textColor = .white
            e.attributedPlaceholder = attributedPlaceholder
            e.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "your password", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            p.textColor = .white
            p.attributedPlaceholder = attributedPlaceholder
            p.isSecureTextEntry = true
            p.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return p
    }()
    
    let passwordConfirmTextField: UITextField = {
        let p = UITextField()
        
        let attributedPlaceholder = NSAttributedString(string: "repeat password", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
            p.textColor = .white
            p.attributedPlaceholder = attributedPlaceholder
            p.isSecureTextEntry = true
            p.setBottomBorder(backgroundColor: MAIN_THEME, borderColor: .white)
        return p
    }()
    
    
    let confirmButton: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(.white, for: .normal)
            l.setTitle("Confirm", for: .normal)
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
              "Already have an account?  ", attributes: [NSAttributedString.Key.foregroundColor: color,
                                                     NSAttributedString.Key.font: font ])
          
          attributedTitle.append(NSAttributedString(string: "Sign In", attributes:
              [NSAttributedString.Key.foregroundColor: UIColor.white,
               NSAttributedString.Key.font: font]))
          
          h.addTarget(self, action: #selector(signinAction), for: .touchUpInside)
          
          h.setAttributedTitle(attributedTitle, for: .normal)
          
          return h
      }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MAIN_THEME
        
        navigationController?.isNavigationBarHidden = true
        
               
        setupTextFieldComponents()
        setupConfirmButton()
        setupHaveAccountButton()
        
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
            
            view.frame.origin.y = -keyboardRect.height
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
    

    
    
    fileprivate func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
        setupPasswordConfirmField()
    }
    
    fileprivate func setupEmailField() {
           view.addSubview(emailTextField)
        emailTextField.tag = 1
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
    
    fileprivate func setupPasswordConfirmField() {
        view.addSubview(passwordConfirmTextField)
        
        passwordConfirmTextField.anchors(top: passwordTextField.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0,
                                  left: passwordTextField.leftAnchor, leftPad: 0, right: passwordTextField.rightAnchor, rightPad: 0,
                                  height: 30, width: 0)
    }
    

    
    fileprivate func setupConfirmButton() {
        view.addSubview(confirmButton)
        
        confirmButton.anchors(top: passwordConfirmTextField.bottomAnchor, topPad: 12, bottom: nil, bottomPad: 0,
                            left: passwordTextField.leftAnchor, leftPad: 0, right: passwordConfirmTextField.rightAnchor, rightPad: 0,
                            height: 50, width: 0)
    }
    
    //Hide the navigtion bar on top
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
    
    @objc func signinAction() {
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupHaveAccountButton() {
        view.addSubview(haveAnAccountButton)
        
        haveAnAccountButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 8,
                                    left: view.leftAnchor, leftPad: 0, right: view.rightAnchor,
                                    rightPad: 0, height: 30, width: 0)
    }
    

    


}



