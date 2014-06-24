require 'test_helper'

class CallbacksControllerTest < ActionController::TestCase
  # test "should get callback" do
  #   get :callback
  #   assert_response :success
  # end

  test "should not create photos" do
    allow_any_instance_of(Event).to receive(:fetch_recent_photos).exactly(0).times
    assert_difference 'Photo.count', 0 do
      post :callback, {
        "_json"=>[{
          "changed_aspect"=>"media",
          "object"=>"tag",
          "object_id"=>"marctest",
          "time"=>1403393505,
          "subscription_id"=>1,
          "data"=>{}
        }],
        "callback"=>{
          "_json"=>[{
            "changed_aspect"=>"media",
            "object"=>"tag",
            "object_id"=>"marctest",
            "time"=>1403393505,
            "subscription_id"=>1,
            "data"=>{}
          }]
        }
      }
      assert_response :success
    end
  end

  test "should create 1 photo" do
    Event.create!(hashtag: "marctest")
    post :callback, {
      "_json"=>[{
        "changed_aspect"=>"media",
        "object"=>"tag",
        "object_id"=>"marctest",
        "time"=>1403393505,
        "subscription_id"=>1,
        "data"=>{}
      }],
      "callback"=>{
        "_json"=>[{
          "changed_aspect"=>"media",
          "object"=>"tag",
          "object_id"=>"marctest",
          "time"=>1403393505,
          "subscription_id"=>1,
          "data"=>{}
        }]
      }
    }
    assert_response :success
  end
end
