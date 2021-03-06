//
//  ViewController.swift
//  Homework3_EP
//
//  Created by Eduardo Perez Cortes on 4/9/18.
//  Copyright © 2018 Eduardo Perez Cortes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fromNameLabel: UILabel!
    @IBOutlet var messageButtons: [UIButton]!
    @IBOutlet weak var stateLabel: UILabel!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bodyLabel.numberOfLines = 0
        configureNavigationBar()
        loadMessages()
        configureButtons()
        
        bottomConstraint.constant = -50
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func loadMessages(){
        messages = Message.defaultData
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let index = sender.tag - 1
        let message = messages[index]
        configureTopUI(message: message)
    }
    
    func configureTopUI(message: Message){
        
        fromNameLabel.text = message.fromName
        bodyLabel.text = message.body
        stateLabel.text = "State: \(message.state)"
        
    }
    
    
    private func configureButtons(){
        
        for i in 0..<messageButtons.count{
            let button = messageButtons[i]
            let index = button.tag - 1
            let message = messages[index]
            button.setTitle(message.fromName, for: .normal)
        }
    }
    
    func configureNavigationBar(){
        title = "Messages"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain,  target: self, action: #selector(refreshButtonPressed))
    self.navigationItem.leftBarButtonItem?.tintColor = UIColor .darkGray

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain,  target: self, action: #selector(editButtonPressed))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor .darkGray
        self.navigationItem.rightBarButtonItem?.isEnabled = false

    
    }
    
    @objc func refreshButtonPressed(){
        
    }
    
    @objc func editButtonPressed(){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Modify the constraint rather than the frame
        self.bottomConstraint.constant = 10
        UIView.animate(withDuration: 1.5, animations: {
            self.view.layoutIfNeeded()
        })
        
        
    }
    
}

