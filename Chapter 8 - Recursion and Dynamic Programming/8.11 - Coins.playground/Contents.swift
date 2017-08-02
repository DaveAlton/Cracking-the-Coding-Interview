/*
 Given an infinite number of quarters (25 cents), dimes (10 cents), nickels (5 cents), and pennies (1 cent), write code to calculate the number of ways of representing n cents.
*/

import Foundation

enum Coin: Int {
    case quarter = 25
    case dime    = 10
    case nickel  = 5
    case penny   = 1
    
    static let all: [Coin] = [.quarter, .dime, .nickel, .penny]
}

var memo = [Int: [[Coin: Int]]]()

func coinPossibilities(cents: Int, coinsUsed: [Coin] = []) -> [[Coin: Int]] {
    guard cents > 0 else { return [[:]] }
    guard memo[cents] == nil else { return memo[cents]! }
    var coins = [[Coin: Int]]()
    for coin in Coin.all {
        if cents >= coin.rawValue && !coinsUsed.contains(coin) {
            for coinCount in 1...cents/coin.rawValue {
                for possibility in coinPossibilities(cents: cents - (coin.rawValue * coinCount), coinsUsed: coinsUsed + [coin]) {
                    var change = possibility
                    change[coin] = (change[coin] ?? 0) + coinCount
                    coins.append(change)
                }
            }
        }
    }
    memo[cents] = coins
    return coins
}

coinPossibilities(cents: 5)

coinPossibilities(cents: 6)

coinPossibilities(cents: 35)
