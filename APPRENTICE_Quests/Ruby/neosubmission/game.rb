class Game
  attr_accessor :name, :number_of_cpu

  def initialize(name)
    @name = name
    @number_of_cpu = 0
  end

  # 開始ログメソッド
  def start_log
    puts 'ブラックジャックを開始します。'
  end

  # 終了ログメソッド
  def end_log
    puts 'ブラックジャックを終了します。'
  end

  # CPU人数確認メソッド
  def asking_cpu_num
    puts 'CPUの参加人数を選んでください(0 ~ 2)'
    cpu_num_str = gets.chomp
    @number_of_cpu = Integer(cpu_num_str) # to_iだと0が返ってしまう
    case @number_of_cpu
    when 0, 1, 2
      puts "CPUは#{@number_of_cpu}人です"
    else
      raise '0~2を入力してください'
    end
  rescue ArgumentError
    puts '0~2を入力してください'
    retry
  rescue StandardError => e
    puts e.message
    retry
  end

  # ベット額確認メソッド
  def asking_bet_values(player_obj)
    loop do
      puts "bet額を指定してください(1 ~ #{player_obj.chips}以下の正の10の倍数)"
      bet_values = gets.chomp.to_i
      # 文字列を整数に変換
      if bet_values <= 0
        raise '正の整数を指定してください'
      end

      if bet_values > player_obj.chips || bet_values % 10 != 0
        raise "手持ちチップの#{player_obj.chips}以下の正の10の倍数の額を指定してください"
      end

      # ここに到達すると、条件をすべて満たしている
      player_obj.bets = bet_values
      player_obj.chips -= bet_values
      break
    rescue ArgumentError
      puts '正の整数を指定してください'
    rescue StandardError => e
      puts e.message
    end
  end

  # 勝敗判定メソッド
  def win_or_lose(player_obj, dealer_obj)
    if player_obj.action_status != :surrender
      if player_obj.is_bust || dealer_obj.is_bust
        handle_bust(player_obj, dealer_obj)
      else
        handle_score(player_obj, dealer_obj)
      end
    end
  end

  # バースト勝敗判定
  def handle_bust(player_obj, dealer_obj)
    if player_obj.is_bust && dealer_obj.is_bust
      puts "両者バーストです！#{player_obj.name}は引き分けです！"
      player_obj.win_lose_draw_status = :draw
    elsif dealer_obj.is_bust
      puts "#{dealer_obj.name}のバーストです！#{player_obj.name}の勝ちです！"
      player_obj.win_lose_draw_status = :win
    elsif player_obj.is_bust
      puts "#{player_obj.name}のバーストです！#{player_obj.name}の負けです！"
      player_obj.win_lose_draw_status = :lose
    end
  end

  # 点数勝敗判定
  def handle_score(player_obj, dealer_obj)
    diff_score_player = BJ_player::BLACKJACK_SCORE - player_obj.score
    diff_score_dealer = BJ_player::BLACKJACK_SCORE - dealer_obj.score
    if diff_score_player < diff_score_dealer
      puts "#{player_obj.name}の勝ちです！"
      player_obj.win_lose_draw_status = :win
    elsif diff_score_player == diff_score_dealer
      puts "#{player_obj.name}は引き分けです！"
      player_obj.win_lose_draw_status = :draw
    elsif diff_score_player > diff_score_dealer
      puts "#{player_obj.name}の負けです！"
      player_obj.win_lose_draw_status = :lose
    end
  end
end
