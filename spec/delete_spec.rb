describe "delete" do

    context "quando eu tenho um usuário cadastrado" do
        let(:user) { build(:usuarioExistente) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.remove(token, user.id) }

        it { expect(result.response.code).to eql "204" }
    end

    context "quando usuário não existe" do
        let(:user) { build(:usuarioExistente) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.remove(token, "0") }

        it { expect(result.response.code).to eql "404" }
    end

    context "quando busco um id inválido" do
        let(:user) { build(:usuarioExistente) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.remove(token, "abc123") }

        it { expect(result.response.code).to eql "412" }
    end
end