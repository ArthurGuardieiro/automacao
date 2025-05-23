describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do # (:all) faz rodar apenas uma única vez para todos os exemplos
      payload = { email: "betao@yahoo.com", password: "pwd123" }

      @result = Sessions.new.login(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  # examples = [
  #   {
  #     title: "senha incorreta",
  #     payload: { email: "betao@yahoo.com", password: "123" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "usuario nao existe",
  #     payload: { email: "404@yahoo.com", password: "123" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "email em branco",
  #     payload: { email: "", password: "123" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "sem o campo email",
  #     payload: { password: "123" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "senha em branco",
  #     payload: { email: "betao@yahoo.com", password: "" },
  #     code: 412,
  #     error: "required password",
  #   },
  #   {
  #     title: "sem o campo senha",
  #     payload: { email: "betao@yahoo.com" },
  #     code: 412,
  #     error: "required password",
  #   },
  # ]

  examples = Helpers::get_fixture("login")

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do # (:all) faz rodar apenas uma única vez para todos os exemplos
        @result = Sessions.new.login(e[:payload])
      end

      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida id do usuário" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
