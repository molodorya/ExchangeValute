//
//  Model.swift
//  Exchange
//
//  Created by Nikita Molodorya on 03.11.2023.
//
import UIKit
import Foundation


struct A: Decodable {
    let Valute: C
}


struct B: Decodable {
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
}


struct C: Decodable {
    var USD: B
}




enum UnicodeValue: String {
    case RUB = "₽"
    case USD = "$"
    case EUR = "€"
    case CHF = "₣"
    case GBR = "£"
    case JPY = "¥"
//    case CNY = "¥"
    case KZT = "₸"
    case BYN = "Br"
    case UAH = "₴"
    case TRY = "₺"
}
