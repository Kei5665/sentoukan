require 'rails_helper'

RSpec.describe 'Maps', type: :system do
  describe 'マップ検索機能' do
    let!(:near_shop) { create(:shop, name: "銀座湯", address:"住所1", latitude: 35.674653305483524, longitude: 139.77025262599443) }
    let!(:far_shop) { create(:shop, name: "月島温泉", address:"住所2", latitude: 35.66375681411227, longitude: 139.78108269715878) }
    let!(:user) { create(:user) }
    let!(:near_quest) { create(:quest, user_id: user.id, shop_id: near_shop.id, latitude: near_shop.latitude, longitude: near_shop.longitude) }

    context '中心から半径2.5km以内にお店がある場合' do
      before do
        visit maps_path
        # 中心を東京駅に設定
        fill_in "latitude", with: "35.68148890786007"
        fill_in "longitude", with: "139.7671569836654"
        click_button('周辺を検索')
        expect(current_path).to eq(maps_path), 'mapsページへリダイレクトされていません'
      end
      it "ピンが表示される" do
        within('#map') do
          expect(page.all("img[src$='https://maps.gstatic.com/mapfiles/transparent.png']").count).to eq 3
        end
      end
    end
  end
end
