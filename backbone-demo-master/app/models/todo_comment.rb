class TodoComment < ActiveRecord::Base
  attr_accessible :content, :image_url, :order_num, :todo_id

  belongs_to :todo

  validates :content, :order_num, :todo, :presence => true

  before_validation :ensure_order_num, :on => :create

  default_scope { order(:order_num) }

  private
  def ensure_order_num
    return unless self.order_num.nil?

    max_order_num = TodoComment
      .where(:todo_id => self.todo_id)
      .maximum(:order_num) || 0

    self.order_num = max_order_num + 1
  end
end
