//
//  ViewController.swift
//  UserDefaultApp
//
//  Created by Yonatan Segura on 23/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let kMykey = "MyKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //RETRIEVE the preferences
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMykey){
            showAlert(message: value)
        }else{
            showAlert(message: "No value for this key")
        }
        
        
    }
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("An Example String", forKey: kMykey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Value saved")
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kMykey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Value deleted")
    }
    
    private func showAlert(message:String){
        let alert = UIAlertController(title: "User Defaults", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

