//
//  BundleExtension.swift
//  DeliveryApp
//
//  Created by PC156 on 2022/08/29.
//

import Foundation
import SwiftUI

extension Bundle{
    func decode<T:Decodable>(filename: String, as type : T.Type) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("Bundleに\(filename)がないです。")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("\(url)からダータを呼び出せません。")
        }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else{
            fatalError("データ複合化に失敗しました。")
        }
        return decodedData
    }
}
