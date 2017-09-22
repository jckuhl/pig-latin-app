//
//  ViewController.swift
//  Pig Latin
//
//  Created by Jonathan Kuhl on 9/21/17.
//  Copyright © 2017 Jonathan Kuhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func submitInput() {
        
        do {
            if let pigLatinTranslator = try PigLatinTranslator(string: inputText.text) {
                    resultLabel.text = pigLatinTranslator.translate()
            }
        } catch PigLatinError.invalidString {
            // FIXME: Handle Errors
            resultLabel.text = "Please input a textual string"
        } catch {
            resultLabel.text = "Please input text only"
        }
        
        resultLabel.isHidden = false
    }

    @IBOutlet weak var resultLabel: TopAlignedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

