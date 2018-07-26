//
//  ViewController.swift
//  iOS Week 3 Remote Assignment
//
//  Created by 張書涵 on 2018/7/22.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkLbl: UILabel!
    
    @IBOutlet weak var accountField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var checkField: UITextField!
    
    
    var segmentedSender:Int = 0
    
    func cleanField(){
        accountField.text = ""
        passwordField.text = ""
        checkField.text = ""
    }
    
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        segmentedSender = sender.selectedSegmentIndex
        print(segmentedSender)
        
        if sender.selectedSegmentIndex == 0 {
            checkLbl.textColor = UIColor(cgColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        checkField.isEnabled = false
        checkField.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))
        cleanField()
        

        }else{
            checkLbl.textColor = UIColor(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        checkField.isEnabled = true
            checkField.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            cleanField()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    enum accountError: Error {
        case accountEmpty
        case checkPasswordEmpty
        case passwordEmpty
        case signupFail
        case LoginFail
    }
    
    func showAlertWith(title:String,message:String,style:UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message:message, preferredStyle: style)
        //在傳到purchase去處理alert的字
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        present(alertController,animated: true,completion: nil)
        alertController.addAction(okAction)
    }

    @IBAction func button(_ sender: UIButton) {
      
        if accountField.text?.characters.count == 0 {
           showAlertWith(title: "Error", message: "Account not be empty.", style: .alert)
        }else if passwordField.text?.characters.count == 0  {
            showAlertWith(title: "Error", message: " Password should not be empty.", style: .alert)
        }else if checkField.text?.characters.count == 0  && segmentedSender == 1 {
            showAlertWith(title: "Error", message: "Check Password should not be empty.", style: .alert)
        }else if accountField.text == "alice@gmail.com" && passwordField.text == "1234" && segmentedSender == 0 {
            showAlertWith(title: "Success", message: "Hello Alice", style: .alert)
            cleanField()
        }else if segmentedSender == 0{
            showAlertWith(title: "Error", message: "Login fail", style: .alert)
            cleanField()
        }else if segmentedSender == 1{
            showAlertWith(title: "Error", message: "Signup fail", style: .alert)
            cleanField()
        }
        
    }
}
