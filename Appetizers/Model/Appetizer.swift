//
//  Appetizer.swift
//  Appetizers
//
//  Created by Mehul Jain on 17/07/24.
//
import Foundation

struct Appetizer:Decodable,Identifiable{
let id:Int
let name: String
let description:String
let price:Double
let imageURL:String
let calories:Int
let carbs:Int
let protein:Int
}
struct AppetizerResponse:Decodable{
    let request:[Appetizer]
}

struct MockData{
    
    static let sampleAppetizers = Appetizer(
        id:000,
        name: "gnhtnthn1",
        description: "yummy",
        price: 99.65,
        imageURL: "",
        calories: 99,
        carbs: 99,
        protein: 99)
    static let appetizers = [sampleAppetizers,sampleAppetizers,sampleAppetizers,sampleAppetizers]
    
    static let orderItemOne = Appetizer(
        id:001,
        name: "gnhtnthn2",
        description: "yummy",
        price: 99.65,
        imageURL: "",
        calories: 99,
        carbs: 99,
        protein: 99)
    
    static let orderItemTwo = Appetizer(
        id:002,
        name: "gnhtnthn3",
        description: "yummy",
        price: 99.65,
        imageURL: "",
        calories: 99,
        carbs: 99,
        protein: 99)
    
    static let orderItemThree = Appetizer(
        id:003,
        name: "gnhtnthn",
        description: "yummy",
        price: 99.65,
        imageURL: "",
        calories: 99,
        carbs: 99,
        protein: 99)
    
    static let orderItems = [orderItemOne,orderItemTwo,orderItemThree]
}
