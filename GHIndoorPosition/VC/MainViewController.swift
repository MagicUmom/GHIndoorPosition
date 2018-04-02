//
//  ViewController.swift
//  GHIndoorPosition
//
//  Created by MCLAB on 2018/1/18.
//  Copyright © 2018年 MCLAB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {
    
    private var GetPostionTimer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.GetPostionTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(MainViewController.GetLocationCycle), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - GET LOCATION API CYCLE
    @objc func get_realtime_location(){
        Alamofire.request(REALTIME_API, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
            //            print("JSON:\(response.result.value)")
            switch(response.result) {
            case .success(_):
                
                let SwiftyJsonVar = JSON(response.result.value)
                print("JSON: \(SwiftyJsonVar)")

                if let tag_num = Int(SwiftyJsonVar["LOC_TAG_NUM"].string!){
                    for i in 0 ..< tag_num {
                        var tag_name = "LOC_TAG_INDEX_\(i)"
                        if let resData = SwiftyJsonVar[tag_name].string{
                            let resDataArr = resData.components(separatedBy: ",")
                            let location_X = resDataArr[6]
                            let location_Y = resDataArr[7]
                            let location_Z = resDataArr[8]
                            print("\(location_X)_\(location_Y)_\(location_Z) ")
                            self.drawLine(X: CGFloat((location_X as NSString).doubleValue),Y: CGFloat((location_Y as NSString).doubleValue))
                        }
                    }
                }
                
            case .failure(_):
                
                print("Error message:\(response.result.error)")
                break
                
            }
        }
    }
    
    @objc func GetLocationCycle(){
        
        Alamofire.request(REALTIME_API, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
//            print("JSON:\(response.result.value)")
            switch(response.result) {
            case .success(_):
                let SwiftyJsonVar = JSON(response.result.value)
                print("JSON: \(SwiftyJsonVar)")
                if let resData = SwiftyJsonVar["LOC_TAG_INDEX_0"].string{
//                    print(resData)
                    let resDataArr = resData.components(separatedBy: ",")
                    let location_X = resDataArr[6]
                    let location_Y = resDataArr[7]
                    let location_Z = resDataArr[8]
                    print("\(location_X)_\(location_Y)_\(location_Z) ")
                    self.drawLine(X: CGFloat((location_X as NSString).doubleValue),Y: CGFloat((location_Y as NSString).doubleValue))

                }
                
            case .failure(_):
                
                print("Error message:\(response.result.error)")
                break
                
            }
        }
        
    }
    
    func drawLine(X:CGFloat , Y:CGFloat){
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (X*414)/850 ,y: (487*Y)/1000 + 100 ), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath :"opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "MyAnimation")
        

    }

    @IBAction func btn_START(_ sender: Any) {
        if GetPostionTimer == nil{
            self.GetPostionTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(MainViewController.get_realtime_location), userInfo: nil, repeats: true)
        }
    }
    @IBAction func btn_STOP(_ sender: Any) {
        if GetPostionTimer != nil{
            GetPostionTimer!.invalidate()
            GetPostionTimer = nil
        }
    }
    @IBAction func btn_CLEAN(_ sender: Any) {
    }
}

