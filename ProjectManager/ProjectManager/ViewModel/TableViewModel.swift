//
//  TableViewModel.swift
//  ProjectManager
//
//  Created by 강경 on 2021/06/29.
//

import UIKit

class TableViewModel {
    private var list: [TableItem] = dummy
    
    var numOfList: Int {
        return list.count
    }
    
    func itemInfo(at index: Int) -> TableItem {
        return list[index]
    }
    
    func update(model: [TableItem]) {
        list = model
    }
}

// MARK: - test전용 Dummy
var dummy = [
    TableItem(
        title: "제목이 긴 경우 -> ㅣ무로ㅓㄴ돋림도나롬다노라ㅓㅁㄴ도리모다ㅕㄹㅎ모낟",
        summary: "이런저런 내용이 있습니다.",
        date: 1624958921
    ),
    TableItem(
        title: "내용이 3줄이 넘어가는 경우",
        summary: "ㄴ마ㅓㄹ;ㅁ너럳님러ㅣ낟멀;ㄷㄴㅁ마러ㅣㅏㅈ덣미도리ㅑㅁㄷㅈㅈㄷ먀럳짐러미노리ㅑㅁ도랴ㅣ머디럳지ㅑㅗㅁㄹ미ㅑㄴㄷ리ㅑㅁ녿랴ㅣ몯랴ㅣㄷㄴㅁㄴㅇ라ㅓㅣㅁ넝리ㅏㅁㄴ오리ㅗㄴ미ㅏ론ㅇ미ㅏ롬나ㅣㅇ러ㅣㅏㅁ넝리ㅏㄴ머리ㅏ넝마ㅣ롬ㄴ이ㅏ롸ㅣㄴㅇ미랴ㅗㄴ이ㅏ로님ㅇ",
        date: 1224958922
    ),
    TableItem(
        title: "짧은 cell",
        summary: "이런저런 내용이 있습니다.",
        date: 2624959999
    )
]
