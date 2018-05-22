//
//  TAG.swift
//  GHIndoorPosition
//
//  Created by MCLAB on 2018/4/2.
//  Copyright © 2018年 MCLAB. All rights reserved.
//
// JSON EXAMPLE :
//
//JSON: {
//    "SRV_COORD_NUM" : "0",
//    "LOC_TAG_NUM" : "2",
//    "SRV_TAG_NUM" : "0",
//    "LOC_ANCHOR_NUM" : "4",
//    "LOC_ANCHOR_INDEX_0" : "1,0,0,An047,An047,0032000000000047,0,1000,300,,,3.1.6",
//    "LOC_ANCHOR_INDEX_2" : "0,1,0,An050,An050,0032000000000050,0,0,300,,,3.1.6",
//    "LOC_TAG_INDEX_1" : "1,0,1,Tag049,Tag049,0210000000000049,612,661,36,0.0,0.0,1.1.6",
//    "LOC_COORD_NUM" : "1",
//    "LOC_ANCHOR_INDEX_1" : "3,0,0,An049,An049,0032000000000049,800,1000,300,,,3.1.6",
//    "LOC_ANCHOR_INDEX_3" : "2,0,0,An052,An052,0032000000000052,800,0,300,,,3.1.6",
//    "LOC_TAG_INDEX_0" : "0,0,1,Tag048,Tag048,0310000000000048,586,683,-1,3.6,32.1,3.1.6",
//    "SRV_ANCHOR_NUM" : "0",
//    "LOC_COORD_INDEX_0" : "0,5,2,Coord024,Coord024,3130000000000024,0,0,0,,,31.0.2"
//}

import Foundation

protocol TAG_STRING{
    
}
class TAG{
    
    private var TAG_NAME : String?
    private var TAG_GROUP : Int?
    private var TAG_PEOPLE_NAME : String?
    var loc_X : Int?
    var loc_Y : Int?
    var loc_Z : Int?
    
    func get_tag_location() -> (Int, Int, Int){
        return  (loc_X!, loc_Y!, loc_Z!)
    }
    
    func get_tag_name() -> (String){
        return TAG_NAME!
    }
    
}


