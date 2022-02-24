//
//  Deck.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/23.
//

import Foundation

//카드의 모음인 Deck
//Deck에서 카드를 뽑거나 shuffle을 한다면 해당 Deck참조를 가지고 있는 모든 객체들의 값이 바뀌어야 하므로 Struct대신 Class로 구현했다.
class Deck {

    //reset시 다시 Card의 배열을 생성해서 값을 바꾸는것보다 초깃값을 가지는 프로퍼티를 하나더 만들어서 reset시 초기값을 넣어주는 형태를 생각해 봤다.
    private var defaultCards:[Card]
    private var usedCards:[Card]
    var count:Int  { self.usedCards.count }    //Deck안에 있는 Card들은 함수의 호출에 따라 값이 달라지므로 computedproperty로 정의했다.
    
    init(cards:[Card]) {
        self.defaultCards = cards
        self.usedCards = cards
    }
    
    //MARK: -- 함수들. 함수가 실행될 시 제대로 작동이 되는지 확인을 하기위해 리턴값으로 예상되는 값의 타입을 리턴해보았다
    
    //Knuth Shuffle방법은 각 반복마다 남은 element를 셀 필요가 없으므로 Fisher-Yates shuffle보다 시간복잡도 면에서 더 좋을것 같아 택했다.
    func shuffle() -> [Card] {
        for cardIndex in 0..<self.count {
            let randomIndex = Int.random(in: cardIndex..<self.count)      //card의 index범위 내에서 랜덤한 index를 뽑고
            usedCards.swapAt(cardIndex, randomIndex)                      //Array의 기능중 하나인 Swap을 이용 교체한다.
        }
        return self.usedCards
    }
    
    func removeOne() -> Card {
        let removedCard = usedCards.removeLast()
        return removedCard
    }
    
    //사용한 card들을 초기 값으로 바꾸어줌으로써 reset함.
    func reset() -> [Card] {
        self.usedCards = self.defaultCards
        return defaultCards
    }
}
