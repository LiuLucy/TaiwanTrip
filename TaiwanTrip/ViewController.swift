//
//  ViewController.swift
//  TaiwanTrip
//
//  Created by Lucy on 2018/6/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var keelungPin: UIImageView!
    @IBOutlet weak var xinbeiPin: UIImageView!
    @IBOutlet weak var taipeiPin: UIImageView!
    @IBOutlet weak var taoyuanPin: UIImageView!
    @IBOutlet weak var hsinchuPin: UIImageView!
    @IBOutlet weak var miaoliPin: UIImageView!
    @IBOutlet weak var taichungPin: UIImageView!
    @IBOutlet weak var changhuaPin: UIImageView!
    @IBOutlet weak var nantouPin: UIImageView!
    @IBOutlet weak var yunlinPin: UIImageView!
    @IBOutlet weak var chiayiPin: UIImageView!
    @IBOutlet weak var tainanPin: UIImageView!
    @IBOutlet weak var kaohsiungPin: UIImageView!
    @IBOutlet weak var pingtungPin: UIImageView!
    @IBOutlet weak var taitungPin: UIImageView!
    @IBOutlet weak var hualienPin: UIImageView!
    @IBOutlet weak var yilanPin: UIImageView!
    @IBOutlet weak var lienchiangPin: UIImageView!
    @IBOutlet weak var kinmenPin: UIImageView!
    @IBOutlet weak var penghuPin: UIImageView!
    
    @IBOutlet weak var passBy: UIButton!
    @IBOutlet weak var naverBeeen: UIButton!
    @IBOutlet weak var lived: UIButton!
    var area = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    
    
    
    @IBOutlet weak var areaName: UILabel!
    
    @IBOutlet weak var areaImage: UIImageView!
    @IBOutlet var additemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    var effect:UIVisualEffect!
    var isClick:Bool = false
    var areaId:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 單指輕點
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        additemView.layer.cornerRadius = 5
        
        
        
        let singleFinger = UITapGestureRecognizer(
            target:self,
            action:#selector(ViewController.singleTap))
        
        // 點幾下才觸發 設置 2 時 則是要點兩下才會觸發 依此類推
        singleFinger.numberOfTapsRequired = 1
        
        // 幾根指頭觸發
        singleFinger.numberOfTouchesRequired = 1
        
        // 為視圖加入監聽手勢
        self.view.addGestureRecognizer(singleFinger)
    }
    
    //打開view
    func animateIn(areaImage:UIImage,areaName:String,areaId:Int) {
        self.view.addSubview(additemView)
        additemView.center = self.view.center
        additemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        additemView.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.visualEffectView.effect = self.effect
            self.additemView.alpha = 1
            self.additemView.transform = CGAffineTransform.identity
        }
        self.areaImage.image = areaImage
        self.areaName.text = areaName
        self.areaId = areaId

        if(area[areaId] == 0){
            passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        }
        else if(area[areaId] == 1) {
            passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            naverBeeen.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
            lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        }
        else if(area[areaId] == 2) {
            passBy.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
            naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        }
        else if(area[areaId] == 3) {
            passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
            lived.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
        }

        
        
        
        
        isClick = true
    }

    //關閉view
    func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.additemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.additemView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.additemView.removeFromSuperview()
        }
        isClick = false
        inputPin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 觸發單指輕點兩下手勢後 執行的動作
    @objc func singleTap(recognizer:UITapGestureRecognizer){
        print("單指連點一下時觸發")
        
        // 取得每指的位置
        self.findFingersPositon(recognizer: recognizer)
    }

    
    func findFingersPositon(recognizer:UITapGestureRecognizer) {
        // 取得每指的位置
       
        let number = recognizer.numberOfTouches
        for i in 0..<number {
            let point = recognizer.location(
                ofTouch: i, in: recognizer.view)
            if(!isClick) {
                print("第 \(i + 1) 指的位置：\(point)")
                if(point.x >= CGFloat(262.5) && point.x <= CGFloat(279.5) && point.y >= CGFloat(98.5) && point.y <= CGFloat(122.5)){
                    print("基隆")
                    animateIn(areaImage: #imageLiteral(resourceName: "基隆"),areaName:"基隆縣", areaId: 1)
                   

                }
                    
                else if(point.x >= CGFloat(244.5) && point.x <= CGFloat(259.0) && point.y >= CGFloat(100.0) && point.y <= CGFloat(132.5)) {
                    print("台北")
                    animateIn(areaImage: #imageLiteral(resourceName: "台北"),areaName:"台北市", areaId:2)
                    
                }
                    
                else if(point.x >= CGFloat(234.5) && point.x <= CGFloat(263.5) && point.y >= CGFloat(134.5) && point.y <= CGFloat(152.0) || point.x >= CGFloat(258.5) && point.x <= CGFloat(285.5) && point.y >= CGFloat(125.0) && point.y <= CGFloat(140.5)) {
                    print("新北")
                    animateIn(areaImage: #imageLiteral(resourceName: "新北市"),areaName:"新北市", areaId:3)
                   
                    
                }
                else if(point.x >= CGFloat(187.0) && point.x <= CGFloat(223.0) && point.y >= CGFloat(113.5) && point.y <= CGFloat(132.5) || point.x >= CGFloat(208.0) && point.x <= CGFloat(221.5) && point.y >= CGFloat(134.5) && point.y <= CGFloat(151.0) || point.x >= CGFloat(225.5) && point.x <= CGFloat(235.5) && point.y >= CGFloat(151.5) && point.y <= CGFloat(169.5)) {
                    print("桃園")
                    animateIn(areaImage: #imageLiteral(resourceName: "桃園縣"),areaName:"桃園縣", areaId:4)
                  
                }
                    //                新竹縣 ，新竹市再說
                else if(point.x >= CGFloat(174.5) && point.x <= CGFloat(209.0) && point.y >= CGFloat(146.0) && point.y <= CGFloat(167.0) || point.x >= CGFloat(195.5) && point.x <= CGFloat(223.0) && point.y >= CGFloat(161.5) && point.y <= CGFloat(184.5)) {
                    print("新竹")
                    animateIn(areaImage:#imageLiteral(resourceName: "新竹縣"),areaName:"新竹縣", areaId:5)
                    
                }
                    
                else if(point.x >= CGFloat(147.5) && point.x <= CGFloat(185.5) && point.y >= CGFloat(167.5) && point.y <= CGFloat(207.0) || point.x >= CGFloat(180.5) && point.x <= CGFloat(210.0) && point.y >= CGFloat(189.0) && point.y <= CGFloat(201.5)) {
                    print("苗栗")
                    animateIn(areaImage: #imageLiteral(resourceName: "苗栗縣"),areaName:"苗栗縣", areaId:6)
                   
                }
                    
                else if(point.x >= CGFloat(128.0) && point.x <= CGFloat(163.0) && point.y >= CGFloat(208.0) && point.y <= CGFloat(239.0) || point.x >= CGFloat(176.0) && point.x <= CGFloat(201.5) && point.y >= CGFloat(214.0) && point.y <= CGFloat(226.0)) {
                    print("台中")
                    animateIn(areaImage: #imageLiteral(resourceName: "台中市"),areaName:"台中市", areaId:7)
                    
                }
                    
                else if(point.x >= CGFloat(102.5) && point.x <= CGFloat(139.0) && point.y >= CGFloat(239.5) && point.y <= CGFloat(263.5)) {
                    print("彰化")
                    animateIn(areaImage: #imageLiteral(resourceName: "彰化縣"),areaName:"彰化縣", areaId:8)
                    
                }
                    
                else if(point.x >= CGFloat(156.5) && point.x <= CGFloat(206.0) && point.y >= CGFloat(236.5) && point.y <= CGFloat(287.0)) {
                    print("南投")
                    animateIn(areaImage:#imageLiteral(resourceName: "南投縣"),areaName:"南投縣", areaId:9)
                    
                }
                    
                else if(point.x >= CGFloat(90.0) && point.x <= CGFloat(122.5) && point.y >= CGFloat(269.0) && point.y <= CGFloat(290.0) || point.x >= CGFloat(126.0) && point.x <= CGFloat(147.5) && point.y >= CGFloat(273.0) && point.y <= CGFloat(292.5)) {
                    print("雲林")
                    animateIn(areaImage:#imageLiteral(resourceName: "雲林縣"),areaName:"雲林縣", areaId:10)
                    
                }
                    
                else if(point.x >= CGFloat(119.0) && point.x <= CGFloat(171.0) && point.y >= CGFloat(295.5) && point.y <= CGFloat(317.0) || point.x >= CGFloat(88.5) && point.x <= CGFloat(111.0) && point.y >= CGFloat(301.0) && point.y <= CGFloat(317.0)) {
                    print("嘉義")
                    animateIn(areaImage:#imageLiteral(resourceName: "嘉義縣"),areaName:"嘉義縣", areaId:11)
                    
                }
                    
                else if(point.x >= CGFloat(76.0) && point.x <= CGFloat(128.0) && point.y >= CGFloat(330.5) && point.y <= CGFloat(371.5) || point.x >= CGFloat(105.0) && point.x <= CGFloat(120.5) && point.y >= CGFloat(323.0) && point.y <= CGFloat(335.0)) {
                    print("台南")
                    animateIn(areaImage: #imageLiteral(resourceName: "台南市"),areaName:"台南市", areaId: 12)
                   
                }
                    
                else if(point.x >= CGFloat(97.0) && point.x <= CGFloat(121.0) && point.y >= CGFloat(378.5) && point.y <= CGFloat(411.5) || point.x >= CGFloat(135.0) && point.x <= CGFloat(164.0) && point.y >= CGFloat(352.5) && point.y <= CGFloat(368.5) || point.x >= CGFloat(161.0) && point.x <= CGFloat(169.5) && point.y >= CGFloat(327.5) && point.y <= CGFloat(340.5)) {
                    print("高雄")
                    animateIn(areaImage: #imageLiteral(resourceName: "高雄市"),areaName:"高雄市", areaId: 13)
                    
                }
                    
                else if(point.x >= CGFloat(125.0) && point.x <= CGFloat(150.5) && point.y >= CGFloat(392.5) && point.y <= CGFloat(435.5) || point.x >= CGFloat(149.5) && point.x <= CGFloat(173.5) && point.y >= CGFloat(448.5) && point.y <= CGFloat(486.5) || point.x >= CGFloat(144.0) && point.x <= CGFloat(156.5) && point.y >= CGFloat(436.5) && point.y <= CGFloat(451.5)) {
                    print("屏東")
                    animateIn(areaImage: #imageLiteral(resourceName: "屏東縣"),areaName:"屏東縣", areaId: 14)
                    
                }
                    
                else if(point.x >= CGFloat(174.5) && point.x <= CGFloat(205.5) && point.y >= CGFloat(373.5) && point.y <= CGFloat(398.0) || point.x >= CGFloat(177.5) && point.x <= CGFloat(219.5) && point.y >= CGFloat(352.0) && point.y <= CGFloat(383.5) || point.x >= CGFloat(177.5) && point.x <= CGFloat(194.5) && point.y >= CGFloat(336.5) && point.y <= CGFloat(357.0) || point.x >= CGFloat(159.5) && point.x <= CGFloat(182.0) && point.y >= CGFloat(401.0) && point.y <= CGFloat(445.0)) {
                    print("台東")
                    animateIn(areaImage: #imageLiteral(resourceName: "台東縣"),areaName:"台東縣", areaId: 15)
                    
                }
                    
                else if(point.x >= CGFloat(223.0) && point.x <= CGFloat(252.0) && point.y >= CGFloat(209.0) && point.y <= CGFloat(297.5) || point.x >= CGFloat(194.0) && point.x <= CGFloat(229.5) && point.y >= CGFloat(305.5) && point.y <= CGFloat(332.5) || point.x >= CGFloat(235.5) && point.x <= CGFloat(264.0) && point.y >= CGFloat(212.0) && point.y <= CGFloat(224.5)) {
                    print("花蓮")
                    animateIn(areaImage: #imageLiteral(resourceName: "花蓮縣"),areaName:"花蓮縣", areaId: 16)
                    
                }
                    
                else if(point.x >= CGFloat(237.5) && point.x <= CGFloat(286.5) && point.y >= CGFloat(167.0) && point.y <= CGFloat(204.5) || point.x >= CGFloat(262.0) && point.x <= CGFloat(281.5) && point.y >= CGFloat(153.5) && point.y <= CGFloat(170.0) || point.x >= CGFloat(235.5) && point.x <= CGFloat(264.0) && point.y >= CGFloat(212.0) && point.y <= CGFloat(224.5)) {
                    print("宜蘭")
                    animateIn(areaImage:#imageLiteral(resourceName: "宜蘭縣"),areaName:"宜蘭縣", areaId: 17)
                    
                }
                    //            離島
                else if(point.x >= CGFloat(30.0) && point.x <= CGFloat(79.5) && point.y >= CGFloat(114.5) && point.y <= CGFloat(146.5)) {
                    print("連江")
                    animateIn(areaImage: #imageLiteral(resourceName: "連江縣"),areaName:"連江縣", areaId: 18)
                    
                }
                    
                else if(point.x >= CGFloat(6.0) && point.x <= CGFloat(52.0) && point.y >=
                    CGFloat(159.5) && point.y <= CGFloat(191.0)) {
                    print("金門")
                    animateIn(areaImage: #imageLiteral(resourceName: "金門縣"),areaName:"金門縣", areaId: 19)
                    
                }
                    
                else if(point.x >= CGFloat(10.0) && point.x <= CGFloat(57.5) && point.y >=
                    CGFloat(261.0) && point.y <= CGFloat(338.5)) {
                    print("澎湖")
                    animateIn(areaImage: #imageLiteral(resourceName: "澎湖縣"),areaName:"澎湖縣", areaId: 20)
                    
                }
                
            }
            
            
            
        }
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        animateOut ()
    }
    
    @IBAction func neverBeen(_ sender: Any) {
        area[areaId] = 1
        passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        naverBeeen.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
        lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        
       
    }
    
    @IBAction func passBy(_ sender: Any) {
        area[areaId] = 2
        passBy.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
        naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
    }
    
    @IBAction func lived(_ sender: Any) {
        area[areaId] = 3
        passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        lived.setImage(#imageLiteral(resourceName: "Checked"), for: UIControlState.normal)
        
        
    }
    
    func inputPin() {
        if(area[1] == 0){
            keelungPin.image = nil
        }
        else if(area[1] == 1) {
            keelungPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[1] == 2) {
            keelungPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[1] == 3) {
            keelungPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[2] == 0){
            taipeiPin.image = nil
        }
        else if(area[2] == 1) {
            taipeiPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[2] == 2) {
            taipeiPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[2] == 3) {
            taipeiPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[3] == 0){
            xinbeiPin.image = nil
        }
        else if(area[3] == 1) {
            xinbeiPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[3] == 2) {
            xinbeiPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[3] == 3) {
            xinbeiPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[4] == 0){
            taoyuanPin.image = nil
        }
        else if(area[4] == 1) {
            taoyuanPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[4] == 2) {
            taoyuanPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[4] == 3) {
            taoyuanPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[5] == 0){
            hsinchuPin.image = nil
        }
        else if(area[5] == 1) {
            hsinchuPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[5] == 2) {
            hsinchuPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[5] == 3) {
            hsinchuPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[6] == 0){
            miaoliPin.image = nil
        }
        else if(area[6] == 1) {
            miaoliPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[6] == 2) {
            miaoliPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[6] == 3) {
            miaoliPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[7] == 0){
            taichungPin.image = nil
        }
        else if(area[7] == 1) {
            taichungPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[7] == 2) {
            taichungPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[7] == 3) {
            taichungPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[8] == 0){
            changhuaPin.image = nil
        }
        else if(area[8] == 1) {
            changhuaPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[8] == 2) {
            changhuaPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[8] == 3) {
            changhuaPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[9] == 0){
            nantouPin.image = nil
        }
        else if(area[9] == 1) {
            nantouPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[9] == 2) {
            nantouPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[9] == 3) {
            nantouPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[10] == 0){
            yunlinPin.image = nil
        }
        else if(area[10] == 1) {
            yunlinPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[10] == 2) {
            yunlinPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[10] == 3) {
            yunlinPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[11] == 0){
            chiayiPin.image = nil
        }
        else if(area[11] == 1) {
            chiayiPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[11] == 2) {
            chiayiPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[11] == 3) {
            chiayiPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[12] == 0){
            tainanPin.image = nil
        }
        else if(area[12] == 1) {
            tainanPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[12] == 2) {
            tainanPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[12] == 3) {
            tainanPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[13] == 0){
            kaohsiungPin.image = nil
        }
        else if(area[13] == 1) {
            kaohsiungPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[13] == 2) {
            kaohsiungPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[13] == 3) {
            kaohsiungPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[14] == 0){
            pingtungPin.image = nil
        }
        else if(area[14] == 1) {
            pingtungPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[14] == 2) {
            pingtungPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[14] == 3) {
            pingtungPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[15] == 0){
            taitungPin.image = nil
        }
        else if(area[15] == 1) {
            taitungPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[15] == 2) {
            taitungPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[15] == 3) {
            taitungPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[16] == 0){
            hualienPin.image = nil
        }
        else if(area[16] == 1) {
            hualienPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[16] == 2) {
            hualienPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[16] == 3) {
            hualienPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[17] == 0){
            yilanPin.image = nil
        }
        else if(area[17] == 1) {
            yilanPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[17] == 2) {
            yilanPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[17] == 3) {
            yilanPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[18] == 0){
            lienchiangPin.image = nil
        }
        else if(area[18] == 1) {
            lienchiangPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[18] == 2) {
            lienchiangPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[18] == 3) {
            lienchiangPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[19] == 0){
            kinmenPin.image = nil
        }
        else if(area[19] == 1) {
            kinmenPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[19] == 2) {
            kinmenPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[19] == 3) {
            kinmenPin.image = #imageLiteral(resourceName: "level3")
        }
        
        if(area[20] == 0){
            penghuPin.image = nil
        }
        else if(area[20] == 1) {
            penghuPin.image = #imageLiteral(resourceName: "level1")
        }
        else if(area[20] == 2) {
            penghuPin.image = #imageLiteral(resourceName: "level2")
        }
        else if(area[20] == 3) {
            penghuPin.image = #imageLiteral(resourceName: "level3")
        }
        
    }
   
    
    @IBAction func clearPin(_ sender: Any) {
        area[areaId] = 0
        passBy.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        naverBeeen.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
        lived.setImage(#imageLiteral(resourceName: "UnChecked"), for: UIControlState.normal)
    }
}


