//
//  TableItem.swift
//  ProjectManager
//
//  Created by 강경 on 2021/06/29.
//

import UIKit
import MobileCoreServices

final class TableItem: NSObject, Codable {
    let title: String
    let summary: String
    let date: Double
    
    init(title: String,
         summary: String,
         date: Double) {
        self.title = title
        self.summary = summary
        self.date = date
    }
}

extension TableItem : NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [String(kUTTypeData)]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
        return progress
    }
}

extension TableItem : NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [String(kUTTypeData)]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> TableItem {
        do {
            let tableItem = try JSONDecoder().decode(TableItem.self, from: data)
            return tableItem
        } catch {
            fatalError()
        }
    }
}

