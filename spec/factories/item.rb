FactoryBot.define do

  factory :item do
    item_name             {"商品の名前"}
    price                 {"99999"}
    discription           {"商品の説明"}
    size                  {"999"}
    status                {"商品状態"}
    delivery_charge       {"999"}
    area                  {"大阪府"}
    shipping_date         {"7"}
    shipping_method       {"発送方法"}
  end

end