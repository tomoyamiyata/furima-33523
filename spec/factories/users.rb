FactoryBot.define do

  factory :user do
    nick_name              {"tarou"}
    password              {"123456mt"}
    password_confirmation {password}
    email               {"a@a"}
    last_name           {"山田"}
    last_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end
end