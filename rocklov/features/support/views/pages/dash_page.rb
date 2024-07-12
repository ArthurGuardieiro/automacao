class DashPage
  include Capybara::DSL

  def on_dash?
    return page.have_css?(".dashboard")
  end

  def equipot_list
    return find(".equipo-list")
  end
end
