require 'Date'
class User
  attr_reader :chosen_plan, :num_of_people, :departure_day, :today

  def select_plan(travel_plan)
    while true do
      print "プランを選択 > "
      select_plan = gets.to_i
      @chosen_plan = travel_plan.find { |plan| plan.id == select_plan}
      
      break if (travel_plan.first.id..travel_plan.last.id) === select_plan
      puts "#{travel_plan.first.id}から#{travel_plan.last.id}の中から選んでください。"
    end
  end

  def num_of_people_input
    puts "#{@chosen_plan.name}ですね、何人で行きますか?"

    while true do
      print "人数を入力 > "
      @num_of_people = gets.to_i
      break if @num_of_people >= 1
      puts "１人以上を入力してください"
    end
  end

  def departure_day_input
    puts "出発日を入力して下さい"

    while true do
      print "年 > "
      date_y = gets.to_i
      print "月 > "
      date_m = gets.to_i
      print "日 > "
      date_d = gets.to_i

      begin
        # 入力された出発日が有効か調べる
        @departure_day = Date.parse("#{date_y}/#{date_m}/#{date_d}")
        @today = Date.today
        break if @departure_day > today
        puts "明日以降の日付を入力してください"
      rescue
        puts "無効な日付です"
      end
    end
  end

end
