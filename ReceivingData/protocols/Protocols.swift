//
//  Protocols.swift
//  ReceivingData
//
//  Created by Зехниддин on 07/01/21.
//

import Foundation

protocol BindingProtocol {
    func onReceived<T>(value: T)
}
