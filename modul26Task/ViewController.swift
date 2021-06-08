//
//  ViewController.swift
//  modul26Task
//
//  Created by Жеребцов Данил on 23.05.2021.
//

import UIKit

class ViewController: UIViewController {


    
    var switchState = false
    let lightPicture = UIImage(named: "light")
    let darkPicture = UIImage(named: "dark")
    let check = "Check"
    
    let defaults = UserDefaults.standard
    
    
    let myImage: UIImageView = {
        let myImageView = UIImageView()
        myImageView.image = UIImage(named: "")
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    let myButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitle("Switch", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myImage)
        self.view.addSubview(myButton)
        addConstraints()
        switchState = defaults.bool(forKey: "state")
        setView()
    }
    
    
    private func addConstraints() {
        myImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        myButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myButton.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 50).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func buttonPressed() {
        switchState.toggle()
        setView()
        defaults.setValue(switchState, forKey: "state")
    }
    
    func setView() {
        if switchState {
            myImage.image = darkPicture
            view.backgroundColor = UIColor(named: "myCustomColor3")
            myButton.backgroundColor = UIColor(named: "myCustomColor")
            myButton.setTitleColor( UIColor(named: "myCustomColor2"), for: .normal)
        } else {
            myImage.image = lightPicture
            view.backgroundColor = .lightGray
            myButton.backgroundColor = UIColor(named: "myCustomColor4")
            myButton.setTitleColor( UIColor(named: "myCustomColor5"), for: .normal)
            
        }
    }
}

