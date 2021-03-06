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
    
    
    
    var number: Int! = nil
    
    var titleDeta: [String] = []
    var saveDeta: UserDefaults = UserDefaults.standard
    var contentNumber: Int!
    var removenumber: Int!
    var storeArray = [[String]]()
    var ifArray = [Bool]()
    
    var favoriteFlag = false
    
    //   var button: Int!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UserDefaults.standard.register(defaults: ["title":titleDeta])
        UserDefaults.standard.register(defaults: ["store":storeArray])
        UserDefaults.standard.register(defaults: ["if":ifArray])
        
        let image = UIImage(named: "スクリーンショット 2020-08-15 9.42.48.png")
        let imageView = UIImageView(frame: CGRect(x:0 , y:0,  width: table.frame.width, height: table.frame.width))
        imageView.image = image
        self.table.backgroundView = imageView
        
        print(table.backgroundView!)
        print(imageView.image!)
        
        
        
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
        table.backgroundView = nil
        
        table.separatorColor = .brown
        
        self.navigationController?.navigationBar.tintColor = .brown
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            
            .foregroundColor: UIColor.brown
            
            
        ]
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? KyarazukannCell
        
        cell?.backgroundColor? = UIColor.clear
        
        cell?.textLabel?.text = String(titleDeta[indexPath.row])
        cell?.textLabel?.backgroundColor = UIColor.clear
        
        cell?.setImage(favorite: ifArray[indexPath.row])
        
        //        cell.button.addTarget(self, action: #selector(tapCellButton(_:)), for: .touchUpInside)
        //               //タグを設定
        //               cell.button.tag = indexPath.row
        //
        return cell!
        
    }
//    @IBAction func tapAddButton(sender: AnyObject) {
//        // タップされたボタンのtableviewの選択行を取得
//        var btn = sender as! UIButton
//        var cell = btn.superview?.superview as! UITableViewCell
//        var row = tableView.indexPathForCell(cell)?.row
//
//        // 行数を表示
//        println("\(row)");
//    }
    
    
    
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
            //   let VC = segue.destination as! KyarazukannCell
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
    
    @IBAction func favoriteButton(_ sender: Any) {
//        var image = UIImage()
    //    UserDefaults.standard.register(defaults: ["if":ifArray])
        // タップされたボタンのtableviewの選択行を取得
        let btn = sender as! UIButton
        let cell = btn.superview?.superview as! KyarazukannCell
        let row = table.indexPath(for: cell)?.row
        
        // 行数を表示
        print("\(row!)")
        
        ifArray[row!] = !ifArray[row!]
        saveDeta.set(ifArray,forKey: "if")
        cell.setImage(favorite: ifArray[row!])
//        favoriteFlag = !favoriteFlag
    }
    
    
    
    //  extension UIButton {
    
    //      func switchAction(onAction: @escaping ()->Void, offAction: @escaping ()->Void) {
    
    //選択状態を反転
    //         self.isSelected = !self.isSelected
    
    //          switch self.isSelected {
    //          case true:
    //ONにする時に走らせたい処理
    //             onAction()
    //         case false:
    //OFFにする時に走らせたい処理
    //             offAction()
    //         }
    
    //    }
    // }
    
    
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
