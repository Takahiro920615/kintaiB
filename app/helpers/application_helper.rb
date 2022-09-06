module ApplicationHelper
 
# full_titleヘルパーメソッド　page_nameが空白かどうか検証している
  def full_title(page_name = "")
    base_title = "KintaiApp"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
end
