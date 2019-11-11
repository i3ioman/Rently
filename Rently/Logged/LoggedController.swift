//
//  LoggedController.swift
//  Rently
//
//  Created by Rafał Dycha on 11/11/2019.
//  Copyright © 2019 Rafał Dycha. All rights reserved.
//

import UIKit

class LoggedController: UIViewController {
    
    
    let gobackButton: UIButton = {
        let color = UIColor.rgb(r: 89, g: 156, b: 120)
        let font = UIFont.systemFont(ofSize: 16)
        
        let h = UIButton(type: .system)
            h.backgroundColor = MAIN_THEME
        
        let attributedTitle = NSMutableAttributedString(string:
            "Go ", attributes: [NSAttributedString.Key.foregroundColor: color,
                                                   NSAttributedString.Key.font: font ])
        
        attributedTitle.append(NSAttributedString(string: "back", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: font]))
        
        h.addTarget(self, action: #selector(signinAction), for: .touchUpInside)
        
        h.setAttributedTitle(attributedTitle, for: .normal)
        
        return h
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        setupGobackButton()
        
        navigationController?.isNavigationBarHidden = true
        
        
        // Dismiss keyboard by tapping on the storyboard
               let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
               view.addGestureRecognizer(tap)
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
    
    @objc func signinAction() {
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupGobackButton() {
        view.addSubview(gobackButton)
        
        gobackButton.anchors(top: nil, topPad: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 8,
                                    left: view.leftAnchor, leftPad: 0, right: view.rightAnchor,
                                    rightPad: 0, height: 30, width: 0)
    }
}
