//
//  OnboardingViewController.swift
//  ClimaApp
//
//  Created by UNAM FCA 01 on 03/06/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonIniciar(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "sesion")
        let controller = storyboard?.instantiateViewController(identifier: "MainTabBar") as! UIViewController
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true)
    }
    

}
