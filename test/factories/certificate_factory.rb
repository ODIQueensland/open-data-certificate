FactoryGirl.define do
  
  factory :certificate do
    response_set

    factory :published_certificate do
      published true
    end
  end

  factory :certificate_with_dataset, :class => Certificate do
    name "Test certificate"
    response_set { FactoryGirl.create(:response_set_with_dataset) }

    factory :published_certificate_with_dataset do
      published true
      attained_level "basic"
      response_set {FactoryGirl.create(:response_set_with_dataset, aasm_state: 'published')}
    end
  end

end