# require_relative 'bj_player'

class Player < BJ_player
  # ドロー入力受付メソッド
  def player_draw(deck_obj, deck)
    loop do # スタンド入力 or 21以上までループ
      puts 'アクションを選択してください(t:スタンド, h:ヒット,  p:スプリット（未実装）, 【以下初回のみ】d:ダブルダウン, r:サレンダー'
      action = gets.chomp
      case action
      when 't'
        puts 'スタンドです。'
        break
      when 'h'
        hit(deck_obj, deck)
        break if @is_bj || @is_bust # 21以上でbreak
      when 'd'
        if @hand.length == 2
          double_down(deck_obj, deck)
          break
        else
          puts '初回しかダブルダウン出来ません'
        end
      when 'p' # WIP
        if @hand[0][0] == @hand[1][0] && @hand.length == 2
          # split_pairs()
          puts '未実装です。' # WIP
        else
          puts '初回かペアでないとスプリット出来ません'
        end
      when 'r'
        if @hand.length == 2
          surrender
          break
        else
          puts '初回しかサレンダー出来ません'
        end
      else
        puts '無効な入力です'
      end
    end
  end

  # ヒット
  def hit(deck_obj, deck)
    puts 'ヒットです。'
    deck_obj.dealing(deck, self)
    show_latest_draw
    calculate
    show_score
  end

  # ダブルダウン
  def double_down(deck_obj, deck)
    @chips -= @bets
    @bets *= 2
    puts "ダブルダウンです。bet額を#{@bets}にします。(1度しか引けません)"
    deck_obj.dealing(deck, self)
    show_latest_draw
    calculate
    show_score
  end

  # サレンダー
  def surrender
    puts "サレンダーです。bet額の半額をチップに戻します(#{@bets / 2})"
    @action_status = :surrender
    @win_lose_draw_status = :lose
  end

  # # スプリット # WIP
  # def split_pairs(deck_obj, deck)
  #   puts 'スプリットします。'
  #   splited_hand1 = [@hand[0]]
  #   splited_hand2 = [@hand[1]]
  #   deck_obj.dealing(deck, self)
  # end
end
