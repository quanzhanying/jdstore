module Account::UsersHelper
  def enter_category
     if current_user.gender == 'false' && current_user.is_fitting == false
        products_path(category: "男性健身餐")
     elsif current_user.gender == 'true' && current_user.is_fitting == false
        products_path(category: "女性健身餐")
     elsif  current_user.is_fitting == true
        products_path(category: "随心")
    end
  end
end
