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
    
    //   var titleDeta: [String] = []
    
    var recievedrecievedContentNumber: Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //   UserDefaults.standard.register(defaults:["memo":contentsArray])
        
        //UserDefaults.standard.register(defaults:["array":array])
        
        // Do any additional setup after loading the view.
    }
    //store
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(saveDeta.object(forKey: "store") as! [[String]])
        print(recievedrecievedContentNumber!)
        
        array = (saveDeta.object(forKey: "store") as! [[String]])[recievedrecievedContentNumber]
        
        
        if saveDeta == nil {
            
        } else {
            number = array.count
            print(number!)
        }
        
        
        if number == nil {
            
        } else {
            
            //    contentsArray = saveDeta.object(forKey: "memo") as! [String]
            //    print(contentsArray)
            //   print(contentsArray[number-1])
            print(array)
            //     print(array[number-1])
            //ナンジャこれ
            //number = (saveDeta.object(forKey: "array") as! [String]).count
            
            
            //  titleTextField.text = contentsArray[number-1]
        }
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo() {
        
        var storeArray = saveDeta.object(forKey: "store") as! [[String]]

        array.append(titleTextField.text!)
        
        
        storeArray[recievedrecievedContentNumber] = array
        
        saveDeta.set(storeArray, forKey: "store")
        
        
    //    print("このした。")
        print(array)
        
        print(saveDeta.object(forKey: "store") as! [[String]])
        
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
