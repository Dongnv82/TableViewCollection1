//
//  ViewController.swift
//  TableViewCollection1
//
//  Created by Van Dong on 04/06/2019.
//  Copyright © 2019 VanDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var numberDataSource = NumberDataSource()
    var stringDataSource = StringDataSource()
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var switchData: UISwitch!
    @IBOutlet weak var headerView: HeaderView!
//    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = numberDataSource
        myTableView.isScrollEnabled = true
        myTableView.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view.
    }
    @IBAction func changeData(_ sender: UISwitch) {
        myTableView.dataSource = sender.isOn ? numberDataSource : stringDataSource
        myTableView.reloadData()
    }
    // custom remove cell
    @IBAction func removeCell(_ sender: Any) {
        if myTableView.isEditing {
            myTableView.setEditing(false, animated: true)
        } else {
            myTableView.setEditing(true, animated: true)
        }
    }
    
    // truyen du lieu can sua sang man 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let inputEdit = segue.destination as? ViewController1
        if let editIndexpath = myTableView.indexPathForSelectedRow {
            if switchData.isOn == true{
                inputEdit?.inputData = String(numberDataSource.array[editIndexpath.row])
            }else{
                inputEdit?.inputData = stringDataSource.array[editIndexpath.row]
            }
        }
    }
    @IBAction func unwindToViewController(segue:UIStoryboardSegue) {
        let dataIndexEdit = segue.source as? ViewController1
        //neu truong hop la edit:
        if let editIndex = myTableView.indexPathForSelectedRow{
            if switchData.isOn == true{
                numberDataSource.array[editIndex.row] = Int((dataIndexEdit?.inputData)!) ?? 0
            }else{
                stringDataSource.array[editIndex.row] = (dataIndexEdit?.inputData ?? "0")
            }
            myTableView.reloadData()
        }
            //neu truong hop la add:
        else{
            if switchData.isOn == true{
                numberDataSource.array.append(Int(dataIndexEdit!.inputData!)!)
            }else{
                stringDataSource.array.append(dataIndexEdit!.inputData!)
            }
            myTableView.reloadData()
        }
    }
    

}

class NumberDataSource: NSObject,UITableViewDataSource{
    
    var array = [Int](0...50)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // neu ko dung for: indexPath thi cell la dang optional khi do cau lenh phia sau se thay doi
        cell.textLabel?.text = String(array[indexPath.row])
        // cell?.textLabel?.text = String(array[indexPath.row])
        // neu number chia het cho 10 thi boi xanh cell
        if indexPath.row % 10 == 0{
            cell.contentView.backgroundColor = UIColor.blue
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: array[indexPath.row])
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        if array.count == 0 {
//            tableView.tableHeaderView = headerView
//            tableView.isScrollEnabled = false
//        }
    }

}
class StringDataSource: NSObject,UITableViewDataSource{
    var array = ["Dong","Cuong","Khanh","Vu","Luyen","Duc Anh"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        if array.count == 0 {
//            tableView.tableHeaderView = headerView
//            tableView.isScrollEnabled = false
//        }
    }
}
