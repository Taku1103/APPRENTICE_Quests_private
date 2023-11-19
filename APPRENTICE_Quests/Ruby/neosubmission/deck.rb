# require_relative 'bj_player'

class Deck
  attr_accessor :name, :used_cards

  def initialize(name)
    @name = name
    # ループ毎に初期化
    @used_cards = []
  end

  # ループ初期化
  def loop_init
    @used_cards = []
  end

  # デッキ作成メソッド
  def deck_making
    deck_arr = []
    suits = ['Heart', 'Diamond', 'Club', 'Spade']
    nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    suits.each do |suit|
      nums.each do |num|
        deck_arr << [num, suit]
      end
    end
    return deck_arr
  end

  # デッキからランダムカード排出メソッド（被り無し）
  def select_card(deck)
    available_cards = deck - @used_cards   # 配列の差分
    selected_card = available_cards.sample # ランダム1枚
    @used_cards << selected_card           # 使用したカードを記録
    return selected_card
  end

  # 配布メソッド
  def dealing(deck, bj_player_obj)
    bj_player_obj.hand << select_card(deck)
  end
end
