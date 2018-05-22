//
//  SettingViewController.swift
//  GHIndoorPosition
//
//  Created by MCLAB on 2018/5/22.
//  Copyright © 2018年 MCLAB. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TF_api: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set background
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        TF_api.borderStyle = .roundedRect
        TF_api.returnKeyType = .done
        TF_api.textColor = UIColor.black
        TF_api.backgroundColor = UIColor.lightGray
        TF_api.delegate = self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        USER_API = TF_api.text!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true

    }
}
