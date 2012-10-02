module Spree
  class Digital < ActiveRecord::Base
    belongs_to :variant
    has_many :digital_links, :dependent => :destroy

    attr_accessible :variant_id, :attachment, :file_url

  end
end
