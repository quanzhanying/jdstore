module Account::UsersHelper
  def enter_category
     if current_user.gender == "男" && current_user.is_fitting == '正在健身'
        link_to products_path(category: "男性健身餐")
     elsif current_user.gender == "女"&& current_user.is_fitting == '正在健身'
        link_to  products_path(category: "女性健身餐")
     elsif current_user.is_fitting == '不在健身'
        link_to products_path(category: "随心")
    end
  end
end
