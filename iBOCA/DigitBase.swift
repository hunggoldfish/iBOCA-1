//
//  DigitBase.swift
//  iBOCA
//
//  Created by saman on 6/10/17.
//  Copyright © 2017 sunspot. All rights reserved.
//

import Foundation

import UIKit

class DigitBase: UIViewController {
    var base:DigitBaseClass? = nil  // Cannot do a subclass, so using composition

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    @IBOutlet weak var Button_4: UIButton!
    @IBOutlet weak var Button_5: UIButton!
    @IBOutlet weak var Button_6: UIButton!
    @IBOutlet weak var Button_7: UIButton!
    @IBOutlet weak var Button_8: UIButton!
    @IBOutlet weak var Button_9: UIButton!
    @IBOutlet weak var Button_0: UIButton!
    @IBOutlet weak var Button_done: UIButton!
    @IBOutlet weak var Button_delete: UIButton!
    
    var NumKeys:[UIButton] = []
    
    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var InfoLabel: UILabel!
    
    var value:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        base = DigitSpanForward()
        base!.base = self
        
        NumKeys.append(Button_1)
        NumKeys.append(Button_2)
        NumKeys.append(Button_3)
        NumKeys.append(Button_4)
        NumKeys.append(Button_5)
        NumKeys.append(Button_6)
        NumKeys.append(Button_7)
        NumKeys.append(Button_8)
        NumKeys.append(Button_9)
        NumKeys.append(Button_0)
        NumKeys.append(Button_done)
        NumKeys.append(Button_delete)
        
        value = ""
        InfoLabel.text = ""
        NumberLabel.text = value
        
        // let attributedString = NSMutableAttributedString(string: NumberLabel.text!)
        // attributedString.addAttribute(NSKernAttributeName, value: CGFloat(2.0), range: NSRange(location: 0, length: attributedString.length))
        // NumberLabel.attributedText = attributedString
        
        StartButton.isHidden = false
        ContinueButton.isHidden = true
        EndButton.isHidden = true
        BackButton.isHidden = false
        
        
        DoInitialize()
    }
    
    
    func enableKeypad() {
        for key in NumKeys {
            key.isHidden = false
            key.isEnabled = true
        }
    }
    
    func disableKeypad() {
        for key in NumKeys {
            key.isEnabled = false
        }
    }
    
    func hideKeypad() {
        for key in NumKeys {
            key.isEnabled = false
            key.isHidden = true
        }
    }
    
    
    @IBAction func KeyPadKeyPressed(_ sender: UIButton) {
        value = value + sender.currentTitle!
        NumberLabel.text = value
    }
    
    @IBAction func DoneKeyPressed(_ sender: UIButton) {
        DoEnterDone()
    }
    
    @IBAction func DeleteKeyPressed(_ sender: UIButton) {
        value = String(value.characters.dropLast())
        NumberLabel.text = value
    }
    
    
    @IBAction func StartPressed(_ sender: UIButton) {
        StartButton.isHidden = true
        ContinueButton.isHidden = true
        EndButton.isHidden = false
        BackButton.isHidden = true
        DoStart()
    }
 
    @IBAction func ContinuePressed(_ sender: UIButton) {
        DoContinue()
    }
    
    @IBAction func EndPressed(_ sender: UIButton) {
        StartButton.isHidden = false
        ContinueButton.isHidden = true
        EndButton.isHidden = true
        BackButton.isHidden = false
        DoEnd()

    }
    
    func DisplayStringShowContinue(val:String) {
        if val.characters.count == 0 {
            ContinueButton.isHidden = false
            InfoLabel.text = "Press Continue to Start Entering the Sequence"
        } else if self.BackButton.isHidden == true {
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
                print(val)
                let c = val.characters.first!
                self.value = self.value + String(describing: c)
                self.NumberLabel.text = self.value
                self.DisplayStringShowContinue(val: String(val.characters.dropFirst(1)))
            }
        }
    }
    
    
    func DoInitialize() {
        base!.DoInitialize()
    }
    
    func DoStart() {
        base!.DoStart()
    }
    
    func DoEnterDone() {
        base!.DoEnterDone()
    }
    
    func DoEnd() {
        base!.DoEnd()
    }
    
    func DoContinue() {
        base!.DoContinue()
    }
    
}


// A hacky superclass that implementations can subclass as subclassing DigitBase don't work (cannot  initialize supervlasses within the sotrybaord)
class DigitBaseClass {
    var base:DigitBase = DigitBase()
    
    func DoInitialize() {
    }
    
    func DoStart() {
    }
    
    func DoEnterDone() {
    }
    
    func DoEnd() {
    }
    
    func DoContinue() {
    }
}
