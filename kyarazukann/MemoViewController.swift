//
//  MemoViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/19.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titleDeta: [String] = []
    //   var number:Int! = nil
    var number = Int()
    var saveDeta: UserDefaults = UserDefaults.standard
    var titleArray: Array = [String]()
    var array: [String] = []
    var storeArray: [[String]] = [[]]
    var recievedContentNumber: Int!
    
    
    
    @IBOutlet var titleTextField: UITextField!
    
    //    titleTextField.text = recievedContentNumber
    

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UserDefaults.standard.register(defaults:["array":array])
       // UserDefaults.standard.register(defaults:["store":storeArray])
        table.separatorColor = .brown
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("このした")
         print(saveDeta.object(forKey: "store") as! [[String]])
        
        if (saveDeta.object(forKey: "store") as! [[String]])[recievedContentNumber!] == nil {
            
        } else {
            number = (saveDeta.object(forKey: "array") as! [String]).count
            
            print("このしたにnumber")
            print(number)
            
        }
        
        if number == nil {
            
        } else {
            
            titleDeta = saveDeta.object(forKey: "title") as! [String]
            titleTextField.text = titleDeta[recievedContentNumber]
            //            print(titleDeta[recievedContentNumber])
            array = (saveDeta.object(forKey: "store") as! [[String]])[recievedContentNumber]
        }
        
        table.reloadData()
    }
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
    //        return titleArray.count
    //    }
    @IBAction func memo() {
        
        
        //上書きのコードを書く！！！！！
        //    titleDeta = saveDeta.object(forKey: "title") as! [String]
        titleDeta[recievedContentNumber] = titleTextField.text!
        saveDeta.set(titleDeta, forKey: "title")
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //   cell?.textLabel?.text = String(titleArray[indexPath.row])
        cell?.textLabel?.text = String(array[indexPath.row])
        return cell!
        
    }
    
    //     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //            self.MemoVC.detailText = self.storeArray[indexPath.row]
    //           self.tableView.deselectRow(at: indexPath, animated: true)
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
//        // 別の画面に遷移
//        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    
    @IBAction func append() {
        performSegue(withIdentifier: "MemoSetViewController", sender: nil)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(recievedContentNumber!)
         var storeArray = saveDeta.object(forKey: "store") as! [[String]]
        
        //配列の配列
        //array = (saveDeta.object(forKey: "store") as! [[String]])[recievedContentNumber]
    //    array = storeArray[recievedContentNumber]
        self.array.remove(at: indexPath.row)
        print("消した直後")
        print(array)
        //  (saveDeta.object(forKey: "store") as! [[String]])[recievedContentNumber] = array
       // storeArray[[]]
        storeArray[recievedContentNumber] = array
        UserDefaults.standard.set(storeArray, forKey: "store")
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        print(array)
        
        table.reloadData()
        print("最終的な状態。")
        print(array)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoSetViewController"{
            let VC = segue.destination as! MemoSetViewController
            
            VC.recievedrecievedContentNumber = self.recievedContentNumber
        }
    }
    
    
}

