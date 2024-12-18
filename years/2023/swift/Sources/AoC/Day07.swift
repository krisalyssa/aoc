/******************************************************************************
 **
 ** Copyright (c) 2023-2024 Kris Cottingham.
 ** Licensed under the MIT License.
 **
 ** See https://github.com/krisalyssa/swift-aoc-common/blob/main/LICENSE
 ** for license information.
 **
 **/

import AoCCollections
import AoCCommon
import AoCExtensions
import CoreLibraries

public class Day07: Day {
  public init() {}

  public enum HandType: Comparable {
    case highCard
    case onePair
    case twoPair
    case threeOfAKind
    case fullHouse
    case fourOfAKind
    case fiveOfAKind
  }

  public class Hand: Comparable {
    let cards: String
    var bid: Int? = nil

    init(cards: String, bid: Int? = nil) {
      self.cards = cards
      self.bid = bid
    }

    lazy var type = _type()
    lazy var values = _values()

    public func winnings(forRank rank: Int) -> Int? {
      if bid == nil { return nil }
      return bid! * rank
    }

    internal func _cardCounts() -> CountingSet<Character> {
      CountingSet<Character>(cards)
    }

    internal func _signature() -> [Int] {
      return _cardCounts().values.sorted().reversed()
    }

    internal func _type() -> HandType { .highCard }

    internal func _values() -> [Int] { [] }

    public static func == (lhs: Day07.Hand, rhs: Day07.Hand) -> Bool {
      if lhs.type != rhs.type { return false }
      return lhs.values == rhs.values
    }

    public static func < (lhs: Day07.Hand, rhs: Day07.Hand) -> Bool {
      if lhs.type == rhs.type {
        for (a, b) in zip(lhs.values, rhs.values) {
          if a != b { return a < b }
        }
        return false
      }

      return lhs.type < rhs.type
    }
  }

  public class HandPart1: Hand {
    override func _type() -> HandType {
      switch _signature()
      {
      case [5]:
        return .fiveOfAKind

      case [4, 1]:
        return .fourOfAKind

      case [3, 2]:
        return .fullHouse

      case [3, 1, 1]:
        return .threeOfAKind

      case [2, 2, 1]:
        return .twoPair

      case [2, 1, 1, 1]:
        return .onePair

      default:
        return .highCard
      }
    }

    override func _values() -> [Int] {
      cards.map({
        switch $0 {
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        case "T": return 10
        case "J": return 11
        case "Q": return 12
        case "K": return 13
        case "A": return 14
        default: return 0
        }
      })
    }
  }

  public class HandPart2: Hand {
    override func _type() -> HandType {

      switch _signature()
      {
      case [5]:
        return .fiveOfAKind

      case [4, 1]:
        if cards.contains("J") {
          return .fiveOfAKind
        } else {
          return .fourOfAKind
        }

      case [3, 2]:
        if cards.contains("J") {
          return .fiveOfAKind
        } else {
          return .fullHouse
        }

      case [3, 1, 1]:
        if cards.contains("J") {
          return .fourOfAKind
        } else {
          return .threeOfAKind
        }

      case [2, 2, 1]:
        if cards.contains("J") {
          if _cardCounts()["J"] == 2 {
            return .fourOfAKind
          } else {
            return .fullHouse
          }
        } else {
          return .twoPair
        }

      case [2, 1, 1, 1]:
        if cards.contains("J") {
          return .threeOfAKind
        } else {
          return .onePair
        }

      default:
        if cards.contains("J") {
          return .onePair
        } else {
          return .highCard
        }
      }
    }

    override func _values() -> [Int] {
      cards.map({
        switch $0 {
        case "J": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        case "T": return 10
        case "Q": return 12
        case "K": return 13
        case "A": return 14
        default: return 0
        }
      })
    }
  }

  public func part1(_ input: Input) {
    let data = input.asStringArray()

    let total = data.map({ Day07.parseLinePart1($0)! }).sorted().enumerated().map({ rank, hand in
      hand.winnings(forRank: rank + 1)!
    }).sum()

    print("day 07 part 1: \(total)")
  }

  public func part2(_ input: Input) {
    let data = input.asStringArray()

    let total = data.map({ Day07.parseLinePart2($0)! }).sorted().enumerated().map({ rank, hand in
      hand.winnings(forRank: rank + 1)!
    }).sum()

    print("day 07 part 2: \(total)")
  }

  static func parseLinePart1(_ line: String) -> Hand? {
    if let match = line.firstMatch(of: #/([2-9TJQKA]+)\s+(\d+)/#) {
      return HandPart1(cards: String(match.1), bid: Int(match.2)!)
    }

    return nil
  }

  static func parseLinePart2(_ line: String) -> Hand? {
    if let match = line.firstMatch(of: #/([2-9TJQKA]+)\s+(\d+)/#) {
      return HandPart2(cards: String(match.1), bid: Int(match.2)!)
    }

    return nil
  }
}
