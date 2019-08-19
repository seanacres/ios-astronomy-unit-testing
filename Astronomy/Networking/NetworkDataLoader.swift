//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by Sean Acres on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}
