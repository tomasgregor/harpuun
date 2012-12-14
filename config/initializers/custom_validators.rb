class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      object.errors[attribute] << (options[:message] || "is blank or invalid")
    end
  end
end

class EmailUniquenessValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if Client.where("LOWER(email) = ?", value.downcase).any? || Starter.where("LOWER(email) = ?", value.downcase).any?
      object.errors[attribute] << (options[:message] || "has already been taken")
    end
  end
end



