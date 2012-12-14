class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      object.errors[attribute] << (options[:message] || "is invalid or blank")
    end
  end
end

class EmailUniquenessValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    starters = Starter.where("LOWER(email) = ?", value.downcase) - [object]
    clients = Client.where("LOWER(email) = ?", value.downcase) - [object]
    if clients.any? || starters.any?
      object.errors[attribute] << (options[:message] || "has already been taken")
    end
  end
end



