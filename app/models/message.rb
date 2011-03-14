class Message < ActiveRecord::Base

  def self.is_valid_message(user_id, message_id)
    #
    message= self.find_by_id(message_id)
    if message
      expected_user_id= message.user_id
      if expected_user_id.to_s!= user_id.to_s
        message= nil
      end
    end
    message
  end

#
#    def self.is_valid_shop(user_id, shop_id)
#   ## product= self.find_by_id(product_id)
#    shop= self.find_by_id(shop_id)
#    if shop
#      expected_user_id= shop.user_id
#      if expected_user_id.to_s!= user_id.to_s
#        shop= nil
#      end
#    end
#    shop
#  end
end
