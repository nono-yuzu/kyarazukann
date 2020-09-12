//
//  KarazukannViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/04.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class KyarazukannViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
//    var saveData: UserDefaults = UserDefaults.standard
    var number: Int! = nil

    var titleDeta: [String] = []
    var saveDeta: UserDefaults = UserDefaults.standard
    var contentNumber: Int!
    var removenumber: Int!
    var storeArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.register(defaults: ["title":titleDeta])
          UserDefaults.standard.register(defaults: ["store":storeArray])
       // userDefaults.register(defaults: ["title": titleDeta]
      // ここをどーにかする!
   
       
        // Do any additional setup after loading the view.
     //   titleDeta = saveDeta.object(forKey: "title") as! [String]
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
    }
    
  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
    if saveDeta == nil {
                      
               } else {
                   number = (saveDeta.object(forKey: "title") as! [String]).count
                
                  }


        if number == nil {
            
        } else {
            titleDeta = saveDeta.object(forKey: "title") as! [String]
            storeArray = saveDeta.object(forKey: "store") as! [[String]]
                      
        
        }
        
    table.reloadData()
    }
 
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        return titleDeta.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = String(titleDeta[indexPath.row])
        
        return cell!
        
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

//        cell.textLabel!.text = titleDeta[indexPath.row]
//        return cell
//    }
//    ikerukamo
//   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //  titleDeta.remove(at: indexPath.row)
//    self.titleDeta.remove(at: indexPath.row)
  
//    UserDefaults.standard.set(titleDeta, forKey: "title" )
//    UserDefaults.standard.set(storeArray, forKey: "store" )
//       tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//   }
    
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //  number = indexPath.row
    //    print(titleDeta[indexPath.row])
     //   tableView.deselectRow(at: indexPath, animated: true)
        contentNumber = indexPath.row
        performSegue(withIdentifier: "MemoViewController", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "MemoViewController"{
                let VC = segue.destination as! MemoViewController
    
                VC.recievedContentNumber = self.contentNumber
            }
        }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
       {
           return true
       }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contentNumber = indexPath.row
        print(contentNumber!)
        print(storeArray)
     //   print(titleDeta)
        self.titleDeta.remove(at: indexPath.row)
        
         self.storeArray.remove(at: contentNumber!)
        UserDefaults.standard.set(titleDeta, forKey: "title" )
        UserDefaults.standard.set(storeArray, forKey: "store" )
           tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        table.reloadData()
       }
    // ①セグエ実行前処理
  //     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           // ②Segueの識別子確認
  //         if segue.identifier == "toView2" {
    
               // ③遷移先ViewCntrollerの取得
   //            let nextView = segue.destination as! MemoViewController
    
               // ④値の設定
  //             nextView.argString = table.text!
   //       }
    //   }
    
   
   
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //        performSegue(withIdentifier: "toMemo", sender: indexPath.row)
    //    }
    //
       
    //
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
