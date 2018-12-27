//
//  ViewController.swift
//  Arts
//
//  Created by nurboldy on 12/23/18.
//  Copyright © 2018 nurboldy. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    
    let AccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Account"
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Email: " + Helper.getEmail()!
        return label
    }()
    let idLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Your Id: " + "\(Helper.getIdNumber()!)"
        return label
    }()
    
    let logoutButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Log Out", for: .normal)
        bt.backgroundColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1)
        bt.addTarget(self, action: #selector(logOutbuttonAction), for: .touchUpInside)
        return bt
    }()
    //unloggeed
    let registerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Register"
        return label
    }()
   
    let loginButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Login", for: .normal)
        bt.backgroundColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1)
        bt.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return bt
    }()
    
    let lineSep: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.gray
        return line
    }()
    let lineSep2: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.gray
        return line
    }()
    
    let dView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1).cgColor
        return view
    }()
    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1)
        return view
    }()
    
    let emailText: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.backgroundColor = UIColor.white
//        email.layer.cornerRadius = 15.0
//        email.layer.borderWidth = 2.0
//        email.layer.borderColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1).cgColor
        return email
    }()
    let passwordText: UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.backgroundColor = UIColor.white
        password.isSecureTextEntry = true
//        password.layer.cornerRadius = 15.0
//        password.layer.borderWidth = 0.5
//        password.layer.borderColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1).cgColor
        return password
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 188/255, blue: 212/255, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
        
        setupComponent()
       
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        guard let email = emailText.text, !email.isEmpty else {return}
        guard let password = passwordText.text, !password.isEmpty else {return}
        API.login(email: email, password: password, completion: {(error: Error?, success: Bool) in
            if success{
                print("LOL")
                self.viewDidLoad()
            }else{
                print("POOP")
            }
        })
    }
    
    
    @objc func logOutbuttonAction(sender: UIButton!) {
        Helper.deleteToken()
        Helper.deleteEmail()
        Helper.deleteIdNumber()
        self.viewDidLoad()
    }
    
    fileprivate func setupComponent() {
        if Helper.getToken() == nil {
            dviewComponent()
            comp()
            emailComponent()
            passwordComponent()
        } else {
            dviewComponent()
            logComp()
        }
        
    }
    
    fileprivate func logComp(){
        view.addSubview(AccountLabel)
        view.addSubview(emailLabel)
        view.addSubview(idLabel)
        view.addSubview(logoutButton)
        (AccountLabel).anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 22, paddingBottom: 0, paddingRight: 10, width: 0, height: 50, enableInsets: false)
        emailLabel.anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 130, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 28, enableInsets: false)
        idLabel.anchor(top: emailLabel.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 28, enableInsets: false)
        logoutButton.anchor(top: idLabel.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 80, paddingLeft: 140, paddingBottom: 0, paddingRight: 140, width: 0, height: 30, enableInsets: false)
    }
    
    fileprivate func dviewComponent() {
        view.addSubview(dView)
        view.addSubview(colorView)
        
        dView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 300, enableInsets: false)
        colorView.anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 50, enableInsets: false)
        
    }
    
    fileprivate func comp(){
        view.addSubview(registerLabel)
        view.addSubview(lineSep)
        view.addSubview(lineSep2)
        view.addSubview(loginButton)
        registerLabel.anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 22, paddingBottom: 0, paddingRight: 10, width: 0, height: 50, enableInsets: false)
        lineSep.anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 158, paddingLeft: 22, paddingBottom: 0, paddingRight: 22, width: 0, height: 1, enableInsets: false)
        lineSep2.anchor(top: lineSep.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 52, paddingLeft: 22, paddingBottom: 0, paddingRight: 22, width: 0, height: 1, enableInsets: false)
        loginButton.anchor(top: lineSep2.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 140, paddingBottom: 0, paddingRight: 140, width: 0, height: 30, enableInsets: false)
    }
    
    fileprivate func emailComponent() {
        view.addSubview(emailText)
        emailText.anchor(top: dView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 130, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 28, enableInsets: false)
    }
    
    fileprivate func passwordComponent() {
    view.addSubview(passwordText)
    passwordText.anchor(top: emailText.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 28, enableInsets: false)
    }
    

}

