# frozen_string_literal: true

require_relative 'game_manager'
require_relative 'bj_player'
require_relative 'deck'
require_relative 'dealer'
require_relative 'player'
require_relative 'cpu'

# 実行部(メインファイルなら以下実行)-----------------------------------------------------------------------
if __FILE__ == $PROGRAM_NAME
  # チップの空枚数 5以下(最小bet10以上)
  CHIPS_EMPTY = 5
  # インスタンス化
  bj_game_manager = GameManager.new('BJ_game_manager')
  deck_obj = Deck.new('BJ_deck')
  player = Player.new('Player')
  dealer = Dealer.new('Dealer')
  # CPUを入力の数だけインスタンス化しオブジェクトをcpu_obj_arr配列に格納
  cpu_obj_arr = []
  bj_game_manager.asking_cpu_num
  bj_game_manager.number_of_cpu.times { |i| cpu_obj_arr << CPU.new("CPU_#{i + 1}") }

  # MainLoop_start-----------------------------------------------------------------------
  loop do
    bj_game_manager.start_log

    # インスタンス変数一部 ループ開始時初期化
    deck_obj.loop_init
    player.loop_init
    dealer.loop_init
    cpu_obj_arr.each(&:loop_init)

    # デッキ配列生成
    deck_obj.deck_making

    # debug
    player.show_chips
    bj_game_manager.asking_bet_values(player)
    player.show_bets

    # 初期の2枚手札配り(引数:デッキ,参加者obj)
    2.times do
      deck_obj.dealing(player)
      deck_obj.dealing(dealer)
      cpu_obj_arr.each { |cpu| deck_obj.dealing(cpu) }
    end

    # 点数計算
    player.calculate
    dealer.calculate
    cpu_obj_arr.each(&:calculate)

    # 点数とハンド表示
    player.show_hand
    dealer.show_one_hand
    player.show_score

    # ドロー
    player.player_draw(deck_obj) # 入力部
    dealer.dealer_draw(deck_obj)
    cpu_obj_arr.each { |cpu| cpu.cpu_draw(deck_obj) }

    # CPU勝敗判定
    dealer.show_score
    cpu_obj_arr.each do |cpu|
      cpu.show_hand
      cpu.show_score
      bj_game_manager.win_or_lose(cpu, dealer)
    end
    # プレイヤー勝敗判定
    dealer.show_score
    player.show_hand
    player.show_score
    bj_game_manager.win_or_lose(player, dealer)

    # チップ支払い
    player.return_chips

    # プレイヤーのチップ有無でbreak
    if player.chips <= CHIPS_EMPTY
      player.chips_empty_log
      break
    end
  end
  # MainLoop_end-----------------------------------------------------------------------

  # BJ終了
  bj_game_manager.end_log
  exit
end
