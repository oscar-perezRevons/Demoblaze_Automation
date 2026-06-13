require 'securerandom'

class AccountUtils
  def build_human_username
    first_name = Constants::FIRST_NAMES.sample
    last_name = Constants::LAST_NAMES.sample
    suffix = SecureRandom.hex(2)
    "#{first_name}.#{last_name}.#{suffix}"
  end

  def build_human_password
    suffix = SecureRandom.hex(2)
    "ClaveDemo2026!#{suffix}"
  end
  def resolve_dynamic_value(raw_value)
    normalized = raw_value.to_s.strip
    case normalized
    when Constants::AUTO_USER_TOKEN
      build_human_username
    when Constants::AUTO_PASS_TOKEN
      build_human_password
    else
      raw_value.to_s
    end
  end
end
