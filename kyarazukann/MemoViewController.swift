//
//  MemoViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/19.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  //  @IBOutlet var titleTextField: UITextField!
  //  @IBOutlet var table: UITableView!
    
//    var titleDeta: [String] = []
    var number:Int! = nil
    var saveDeta: UserDefaults = UserDefaults.standard
    var titleArray: Array = [String]()
    var array: [String] = []
     var storeArray: [[String]] = [[]]
   //  var titleDeta: [String] = []
    var argString = ""
        
    @IBOutlet var titleTextField: UITextField!
    
      @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //titlededaのtiindexpathを表示する
    // = saveDeta.object(forKey: "store") as! [String]
        //ここが分からないです分からないです↑
     //   storeArray[]
        titleTextField.text = argString
        array = storeArray[0]
     
    // print(titleDeta[number])
  //      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //       print(array[indexPath.row])
   //     }
     UserDefaults.standard.register(defaults:["array":array])
       
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    if saveDeta == nil {
                             
                      } else {
                          number = (saveDeta.object(forKey: "array") as! [String]).count
                        print(number)
                         }
        
        
        if number == nil {
            
        } else {
           
        //    titleDeta = saveDeta.object(forKey: "memo") as! [String]
         //   print(titleDeta[number])
         //   titleTextField.text = titleDeta[number]
              array = saveDeta.object(forKey: "array") as! [String]
              print(array[number-1])
              titleTextField.text = array[number-1]
          // print(array[number])
          //わからん
            
        }
        
        
        print(array)
        
        table.reloadData()
        
        
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
//        return titleArray.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
     //   cell?.textLabel?.text = String(titleArray[indexPath.row])
         cell?.textLabel?.text = String(array[indexPath.row])
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    
    
    
    
}

