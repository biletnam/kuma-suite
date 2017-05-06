class Ticket < ApplicationRecord
  belongs_to :department
  belongs_to :client
  # has_many :comments, dependent: :destroy
  # has flag
  # has priority
  # has status

  validates :title, presence: { message: 'must be present!' }
  validates :body, presence: { message: 'must be present!' }
  validates :department, { presence: true}

  private

  def set_defaults
    self.status ||= nil
  end
end

# new ticket
# department TECH SUP
# title      TITLE
# body       BODY
# agent      AGENTNAME
# client     CLIENTNAME
# email      CLIENT EMAIL
# created
# updated
#
# can set:
# flag     TYPE
# priority HIGH
# status   COMPLETE
