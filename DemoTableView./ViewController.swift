//
//  ViewController.swift
//  DemoTableView.
//
//  Created by admin on 6/26/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var array1: [String] = ["AAAA","BBBB","CCCC","DDDD","EEEE","FFFF","GGGG","HHHH","AAAA","BBBB","CCCC","DDDD","EEEE","FFFF","GGGG","HHHH"]
    var array2: [String] = ["aaaa","bbbb","cccc","dddd","eeee","ffff","gggg","hhhh","aaaa","bbbb","cccc","dddd","eeee","ffff","gggg","hhhh"]
    var arrayImage: [String] = ["c1","c2","c3","c4","c5","c6","c7","c8","c1","c2","c3","c4","c5","c6","c7","c8"]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
//        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // trả về số lượng row trong một section.
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tái sử dụng cell để không gây nên load dữ liệu lại nhiều, đơc tốn bộ nhớ.
        
        // custom view cell, kiểu của cell là tableView nên cell sẽ lấy đ các giá trị trong tableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? TableViewCell
        // in lần lượt các giá trị lần lượt sử dụng indexPath.row, và hiển thị trên textLabel và detaiLabel.
        cell?.lbCell1.text = array1[indexPath.row]
        cell?.lbCell2.text = array2[indexPath.row]
        // lấy ảnh thông qua tên lần lượt của ảnh.
        cell?.imageCell?.image = UIImage(named: arrayImage[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let second = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            return
        }
        // gửi data khi dùng push, lấy lần lượt các data của view gán cho second.
        second.lb1 = array1[indexPath.row]
        second.lb2 = array2[indexPath.row]
        // gửi data bằng tên. ép nó về kiểu image.
        second.Image = UIImage(named: arrayImage[indexPath.row])
        navigationController?.pushViewController(second, animated: true)
    }
    
    // hàm dùng để xoá các giá trị của từng row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // khi bấm vào nút delete thì xoá các phần tử. lần lượt.
            array1.remove(at: indexPath.row)
            array2.remove(at: indexPath.row)
            arrayImage.remove(at: indexPath.row)
            // sau đó phải cập nhật dât lại.
            tableView.reloadData()
        }
    }
    
    // gọi hàm chỉnh sủa các cell trong tableView.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // xét độ trong suốt của cell.
        cell.alpha = 0
        // chuyển đổi trạng thái kéo của cell thành kiểu 3D.
        let transform = CATransform3DTranslate(CATransform3DIdentity, -50, 110, 20)
        // gán cell thay đổi thành kiểu 3d
        cell.layer.transform = transform
        // xét các hành động của UIView.
        UIView.animate(withDuration: 1.0 ) {
            // khi chạy hành động thì độ trong suốt của cell = 2
            cell.alpha = 2.0
            // cho cell vào phần hành động thay đổi của uiView.
            cell.layer.transform = CATransform3DIdentity
        }
    }


}

