//
//  MockLoader.swift
//  AstronomyTests
//
//  Created by Sean Acres on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import Astronomy

struct MockLoader: NetworkDataLoader {
    
    var data: Data?
    var error: Error?
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
}
