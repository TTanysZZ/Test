//
//  SwiftDetailViewController.swift
//  Test
//
//  Created by zhajianjun on 2016/12/6.
//  Copyright © 2016年 TTanys. All rights reserved.
//

import UIKit

class SwiftDetailViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnClicked(_ sender: Any) {
        print("\((sender as! UIButton).currentTitle)")
        _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
