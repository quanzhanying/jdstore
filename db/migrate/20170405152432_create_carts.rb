# -*- encoding : utf-8 -*-
class CreateCarts < ActiveRecord::Migration[5.0]
    def change
        create_table :carts, &:timestamps
    end
end
