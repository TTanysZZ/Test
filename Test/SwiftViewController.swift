//
//  SwiftViewController.swift
//  Test
//
//  Created by zhajianjun on 2016/12/6.
//  Copyright © 2016年 TTanys. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!

    @IBOutlet weak var blueVeiw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "SWIFT"
        view.backgroundColor = UIColor.orange
        print("\(backBtn.frame)")
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapBlueView(_:)))
        blueVeiw.addGestureRecognizer(tap)
        
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        print("\(sender.currentTitle)")
        self.dismiss(animated: true, completion: nil)
    }
    
    func tapBlueView(_ tap:UITapGestureRecognizer) -> Void {
        print("tap did")
        let swiftDetailVc = SwiftDetailViewController()
        self.navigationController?.pushViewController(swiftDetailVc, animated: true)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let swiftDetailVc = SwiftDetailViewController()
//        self.navigationController?.pushViewController(swiftDetailVc, animated: true)
//    }
    
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
