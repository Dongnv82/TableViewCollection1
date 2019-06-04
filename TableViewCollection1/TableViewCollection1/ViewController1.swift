//
//  ViewController1.swift
//  TableViewCollection1
//
//  Created by Van Dong on 04/06/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var inputData: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if inputData != nil{
            textField.text = inputData
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        inputData = textField.text
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
