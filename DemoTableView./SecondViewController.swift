//
//  SecondViewController.swift
//  DemoTableView.
//
//  Created by admin on 6/26/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageSecond: UIImageView!
    @IBOutlet weak var lbSecond1: UILabel!
    @IBOutlet weak var lbSecond2: UILabel!
    var lb1: String?
    var lb2: String?
    var Image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // hiển thi ên màn hình viewSecond.gán dữ liệu với các outlet.
        if lb1 != nil {
            lb1 = lbSecond1.text
        }
        if lb2 != nil {
            lb2 = lbSecond2.text
        }
        if Image != nil {
            imageSecond.image = Image
        }

    }
    

}
