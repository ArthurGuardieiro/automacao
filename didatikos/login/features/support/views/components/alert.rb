class Alert
  include Capybara::DSL

  def title
    return find(".alert-title").text
  end

  def content
    return find(".alert-content").text
  end
end
