require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /singup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Pitty", email: "pitty@bol.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      #dado que eu tenho um novo usuario
      payload = { name: "João da silva", email: "joao@ig.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      # e o email desse usuario ja foi cadastrado no sistema
      Signup.new.create(payload)

      # quando faço uma requisição para a rota /signup
      @result = Signup.new.create(payload)
    end

    it "deve retornar 409" do
      # então deve retornar 409
      expect(@result.code).to eql 409
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  context "nome e obrigatorio" do
    before(:all) do
      payload = { name: "", email: "joao@ig.com.br", password: "pwd123" }

      @result = Signup.new.create(payload)
    end

    it "deve retornar 412" do
      expect(@result.code).to eql 412
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "required name"
    end
  end

  context "email e obrigatorio" do
    before(:all) do
      payload = { name: "joão", email: "", password: "pwd123" }

      @result = Signup.new.create(payload)
    end

    it "deve retornar 412" do
      expect(@result.code).to eql 412
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "required email"
    end
  end

  context "password e obrigatorio" do
    before(:all) do
      payload = { name: "joão", email: "joao@gmail.com", password: "" }

      @result = Signup.new.create(payload)
    end

    it "deve retornar 412" do
      expect(@result.code).to eql 412
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "required password"
    end
  end
end
