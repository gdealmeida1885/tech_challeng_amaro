Before do |scenario|
  Capybara.reset_sessions!
end

After do |scenario|
  sufix = ('error' if scenario.failed?) || 'success'

  name = scenario.name.tr(' ','_').tr(',()#','').downcase

  page.save_screenshot("features/reports/screenshot/#{sufix}-#{name}.png")

  embed("features/reports/screenshot/#{sufix}-#{name}.png", 'image/png', 'Screenshot')
end