//
//  LoginViewController.swift
//  HappiHive
//
//  Created by think24 on 5/12/17.
//  Copyright © 2017 SSB Software solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate
{
    //MARK:- Variables
    //MARK:-- Outlet
    
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:-- Class
    
    //MARK:- View life cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setInitialUISetUp()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Button action
    @IBAction func loginButtonAction(_ sender: UIButton)
    {
        let userName = getTrimmedString(text: self.userNameTxtFld.text)
        let password = getTrimmedString(text: self.passwordTxtFld.text)
        if userName == "" || password == ""
        {
            showAlert(alertText : "Check your credentials and try again.")
        }
        else
        {
            self.checkLoginCredential(userName: userName, password: password)
        }
    }
    
    //MARK:- Text field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        if textField == self.userNameTxtFld
        {
            self.passwordTxtFld.becomeFirstResponder()
        }
        return true
    }
    
    //MARK:- Private function
    
    //MARK:-- UISetUp
    
    private func setInitialUISetUp()
    {
        
    }
    
    private func saveUserData(userData : [String : Any])
    {
        
    }
    
    //MARK:-- Service function
    
    private func checkLoginCredential(userName : String, password : String)
    {
        print(userName,password)
        
        showAlert(alertText : "User name " + userName + "  password " +  password )
    }
    
    func getTrimmedString(text : String?) -> String
    {
        if text != nil
        {
            return text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        return ""
    }
    
    private func showAlert(alertText : String)
    {
        let alert = UIAlertController(title: "Alert", message: alertText, preferredStyle: UIAlertControllerStyle.alert)
        let acceptButton = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
            
        })
        alert.addAction(acceptButton)
        self.present(alert, animated: true, completion: nil)
    }
}
