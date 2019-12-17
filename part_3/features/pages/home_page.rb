class HomePage < SitePrism::Page
  set_url 'https://amaro.com/'

  element :footer_home, '.app__footer__primary'
  element :icon_login, '.i-user'


  def has_page_loaded?
    has_footer_home?
  end

  def click_login
    icon_login.click
  end

end