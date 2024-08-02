require_relative "base_api"

class Equipos < BaseApi
  def create(payload)
    return self.class.post(
             "/equipos",
             body: payload,
             headers: {
               "Content-Type": "application/json",
             },
           )
  end
end
