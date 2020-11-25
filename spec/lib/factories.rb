require "faker"
require_relative "../models/user_model"

FactoryBot.define do

    factory :novoUsuario, class: UserModel do
        full_name {"Tom Mason"}
        email {"mason@gmail.com"}
        password {"pwd123"}

        after(:build) do |user| #ExcluirNoBanco
            Database.new.delete_user(user.email)
        end
    end

    factory :usuarioExistente, class: UserModel do
        id { 0 }
        full_name { Faker::Movies::StarWars.character }
        email { Faker::Internet.free_email(name:full_name) }
        password {"pwd123"}
    
        after(:build) do |user|
          Database.new.delete_user(user.email)
          result = ApiUser.create(user.to_hash)
          user.id = result.parsed_response["id"]
        end
    end

    factory :emailInvalido, class: UserModel do
        full_name {"Tom Mason"}
        email {"mason#gmail.com"}
        password {"pwd123"}
    end

    factory :nomeVazio, class: UserModel do
        full_name {""}
        email {"mason@gmail.com"}
        password {"pwd123"}
    end

    factory :emailVazio, class: UserModel do
        full_name {"Tom Mason"}
        email {""}
        password {"pwd123"}
    end

    factory :senhaVazia, class: UserModel do
        full_name {"Tom Mason"}
        email {"mason@gmail.com"}
        password {""}
    end

    factory :nomeNulo, class: UserModel do
        full_name {nil}
        email {"mason@gmail.com"}
        password {"pwd123"}
    end

    factory :emailNulo, class: UserModel do
        full_name {"Tom Mason"}
        email {nil}
        password {"pwd123"}
    end

    factory :senhaNula, class: UserModel do
        full_name {"Tom Mason"}
        email {"mason@gmail.com"}
        password {nil}
    end
end