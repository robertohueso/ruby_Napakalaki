#encoding: utf-8

require_relative "NumericBadConsequence"

module NapakalakiGame

class DeathBadConsequence < NumericBadConsequence

  def initialize(text)
    super(text, Player::MAXLEVEL, BadConsequence::MAXTREASURES, BadConsequence::MAXTREASURES)
  end

end

end
