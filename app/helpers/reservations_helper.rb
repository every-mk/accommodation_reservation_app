module ReservationsHelper
  def stay_days(start_date, end_date)
    (end_date - start_date).to_i;
  end

  def total_charge(peoples, stay_days, price)
    peoples * stay_days * price;
  end
end
