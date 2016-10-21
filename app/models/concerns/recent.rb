module Recent
  extend ActiveSupport::Concern

  module ClassMethods
    def recent(count)
      order(created_at: :desc).first(count)
    end
  end
end
