//
//  MemoSetViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/27.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class MemoSetViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var titleTextField: UITextField!
    
    
    //   var contentsArray: [String] = []
    var number:Int! = nil
    var saveDeta: UserDefaults = UserDefaults.standard
    var array: [String] = []
    var storeArray: [[String]] = [[]]
    //   var titleDeta: [String] = []
    
    var recievedrecievedContentNumber: Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = storeArray[recievedrecievedContentNumber - 1]
        //   UserDefaults.standard.register(defaults:["memo":contentsArray])
        UserDefaults.standard.register(defaults:["array":array])
        // Do any additional setup after loading the view.
    }
    //store
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if saveDeta == nil {
            
        } else {
            number = (saveDeta.object(forKey: "array") as! [String]).count
            print(number)
        }
        
        
        if number == nil {
            
        } else {
            
            //    contentsArray = saveDeta.object(forKey: "memo") as! [String]
            //    print(contentsArray)
            //   print(contentsArray[number-1])
            array = saveDeta.object(forKey: "array") as! [String]
            print(array)
            //     print(array[number-1])
            number = (saveDeta.object(forKey: "array") as! [String]).count
            print(number)
            
            //  titleTextField.text = contentsArray[number-1]
        }
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo() {
        
        
        
        
        //   print(contentsArray)
        //   contentsArray.append(titleTextField.text!)
        //   print(contentsArray)
        
        //   saveDeta.set(contentsArray, forKey: "memo")
        print(array)
        array.append(titleTextField.text!)
        print(array)
        
        storeArray[recievedrecievedContentNumber] = array
        
        saveDeta.set(array, forKey: "array")
        
        print(UserDefaults.standard.object(forKey: "store"))
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    
                    self.navigationController?.popViewController(animated: true)
            }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldReturn(_ textFiled: UITextField) -> Bool {
        textFiled.resignFirstResponder()
        return true
    }
    
  
    
    
    
    
}
