describe "post" do

    context "quando cadastro um novo usuário" do
        let(:result) { ApiUser.create(build(:novoUsuario).to_hash) }
        it {expect(result.response.code).to eql "200"}
    end

    context "quando um email for duplicado" do
        let(:result) { ApiUser.create(build(:usuarioExistente).to_hash) }
        it {expect(result.response.code).to eql "409"}
        it {expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address."}
    end

    context "quando um email for invalido" do
        let(:result) { ApiUser.create(build(:emailInvalido).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email."}
    end

    context "quando o nome for vazio" do
        let(:result) { ApiUser.create(build(:nomeVazio).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed"}
    end

    context "quando o email for vazio" do
        let(:result) { ApiUser.create(build(:emailVazio).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Validation notEmpty on email failed"}
    end

    context "quando a senha for vazia" do
        let(:result) { ApiUser.create(build(:senhaVazia).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Validation notEmpty on password failed"}
    end

    context "quando o nome for nulo" do
        let(:result) { ApiUser.create(build(:nomeNulo).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Users.full_name cannot be null"}
    end

    context "quando o email for nulo" do
        let(:result) { ApiUser.create(build(:emailNulo).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Users.email cannot be null"}
    end

    context "quando a senha for nula" do
        let(:result) { ApiUser.create(build(:senhaNula).to_hash) }
        it {expect(result.response.code).to eql "412"}
        it {expect(result.parsed_response["msg"]).to eql "Users.password cannot be null"}
    end
end