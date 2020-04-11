class ShippingMethod < ActiveHash::Base
  self.data = [
    {id: 1, name: "ゆうメール"},
    {id: 2, name: "ゆうパケット"},
    {id: 3, name: "クリックポスト"},
    {id: 4, name: "ゆうパック"},
    {id: 5, name: "宅急便"},
    {id: 6, name: "普通郵便"},
    {id: 7, name: "レターパック"},
    {id: 8, name: "ゆうゆうフリマ便"},
    {id: 9, name: "らくらくフリマ便"},
  ]
end

