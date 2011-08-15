class NtiValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:name] << (options[:message] || "Name is not valid") unless check(record)
  end

  private

    def check(record)
      (record.name.length > 1) && (record.name.length < 35)
    end
  
end
