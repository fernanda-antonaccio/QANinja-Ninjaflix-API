describe "put" do

    context "quando eu tenho um usuario cadastrado" do

        before(:all) do
            usuario_original = build(:usuarioExistente)
            token = ApiUser.token(usuario_original.email, usuario_original.password)
            @novo_usuario = build(:novoUsuario)
            @result_put = ApiUser.update(token, usuario_original.id, @novo_usuario.to_hash)
            @result_get = ApiUser.find(token, usuario_original.id)
        end

        it { expect(@result_put.response.code).to eql "200" }
        it { expect(@result_get.parsed_response["full_name"]).to eql @novo_usuario.full_name }
        it { expect(@result_get.parsed_response["email"]).to eql @novo_usuario.email }
    end
end