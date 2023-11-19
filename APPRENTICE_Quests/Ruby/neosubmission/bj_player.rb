class BJ_player
  BLACKJACK_SCORE = 21
  AUTO_DRAW_LIMIT_SCORE = 17
  DEFAULT_CHIPS = 1000

  attr_accessor :name, :hand, :score, :chips, :bets, :is_bust, :is_bj, :win_lose_draw_status, :action_status

  def initialize(name)
    # ループしても変更を保持
    @name = name
    @chips = DEFAULT_CHIPS
    # ループ毎に初期化
    @hand = []
    @score = 0
    @bets = 0
    @is_bust = false
    @is_bj = false
    @win_lose_draw_status = nil # :win or :draw or :lose
    @action_status = nil
  end

  # ループ初期化メソッド
  def loop_init
    @hand = []
    @score = 0
    @bets = 0
    @is_bust = false
    @is_bj = false
    @win_lose_draw_status = nil # :win or :draw or :lose
    @action_status = nil
  end

  # 得点計算、バースト判定メソッド
  def calculate
    sum = 0
    ace_count = 0
    score_ten = ['10', 'J', 'Q', 'K']

    @hand.each do |hand|
      num_str = hand[0]
      if score_ten.include?(num_str)
        num = 10
      elsif num_str == 'A'
        num = 11
        ace_count += 1
      else
        num = num_str.to_i
      end
      sum += num
    end
    # Aの場合分け処理 sum > 21 ならAを1として計算
    ace_count.times do
      if sum > BLACKJACK_SCORE
        sum -= 10
      end
    end
    @score = sum

    # バースト、21判定
    if @score > BLACKJACK_SCORE
      @is_bust = true
    elsif @score == BLACKJACK_SCORE
      @is_bj = true
    end
  end

  # チップ公開メソッド
  def show_chips
    puts "現在の#{@name}のチップ数は#{@chips}です。"
  end

  # ベット額公開メソッド
  def show_bets
    puts "#{@name}のベット額は#{@bets}です。"
  end

  # 点数公開メソッド
  def show_score
    puts "#{@name}の現在の得点は#{@score}です。"
  end

  # 手札公開メソッド
  def show_hand
    puts "#{@name}の手札は#{@hand}です。"
  end

  # ドロー公開メソッド
  def show_latest_draw
    puts "#{@name}の引いたカードは#{@hand[-1]}です。"
  end

  # チップ空ログ
  def chips_empty_log
    puts 'チップが無くなりました！'
  end

  # 勝敗チップ獲得メソッド
  def return_chips
    # 勝敗状態とアクション状態で分岐
    back_chips = 0
    case @win_lose_draw_status
    when :win
      back_chips = @bets * 2
      puts "チップを#{back_chips}獲得しました！"
    when :lose
      case @action_status
      when :surrender
        back_chips = @bets / 2
        puts "サレンダーを選択したのでチップが#{back_chips}返却されました。"
      end
    when :draw
      back_chips = @bets
      puts "引き分けなのでチップが#{back_chips}返却されました。"
    end
    # チップに書き込む
    @chips += back_chips
  end
end
