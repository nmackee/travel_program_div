class Travel_agency
  attr_reader :travel_plan

  DATE_CHECK_NUM = 0

  def initialize(travel_plan_params)
    @travel_plan = travel_plan_params.map {|param| Travel_plan.new(param)}
  end

  def disp_plan
    puts "旅行プランを洗濯してください"

    @travel_plan.each do |param, id|
      puts "#{param.id}.#{param.name}(¥#{param.price.number_with_separator}円)"
    end
  end

  def calculate_charges(chosen_plan, num_of_people, today, departure_day)
    @total_price = chosen_plan.price * num_of_people
    
     date_check(today)
     num_of_people_check(num_of_people)
     departure_day_check(departure_day, today)
    
    puts "合計金額: ¥#{@total_price.floor.number_with_separator}円"
  end

  def date_check(today)
    
    # 今日の日付が5のつく日か調べる
    if date_check = today.day.digits[0].to_s.include?(DATE_CHECK_NUM.to_s)
    
      puts "今日は#{today.strftime("%Y年%m月%d日")}です。#{DATE_CHECK_NUM}がつく日は10%割引となります。"
      @total_price *= 0.9
    end
    
  end

  def departure_day_check(departure_day, today)
    puts "出発日は#{departure_day.strftime("%Y年%m月%d日")}ですね"

    after_day = today.next_day(14)

    # 出発日が今日から14日後かどうかの処理
    if departure_day >= after_day
      @total_price *= 0.9
      puts "14日前までの予約は10%割引となります。"
    end
    
  end

  def num_of_people_check(num_of_people)
    if num_of_people >= 5
      puts "5人以上なので10%割引となります"
      @total_price *= 0.9
    end
  end

end