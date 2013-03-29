module SimpleCart
  module Model
    def itemized?
      respond_to? :item
    end
  end
end