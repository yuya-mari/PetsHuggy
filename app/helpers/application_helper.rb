module ApplicationHelper
  
  def controller?(controller)
    controller.include?(params[:controller]) #controller?関数は、引数が現在のcontrollerと一致していた場合trueを返す。
  end
  
  def action?(action)
    action.include?(params[:action])
  end
  
end
