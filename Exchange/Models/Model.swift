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
    let Nominal: Double
    let Name: String
    let Value: Double
}


struct C: Decodable {
    var AUD: B
    var AZN: B
    var GBP: B
    var AMD: B
    var BYN: B
    var BGN: B
    var BRL: B
    var HUF: B
    var VND: B
    var HKD: B
    var GEL: B
    var DKK: B
    var AED: B
    var USD: B
    var EUR: B
    var EGP: B
    var INR: B
    var KZT: B
    var CAD: B
    var QAR: B
    var KGS: B
    var CNY: B
    var MDL: B
    var NZD: B
    var NOK: B
    var PLN: B
    var RON: B
    var XDR: B
    var SGD: B
    var TJS: B
    var THB: B
    var TRY: B
    var TMT: B
    var UZS: B
    var UAH: B
    var CZK: B
    var SEK: B
    var CHF: B
    var RSD: B
    var ZAR: B
    var KRW: B
    var JPY: B
}



// Test
struct ValuteScreen {
    var name: String
    var ticker: String
    var value: Double
    var imgURL: String
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




enum ImgCoutries: String {
    
    case AUD = "https://cdn.britannica.com/78/6078-050-18D5DEFE/Flag-Australia.jpg"
    case AZN = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Azerbaijan.svg/2560px-Flag_of_Azerbaijan.svg.png"
    case GBP = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/1280px-Flag_of_the_United_Kingdom_%283-5%29.svg.png"
    case AMD = "https://cdn.britannica.com/11/4711-050-21AC717B/Flag-Armenia.jpg"
    case BYN = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Flag_of_Belarus.svg/1200px-Flag_of_Belarus.svg.png"
    case BGN = "https://media.istockphoto.com/id/1130450626/ru/векторная/болгарский-национальный-флаг-векторная-иллюстрация-софия.jpg?s=612x612&w=0&k=20&c=jz6XG8po2kjPSNOuTc41f6vA4OeauS2Ile1yZxLCJVM="
    case BRL = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/2560px-Flag_of_Brazil.svg.png"
    case HUF = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/2560px-Flag_of_Hungary.svg.png"
    case VND = "https://www.flagistrany.ru/data/flags/w1600/vn.png"
    case HKD = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/1200px-Flag_of_Hong_Kong.svg.png"
    case GEL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToV4LlLKZvN2mmLFIVzepzW7MNuSmRDgrnfw&s"
    case DKK = "https://www.worldatlas.com/img/flag/dk-flag.jpg"
    case AED = "https://flagpedia.net/data/flags/w1600/ae.png"
    case USD = "https://uxwing.com/wp-content/themes/uxwing/download/flags-landmarks/united-states-flag-icon.png"
    case EUR = "https://www.cosv.org/wp-content/uploads/2014/06/UE.jpg"
    case EGP = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/2560px-Flag_of_Egypt.svg.png"
    case INR = "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1024px-Flag_of_India.svg.png"
//    case TDR = "18"
    case KZT = "https://akorda.kz/assets/media/flag_mediumThumb.jpg"
    case CAD = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldatlas.com%2Fflags%2Fcanada&psig=AOvVaw3c-R82fKVzgkIc6-DxF9de&ust=1725779441649000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJDSicajsIgDFQAAAAAdAAAAABAE"
    case QAR = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.britannica.com%2Ftopic%2Fflag-of-Qatar&psig=AOvVaw3LFOMFtYHT1F_3yF0wi_IA&ust=1725779453403000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKChzsujsIgDFQAAAAAdAAAAABAE"
    case KGS = "https://upload.wikimedia.org/wikipedia/commons/7/77/Flag_of_Kyrgyzstan_%281992-2023%29.png"
    case CNY = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlG2CyVOJlDDipzpgS6ddAQZiiP0nHfkX1xQ&s"
    case MDL = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Moldova.svg/1800px-Flag_of_Moldova.svg.png"
    case NZD = "https://upload.wikimedia.org/wikipedia/commons/3/3e/Flag_of_New_Zealand.svg"
    case NOK = "https://upload.wikimedia.org/wikipedia/commons/f/f1/Flag_of_Norway.png"
    case PLN = "https://www.flagistrany.ru/data/flags/w1600/pl.png"
    case RON = "https://www.countryflags.com/wp-content/uploads/romania-flag-png-large.png"
    case SGD = "https://www.countryflags.com/wp-content/uploads/singapore-flag-png-large.png"
    case TJS = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Flag_of_Tajikistan.PNG"
    case THB = "https://www.countryflags.com/wp-content/uploads/thailand-flag-png-large.png"
    case TRY = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo2kOKzMLhxNdpczBQo1LPzLvWNfzTCmylEQ&s"
    case TMT = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgJtBkYBew-MDCZ-jIGjQCDbdToPvbWc89uA&s"
    case UZS = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Flag_of_Uzbekistan.png/1200px-Flag_of_Uzbekistan.png"
    case UAH = "https://www.google.com/url?sa=i&url=https%3A%2F%2Ffaberlic1.ru%2Foceanum%2Fflag-uah%2F&psig=AOvVaw29nBxO2gmRjE1aUeqGJ7Xe&ust=1725779808252000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJC6-PSksIgDFQAAAAAdAAAAABAE"
    case CZK = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Czech_Flag_16-9_ratio.svg/1920px-Czech_Flag_16-9_ratio.svg.png"
    case SEK = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGx8mHHDdWh3DcSVzRkkKDyQZ1Jg4UfRXRDQ&s"
    case CHF = "https://cdn-icons-png.flaticon.com/512/555/555582.png"
    case RSD = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Flag_of_Serbia.svg/1200px-Flag_of_Serbia.svg.png"
    case ZAR = "https://www.flagistrany.ru/data/flags/w580/za.png"
    case KRW = "https://upload.wikimedia.org/wikipedia/commons/0/0f/Flag_of_South_Korea.png"
    case JPY = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/2560px-Flag_of_Japan.svg.png"

}
